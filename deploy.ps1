# Deploy Website to GitHub
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  DEPLOY WEBSITE LEN GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Kiem tra git da duoc cau hinh chua
$gitUser = git config user.name
$gitEmail = git config user.email

if (-not $gitUser -or -not $gitEmail) {
    Write-Host "Git chua duoc cau hinh!" -ForegroundColor Yellow
    Write-Host "Vui long cau hinh git truoc:" -ForegroundColor Yellow
    Write-Host "  git config --global user.name 'Ten cua ban'" -ForegroundColor White
    Write-Host "  git config --global user.email 'email@example.com'" -ForegroundColor White
    Write-Host ""
    $configure = Read-Host "Ban co muon cau hinh ngay bay gio? (y/n)"
    if ($configure -eq "y" -or $configure -eq "Y") {
        $name = Read-Host "Nhap ten cua ban"
        $email = Read-Host "Nhap email cua ban"
        git config --global user.name $name
        git config --global user.email $email
        Write-Host "Da cau hinh git!" -ForegroundColor Green
    } else {
        Write-Host "Vui long cau hinh git truoc khi tiep tuc" -ForegroundColor Red
        exit
    }
}

Write-Host "Thong tin Git hien tai:" -ForegroundColor Green
Write-Host "   Ten: $gitUser" -ForegroundColor White
Write-Host "   Email: $gitEmail" -ForegroundColor White
Write-Host ""

# Kiem tra remote da ton tai chua
$remoteExists = git remote get-url origin 2>$null

if ($remoteExists) {
    Write-Host "Da co remote repository: $remoteExists" -ForegroundColor Green
    $useExisting = Read-Host "Ban co muon su dung repository nay? (y/n)"
    if ($useExisting -eq "n" -or $useExisting -eq "N") {
        git remote remove origin
        $remoteExists = $null
    }
}

if (-not $remoteExists) {
    Write-Host ""
    Write-Host "Vui long tao repository tren GitHub truoc:" -ForegroundColor Yellow
    Write-Host "   1. Vao https://github.com/new" -ForegroundColor White
    Write-Host "   2. Dat ten repository (vi du: funny-question-website)" -ForegroundColor White
    Write-Host "   3. Chon Public" -ForegroundColor White
    Write-Host "   4. KHONG tich 'Initialize with README'" -ForegroundColor White
    Write-Host "   5. Click 'Create repository'" -ForegroundColor White
    Write-Host ""
    
    $repoUrl = Read-Host "Nhap URL repository GitHub (vi du: https://github.com/username/repo-name.git)"
    
    if ($repoUrl) {
        Write-Host "Dang them remote repository..." -ForegroundColor Green
        git remote add origin $repoUrl
        Write-Host "Da them remote!" -ForegroundColor Green
    } else {
        Write-Host "Chua nhap URL repository" -ForegroundColor Red
        exit
    }
}

# Kiem tra branch
$currentBranch = git branch --show-current
if ($currentBranch -ne "main" -and $currentBranch -ne "master") {
    Write-Host "Dang doi ten branch thanh main..." -ForegroundColor Green
    git branch -M main
}

# Add va commit neu co thay doi
Write-Host ""
Write-Host "Dang kiem tra thay doi..." -ForegroundColor Green
$status = git status --porcelain

if ($status) {
    Write-Host "Co thay doi, dang commit..." -ForegroundColor Yellow
    git add .
    $commitMsg = Read-Host "Nhap message cho commit (Enter de dung mac dinh)"
    if (-not $commitMsg) {
        $commitMsg = "Update website"
    }
    git commit -m $commitMsg
    Write-Host "Da commit!" -ForegroundColor Green
} else {
    Write-Host "Khong co thay doi nao" -ForegroundColor Green
}

# Push len GitHub
Write-Host ""
Write-Host "Dang push code len GitHub..." -ForegroundColor Green
$branch = git branch --show-current

try {
    git push -u origin $branch
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  DEPLOY THANH CONG!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    
    $repoUrl = git remote get-url origin
    $repoUrl = $repoUrl -replace '\.git$', ''
    $repoUrl = $repoUrl -replace 'git@github\.com:', 'https://github.com/'
    
    Write-Host "Repository: $repoUrl" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "De deploy len GitHub Pages:" -ForegroundColor Yellow
    Write-Host "   1. Vao: $repoUrl/settings/pages" -ForegroundColor White
    Write-Host "   2. Chon Source: Branch 'main', Folder '/ (root)'" -ForegroundColor White
    Write-Host "   3. Click Save" -ForegroundColor White
    $username = ($repoUrl -split '/')[-2]
    $reponame = ($repoUrl -split '/')[-1]
    $pagesUrl = "https://$username.github.io/$reponame"
    Write-Host "   4. Website se co tai: $pagesUrl" -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "Loi khi push!" -ForegroundColor Red
    Write-Host "Vui long kiem tra:" -ForegroundColor Yellow
    Write-Host "   - Da tao repository tren GitHub chua?" -ForegroundColor White
    Write-Host "   - URL repository co dung khong?" -ForegroundColor White
    Write-Host "   - Da dang nhap GitHub chua?" -ForegroundColor White
    Write-Host ""
}

Write-Host "Nhan Enter de thoat..."
Read-Host