-- Hồ Cá 3D — Supabase migration, chạy 1 lần trong Supabase Dashboard > SQL Editor
-- Project: kleagnutpocgqzfbkzkf.supabase.co
-- Thiết kế: không cho truy cập trực tiếp bảng profiles qua PostgREST.
-- Chỉ 3 hàm RPC dưới đây được gọi bằng anon key, mỗi hàm chỉ chạm đúng
-- 1 dòng có browser_key trùng với key trình duyệt gửi lên, không có hàm list.

create table if not exists public.profiles (
  browser_key text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
revoke all on public.profiles from anon, authenticated;

create or replace function public.get_profile(p_browser_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
begin
  if p_browser_key is null or p_browser_key !~ '^[A-Za-z0-9_-]{20,128}$' then
    raise exception 'invalid browser_key';
  end if;
  return (select data from public.profiles where browser_key = p_browser_key);
end;
$$;

create or replace function public.upsert_profile(p_browser_key text, p_data jsonb)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare result jsonb;
begin
  if p_browser_key is null or p_browser_key !~ '^[A-Za-z0-9_-]{20,128}$' then
    raise exception 'invalid browser_key';
  end if;
  if p_data is null or jsonb_typeof(p_data) <> 'object' then
    raise exception 'invalid profile data';
  end if;
  insert into public.profiles (browser_key, data, updated_at)
  values (p_browser_key, p_data, now())
  on conflict (browser_key)
  do update set data = excluded.data, updated_at = now()
  returning data into result;
  return result;
end;
$$;

create or replace function public.delete_profile(p_browser_key text)
returns void
language plpgsql security definer set search_path = public as $$
begin
  if p_browser_key is null or p_browser_key !~ '^[A-Za-z0-9_-]{20,128}$' then
    raise exception 'invalid browser_key';
  end if;
  delete from public.profiles where browser_key = p_browser_key;
end;
$$;

grant execute on function public.get_profile(text) to anon, authenticated;
grant execute on function public.upsert_profile(text, jsonb) to anon, authenticated;
grant execute on function public.delete_profile(text) to anon, authenticated;
