# Website Câu Hỏi Vui Nhộn 😄

Website tương tác vui nhộn với câu hỏi trêu đùa, có animation đáng yêu khi người dùng bấm nút "Có" và hiệu ứng vui nhộn khi bấm nút "Không".

## ✨ Tính năng

- 🎉 Animation trái tim và emoji bay lên khi bấm "Có"
- ✨ Trái tim lấp lánh ở giữa màn hình
- 🎊 Hiệu ứng confetti rơi
- 😄 Nút "Không" di chuyển ngẫu nhiên và thu nhỏ dần khi bấm
- 📱 Responsive, hoạt động tốt trên mọi thiết bị

## 🚀 Cách sử dụng

### Cài đặt

```bash
npm install
```

### Chạy local

```bash
npm start
```

Website sẽ tự động mở tại `http://localhost:3000`

### Hoặc chạy trực tiếp

Chỉ cần mở file `index.html` trong trình duyệt (không cần server)

## 📝 Tùy chỉnh

Bạn có thể thay đổi câu hỏi trong file `index.html`:

```html
<h1 class="question">Câu hỏi của bạn ở đây 😄</h1>
```

Thay đổi thông điệp khi bấm "Có" trong file `script.js`:

```javascript
question.textContent = 'Thông điệp của bạn! 😊';
```

## 🌐 Deploy lên GitHub Pages

1. Push code lên GitHub repository
2. Vào Settings > Pages
3. Chọn branch `main` và folder `/ (root)`
4. Website sẽ được public tại: `https://username.github.io/repository-name`

## 📄 License

MIT License - Tự do sử dụng và chỉnh sửa

## 💝 Tác giả

Tạo với ❤️ để mang lại niềm vui!
