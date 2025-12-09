const yesBtn = document.getElementById('yesBtn');
const noBtn = document.getElementById('noBtn');
const heartContainer = document.getElementById('heartContainer');
const questionBox = document.querySelector('.question-box');

let noClickCount = 0;
let currentScale = 1;

// Yes button - Create heart animations
yesBtn.addEventListener('click', function() {
    // Create floating hearts
    createFloatingHearts();
    
    // Create center sparkling heart
    createSparklingHeart();
    
    // Change question text
    const question = document.querySelector('.question');
    question.textContent = 'Đúng rồi! Bạn siêu đáng yêu luôn! 😊💕✨';
    question.style.color = '#ff6b6b';
    question.style.animation = 'fadeIn 0.5s ease-in';
    
    // Hide buttons
    yesBtn.style.display = 'none';
    noBtn.style.display = 'none';
    
    // Add confetti effect
    createConfetti();
});

// No button - Move randomly and shrink
noBtn.addEventListener('click', function() {
    noClickCount++;
    
    // Random position
    const maxX = window.innerWidth - noBtn.offsetWidth - 20;
    const maxY = window.innerHeight - noBtn.offsetHeight - 20;
    
    const randomX = Math.random() * maxX;
    const randomY = Math.random() * maxY;
    
    // Move button
    noBtn.style.position = 'fixed';
    noBtn.style.left = randomX + 'px';
    noBtn.style.top = randomY + 'px';
    noBtn.style.transition = 'all 0.3s ease';
    
    // Shrink button gradually
    currentScale = Math.max(0.3, currentScale - 0.1);
    noBtn.style.transform = `scale(${currentScale})`;
    
    // Change text based on click count
    const messages = [
        'Chắc chắn không? 😏',
        'Bạn đáng yêu mà! 😊',
        'Thử lại đi mà! 😄',
        'Lần cuối thôi! 🥺',
        'Đừng bấm nữa! 😆'
    ];
    
    if (noClickCount <= messages.length) {
        noBtn.textContent = messages[noClickCount - 1];
    }
    
    // If too small, make it disappear
    if (currentScale <= 0.3) {
        setTimeout(() => {
            noBtn.style.opacity = '0';
            noBtn.style.pointerEvents = 'none';
        }, 300);
    }
});

// Create floating hearts
function createFloatingHearts() {
    const hearts = ['💕', '💖', '💗', '💓', '💝', '💘', '💞', '✨', '🌟', '💫', '😊', '🥰'];
    
    for (let i = 0; i < 20; i++) {
        setTimeout(() => {
            const heart = document.createElement('div');
            heart.className = 'heart';
            heart.textContent = hearts[Math.floor(Math.random() * hearts.length)];
            
            // Random starting position
            const startX = Math.random() * window.innerWidth;
            heart.style.left = startX + 'px';
            heart.style.bottom = '-50px';
            
            // Random delay and duration
            const delay = Math.random() * 0.5;
            const duration = 2 + Math.random() * 2;
            heart.style.animationDelay = delay + 's';
            heart.style.animationDuration = duration + 's';
            
            heartContainer.appendChild(heart);
            
            // Remove after animation
            setTimeout(() => {
                heart.remove();
            }, (duration + delay) * 1000);
        }, i * 100);
    }
}

// Create sparkling heart in center
function createSparklingHeart() {
    const sparkleHeart = document.createElement('div');
    sparkleHeart.className = 'heart-sparkle';
    sparkleHeart.textContent = '💖';
    heartContainer.appendChild(sparkleHeart);
    
    // Create multiple sparkles
    for (let i = 0; i < 5; i++) {
        setTimeout(() => {
            const sparkle = document.createElement('div');
            sparkle.className = 'heart';
            sparkle.textContent = '✨';
            sparkle.style.left = '50%';
            sparkle.style.top = '50%';
            sparkle.style.fontSize = '40px';
            sparkle.style.animation = 'sparkle 1s ease-out forwards';
            heartContainer.appendChild(sparkle);
            
            setTimeout(() => sparkle.remove(), 1000);
        }, i * 200);
    }
}

// Create confetti effect
function createConfetti() {
    const colors = ['#ff6b6b', '#4ecdc4', '#45b7d1', '#f9ca24', '#f0932b', '#eb4d4b', '#6c5ce7'];
    const confettiCount = 50;
    
    for (let i = 0; i < confettiCount; i++) {
        setTimeout(() => {
            const confetti = document.createElement('div');
            confetti.style.position = 'fixed';
            confetti.style.width = '10px';
            confetti.style.height = '10px';
            confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
            confetti.style.left = Math.random() * 100 + '%';
            confetti.style.top = '-10px';
            confetti.style.borderRadius = '50%';
            confetti.style.pointerEvents = 'none';
            confetti.style.zIndex = '999';
            
            document.body.appendChild(confetti);
            
            const animationDuration = 3 + Math.random() * 2;
            const horizontalMovement = (Math.random() - 0.5) * 200;
            
            confetti.style.transition = `all ${animationDuration}s ease-out`;
            confetti.style.transform = `translate(${horizontalMovement}px, ${window.innerHeight + 100}px) rotate(${Math.random() * 720}deg)`;
            confetti.style.opacity = '0';
            
            setTimeout(() => {
                confetti.remove();
            }, animationDuration * 1000);
        }, i * 50);
    }
}

// Prevent No button from going off screen initially
noBtn.addEventListener('mouseenter', function() {
    if (noClickCount === 0) {
        // Slight movement on hover before first click
        const maxX = window.innerWidth - noBtn.offsetWidth - 20;
        const maxY = window.innerHeight - noBtn.offsetHeight - 20;
        
        const randomX = Math.random() * maxX;
        const randomY = Math.random() * maxY;
        
        noBtn.style.transition = 'all 0.3s ease';
        noBtn.style.transform = 'translate(' + (randomX - noBtn.offsetLeft) + 'px, ' + (randomY - noBtn.offsetTop) + 'px)';
    }
});
