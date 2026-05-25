# Create GitHub repo ERP_2-VFP (David-Kirchner)

`git push` fails with **Repository not found** until the repo exists on GitHub.

## Steps (one time)

1. Sign in as **David-Kirchner** at https://github.com
2. Open https://github.com/new
3. **Repository name:** `ERP_2-VFP`
4. **Private** (recommended)
5. Do **not** add README, .gitignore, or license (you already have a local repo)
6. Click **Create repository**

## Push from PowerShell

```powershell
cd E:\VFP\ERP_2
git remote set-url origin https://github.com/David-Kirchner/ERP_2-VFP.git
git push -u origin main
```

If GitHub asks for credentials, use a **Personal Access Token** (not your password).

## After first push

From VFP: `DO GitCommit WITH "your message"`
