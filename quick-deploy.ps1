# Quick Deploy Script
Write-Host "=== DEPLOY TO GITHUB ===" -ForegroundColor Cyan
Write-Host ""

# Check git config
$gitUser = git config user.name
$gitEmail = git config user.email

if (-not $gitUser) {
    Write-Host "Git chua duoc cau hinh!" -ForegroundColor Yellow
    Write-Host "Chay lenh sau de cau hinh:" -ForegroundColor Yellow
    Write-Host "  git config --global user.name 'Ten cua ban'" -ForegroundColor White
    Write-Host "  git config --global user.email 'email@example.com'" -ForegroundColor White
    exit
}

Write-Host "Git user: $gitUser" -ForegroundColor Green
Write-Host "Git email: $gitEmail" -ForegroundColor Green
Write-Host ""

# Check remote
$remote = git remote get-url origin 2>$null

if (-not $remote) {
    Write-Host "Chua co remote repository!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Buoc 1: Tao repository tren GitHub:" -ForegroundColor Yellow
    Write-Host "  - Vao: https://github.com/new" -ForegroundColor White
    Write-Host "  - Dat ten repository" -ForegroundColor White
    Write-Host "  - Chon Public" -ForegroundColor White
    Write-Host "  - KHONG tich 'Initialize with README'" -ForegroundColor White
    Write-Host ""
    $repoUrl = Read-Host "Buoc 2: Nhap URL repository (VD: https://github.com/username/repo.git)"
    
    if ($repoUrl) {
        git remote add origin $repoUrl
        Write-Host "Da them remote!" -ForegroundColor Green
    } else {
        Write-Host "Chua nhap URL!" -ForegroundColor Red
        exit
    }
} else {
    Write-Host "Remote: $remote" -ForegroundColor Green
}

# Rename branch to main
$branch = git branch --show-current
if ($branch -ne "main") {
    git branch -M main
}

# Add and commit
Write-Host ""
Write-Host "Dang kiem tra thay doi..." -ForegroundColor Green
git add .
$hasChanges = git status --porcelain

if ($hasChanges) {
    git commit -m "Update website"
    Write-Host "Da commit!" -ForegroundColor Green
}

# Push
Write-Host ""
Write-Host "Dang push len GitHub..." -ForegroundColor Green
git push -u origin main

Write-Host ""
Write-Host "=== THANH CONG! ===" -ForegroundColor Green
Write-Host ""
Write-Host "De deploy len GitHub Pages:" -ForegroundColor Yellow
Write-Host "  1. Vao repository tren GitHub" -ForegroundColor White
Write-Host "  2. Settings > Pages" -ForegroundColor White
Write-Host "  3. Source: Branch 'main', Folder '/ (root)'" -ForegroundColor White
Write-Host "  4. Save" -ForegroundColor White
Write-Host ""

$remote = git remote get-url origin
if ($remote) {
    $remote = $remote -replace '\.git$', ''
    $remote = $remote -replace 'git@github\.com:', 'https://github.com/'
    Write-Host "Repository: $remote" -ForegroundColor Cyan
    Write-Host "Settings: $remote/settings/pages" -ForegroundColor Cyan
}

Read-Host "Nhan Enter de thoat"
