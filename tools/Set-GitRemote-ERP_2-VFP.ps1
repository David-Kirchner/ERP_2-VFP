# Point E:\VFP\ERP_2 at David-Kirchner/ERP_2-VFP
# Run once after creating the empty repo on GitHub:
#   https://github.com/new  →  name: ERP_2-VFP  →  private

$ErrorActionPreference = 'Stop'
Set-Location 'E:\VFP\ERP_2'

git remote set-url origin https://github.com/David-Kirchner/ERP_2-VFP.git
Write-Host "Remote:"
git remote -v

Write-Host ""
Write-Host "First push (if repo is new and empty on GitHub):"
Write-Host "  git push -u origin main"
