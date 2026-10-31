# Cách chạy Hồ Cá 3D trên Mac (bản local)

Đừng mở file home.html bằng cách nhấp đúp, vì trình duyệt mở dạng file:// sẽ chặn tải model 3D trong folder assets/.

## Bước 1: giải nén assets
- Tải assets.zip, chuyển vào đúng folder này: ~/Desktop/muse_share/island_learning/
- Nhấp đúp assets.zip để giải nén, phải ra được folder: ~/Desktop/muse_share/island_learning/assets/
- Kiểm tra trong assets/ có các file như sport-shark.glb, house-pikachu.glb, decor-crown.glb, swim-neon.glb.
- Folder này nằm cạnh file home.html, không lồng thêm 1 cấp assets nữa.

## Bước 2: chạy máy chủ local
- Mở Terminal, chạy 2 lệnh:
  cd ~/Desktop/muse_share/island_learning
  python3 -m http.server 8000
- Hoặc chạy file run.sh trong folder này bằng lệnh: bash run.sh

## Bước 3: mở game
- Mở trình duyệt (cần có mạng để tải Three.js và gọi Supabase) và vào:
  http://localhost:8000/home.html
- Lúc này cá mập, nhà thật, đồ trang trí và cá shop phải lên model thật, không còn là bản vẽ dự phòng.
- Để dừng máy chủ, quay lại Terminal và bấm Ctrl+C.

## Lưu ý
- Đảo dùng một map mặc định. Nếu file map lỗi, game giữ đảo thủ tục Đảo Học Vui gốc.
- Mỗi trình duyệt giữ 1 profile riêng theo mã trình duyệt của chính nó, đăng ký lại 1 lần nếu đổi trình duyệt.
