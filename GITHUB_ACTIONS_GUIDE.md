# GitHub Actions guide

The workflow at `.github/workflows/ci.yml` runs for every push to `main` and every pull request targeting `main`. It checks out the project, executes `scripts/validate-page.sh`, configures Buildx, and builds the Docker image. Pull requests build without Docker Hub login or publishing. A push to `main` logs in and publishes `DOCKERHUB_USERNAME/devops-a2:latest`.

## Configure Docker Hub secrets

1. Create a Docker Hub access token in Docker Hub. Use a token rather than an account password.
2. Open the GitHub repository.
3. Go to **Settings → Secrets and variables → Actions → New repository secret**.
4. Add `DOCKERHUB_USERNAME` with your actual Docker Hub username.
5. Add `DOCKERHUB_TOKEN` with the Docker Hub token.

These are repository secrets and must not be written into source files. A pull request does not need these secrets because its job does not log in or push.

The workflow uses maintained major versions of the official actions: `actions/checkout@v4`, `docker/setup-buildx-action@v3`, `docker/login-action@v3`, and `docker/build-push-action@v6`. Check the actions' official repositories for current versions when maintaining the workflow.

## Obtain a genuine successful run

1. Configure both secrets above.
2. Push the finished project to `main`.
3. Open the repository's **Actions** tab and select the `Portfolio CI/CD` run for that push.
4. Confirm the validation step and Docker build succeed and the publishing step completes.
5. Verify the `latest` tag in Docker Hub.
6. Copy the real Actions run URL into the report and capture the requested screenshot.

## Obtain a genuine failed run without breaking `main`

1. Create a temporary branch from the current `main`:

   ```sh
   git switch main
   git pull --ff-only origin main
   git switch -c test/validation-failure
   ```
2. Temporarily alter one expected value in the validation test (for example, change the registration-number expectation in `scripts/validate-page.sh` to an intentionally incorrect value). Do not change the actual portfolio identity or disable a check.
3. Commit and push only this temporary test change:

   ```sh
   git add scripts/validate-page.sh
   git commit -m "Test CI failure handling"
   git push -u origin test/validation-failure
   ```
4. Open a pull request from `test/validation-failure` to `main`. The required-target PR workflow runs the validator and should fail at that test. Confirm that it is the intentional validation failure, then record the actual failed run URL and screenshot.
5. Restore the validation script to the correct expected value on the temporary branch, commit the restoration, and push. Do not merge the intentionally failing change. Close the temporary PR after the failure evidence has been collected, if appropriate; do not delete the failed workflow run.
6. Confirm `main` and its real files are correct. Preserve the successful and failed run records in the repository's Actions tab.

Do not fabricate run links or screenshots, commit broken production code to `main`, or claim that a run succeeded or failed until verified on GitHub.
