# 📚 Hướng Dẫn Public Code Lên GitHub

## Bước 1: Tạo Repository trên GitHub

1. Đăng nhập vào [GitHub.com](https://github.com)
2. Click vào dấu **+** ở góc trên bên phải
3. Chọn **New repository**
4. Điền thông tin:
   - **Repository name**: `funny-question-website` (hoặc tên bạn muốn)
   - **Description**: "Website câu hỏi vui nhộn với animation đáng yêu"
   - Chọn **Public** (để mọi người có thể xem)
   - **KHÔNG** tích vào "Initialize with README" (vì đã có rồi)
5. Click **Create repository**

## Bước 2: Kết nối và Push code lên GitHub

Sau khi tạo repository, GitHub sẽ hiển thị hướng dẫn. Chạy các lệnh sau (thay `YOUR_USERNAME` và `YOUR_REPO_NAME`):

```bash
# Thêm remote repository
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Đổi tên branch thành main (nếu cần)
git branch -M main

# Push code lên GitHub
git push -u origin main
```

**Ví dụ:**
```bash
git remote add origin https://github.com/nguyenhuyhieu/funny-question-website.git
git branch -M main
git push -u origin main
```

## Bước 3: Deploy lên GitHub Pages (Miễn phí!)

Để website có thể truy cập trực tiếp qua link:

1. Vào repository trên GitHub
2. Click **Settings** (ở menu trên)
3. Scroll xuống phần **Pages** (bên trái)
4. Ở **Source**, chọn:
   - Branch: `main`
   - Folder: `/ (root)`
5. Click **Save**
6. Đợi vài phút, website sẽ có tại:
   `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME`

## Bước 4: Chia sẻ với người khác

Bạn có thể chia sẻ:
- **Link GitHub Pages**: `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME`
- **Link Repository**: `https://github.com/YOUR_USERNAME/YOUR_REPO_NAME`

## 🔄 Cập nhật code sau này

Khi bạn thay đổi code và muốn cập nhật lên GitHub:

```bash
git add .
git commit -m "Mô tả thay đổi của bạn"
git push
```

## 💡 Tips

- GitHub Pages sẽ tự động cập nhật sau mỗi lần push
- Có thể mất 1-2 phút để website cập nhật
- File `index.html` phải ở thư mục root để GitHub Pages hoạt động đúng
