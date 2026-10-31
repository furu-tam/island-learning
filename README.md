# Đảo Học Vui

Game web tĩnh: đảo 3D, hồ cá, quiz Toán lớp 1 và lớp 6. Một file `home.html` cùng folder `assets/`.

Đảo dùng một map mặc định, **Đảo yên bình xưa** (`assets/map-peace.glb`). Nếu file map không tải được, game giữ đảo thủ tục **Đảo Học Vui gốc**.

## Chạy local

Đừng mở file HTML bằng cách nhấp đúp. Trình duyệt dạng `file://` sẽ chặn model trong `assets/`.

```bash
bash run.sh
```

Rồi mở http://localhost:8000/home.html

Cần mạng để tải Three.js và lưu hồ sơ lên Supabase. Mỗi trình duyệt có một hồ sơ riêng.

## Hồ sơ

Project Supabase: https://kleagnutpocgqzfbkzkf.supabase.co

Bảng `profiles` tạo bằng `supabase-profiles.sql`. File HTML chỉ nhúng publishable key.
