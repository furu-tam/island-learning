#!/bin/bash
# Chạy Hồ Cá 3D local: mở Terminal trong folder này rồi chạy: bash run.sh
cd "$(dirname "$0")"
if [ ! -d "assets" ]; then
  echo "Chưa có folder assets/ cạnh file html. Hãy giải nén assets.zip vào đúng folder này trước."
  exit 1
fi
if [ ! -f "ho-ca-3d-public.html" ]; then
  echo "Chưa có file ho-ca-3d-public.html trong folder này."
  exit 1
fi
echo "Đang chạy tại http://localhost:8000/ho-ca-3d-public.html"
echo "Nhấn Ctrl+C để dừng."
python3 -m http.server 8000
