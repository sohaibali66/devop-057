# Git and GitHub workflow

The commands below assume Git and the GitHub CLI (`gh`) are installed and authenticated. The selected repository is `https://github.com/sohaibali66/devop-057`.

## 1. Initialize Git and choose `main`

From the project root, run these only if this folder is not already a Git repository:

```sh
git init
git branch -M main
```

Check with `git status`. Do not reinitialize an existing repository or overwrite existing Git history.

## 2. Create the public repository and add its remote

The provided GitHub repository currently has no refs. Confirm in GitHub that it is empty and public before pushing. Its remote is:

```sh
gh auth status
git remote add origin https://github.com/sohaibali66/devop-057.git
git remote -v
```

If `origin` already exists, inspect it rather than adding a duplicate. The assigned repository name differs from the provided repository URL; the provided URL was selected after confirmation.

## 3. Make five meaningful commits

Create the commits after reviewing the staged diff each time. These groups correspond to real files and changes in this project; do not make empty or fabricated commits:

```sh
git add index.html style.css
git diff --cached
git commit -m "Create responsive student portfolio"

git add Dockerfile .dockerignore DOCKER_GUIDE.md
git diff --cached
git commit -m "Add Nginx container and Docker instructions"

git add scripts/validate-page.sh
git update-index --chmod=+x scripts/validate-page.sh
git diff --cached
git diff --cached --summary
git commit -m "Add portfolio validation checks"

git add .github/workflows/ci.yml GITHUB_ACTIONS_GUIDE.md
git diff --cached
git commit -m "Automate validation and Docker image publishing"

git add .gitignore README.md WEBHOOK_GUIDE.md REPORT_TEMPLATE.md PDF_REPORT_GUIDE.md GIT_WORKFLOW.md
git diff --cached
git commit -m "Document GitHub webhook and assignment submission"
```

Check that the commits contain the intended files:

```sh
git log --oneline --decorate -5
git status
```

## 4. Push the initial `main`

```sh
git push -u origin main
```

## 5. Create `feature-endpoint` and improve Contact

The Contact section already exists. On this branch, improve its visible contact guidance rather than duplicating it. For example, add one accurate sentence in `index.html` describing the preferred contact route (only if you can truthfully provide that preference), then make sure it remains readable on mobile and run the validator:

```sh
git switch -c feature-endpoint
```

Edit the Contact section in `index.html` with that genuine improvement, then run:

```sh
sh scripts/validate-page.sh
git diff
git add index.html
git diff --cached
git commit -m "Improve Contact section guidance"
git push -u origin feature-endpoint
```

If you do not have a truthful preference to add, make another real improvement to the Contact section's accessibility or responsive presentation and describe it accurately in the commit; do not add invented personal information.

## 6. Open, review, and merge the pull request

Open a pull request on GitHub with **base** `main` and **compare** `feature-endpoint`. Alternatively:

```sh
gh pr create --base main --head feature-endpoint --title "Improve portfolio Contact section" --body "Improves the existing Contact section. Please review the page and CI checks before merging."
```

Review the changed files and wait for the pull request workflow to pass. Merge through GitHub (or, after review, `gh pr merge --merge`). Preserve the pull request so its merged status is available as submission evidence.

## 7. Return to updated `main`

```sh
git switch main
git pull --ff-only origin main
git status
```

The remote, branch push, pull request, and merge must still be completed and verified in GitHub. Configure Docker Hub secrets before pushing to `main` so its publishing workflow can succeed.
