# Assignment 2 — Build, Containerize and Automate

A plain HTML and CSS portfolio for Sohaib Ali, containerized with Nginx and validated and built with GitHub Actions.

## Student

- **Name:** Sohaib Ali
- **Registration number:** FA23-BAI-057
- **Course:** DevOps for Cloud Computing, Lab Course

## Technologies

- Semantic HTML5 and responsive CSS
- Docker with the `nginx:alpine` base image
- GitHub Actions for validation, image builds, and main-branch publishing
- A POSIX shell validation script

## Project files

```text
index.html
style.css
Dockerfile
.dockerignore
.gitignore
README.md
GIT_WORKFLOW.md
DOCKER_GUIDE.md
GITHUB_ACTIONS_GUIDE.md
WEBHOOK_GUIDE.md
REPORT_TEMPLATE.md
PDF_REPORT_GUIDE.md
scripts/validate-page.sh
.github/workflows/ci.yml
```

## Open locally

Open `index.html` in a browser, or use VS Code's built-in simple static preview. No server, JavaScript, framework, or dependency installation is needed for the page itself.

## Validate the page

On Linux, macOS, or Git Bash:

```sh
sh scripts/validate-page.sh
```

The script checks required files, title, registration number, contact details, Contact section, stylesheet reference, and absence of script elements. It exits nonzero when a required check fails.

## Build and run with Docker

From the project root:

```sh
docker build -t devops-a2:manual .
docker run --name devops-a2-local -d -p 8080:80 devops-a2:manual
```

Open <http://localhost:8080>. See [DOCKER_GUIDE.md](./DOCKER_GUIDE.md) for status, logs, cleanup, Docker Hub login, tagging, and push commands.

## Docker Hub

The Docker Hub username provided for this project is `sohaib66`. Create or verify the `devops-a2` repository in that account before pushing; it was not publicly available when checked. The manual image name will be `sohaib66/devops-a2:manual`, and the GitHub Actions workflow publishes `sohaib66/devops-a2:latest` only for a push to `main`.

Create a Docker Hub access token and configure these repository secrets:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

In GitHub, go to **Settings → Secrets and variables → Actions**. Never put a password or token into this repository. Details are in [GITHUB_ACTIONS_GUIDE.md](./GITHUB_ACTIONS_GUIDE.md).

## GitHub webhook

Follow [WEBHOOK_GUIDE.md](./WEBHOOK_GUIDE.md) to create a webhook.site endpoint and observe the ping, push, and pull request events. Fill in the results from actual received requests; this project does not fabricate payload values.

## Git and submission

The selected GitHub repository is <https://github.com/sohaibali66/devop-057>. The Docker Hub username provided is `sohaib66`; create or verify its `devops-a2` repository before publishing. See:

- [GIT_WORKFLOW.md](./GIT_WORKFLOW.md) for repository creation, five meaningful commits, and the `feature-endpoint` pull request process.
- [REPORT_TEMPLATE.md](./REPORT_TEMPLATE.md) for the editable report and evidence placeholders.
- [PDF_REPORT_GUIDE.md](./PDF_REPORT_GUIDE.md) for completing and exporting the report.

### Submission checklist

- [ ] Create the public GitHub repository and push the project.
- [ ] Make at least five meaningful commits for real project changes.
- [ ] Push `feature-endpoint`, open a pull request into `main`, and merge it.
- [ ] Configure both Docker Hub Actions secrets.
- [ ] Keep one genuine failed validation run on a temporary branch and one successful publishing run on `main`.
- [ ] Build and push the manual `:manual` image.
- [ ] Test and record actual webhook.site observations.
- [ ] Add the required screenshots and real links to the report; export and check the PDF.

No GitHub repository, Docker Hub image, workflow run, webhook delivery, merge, or PDF export is claimed to have occurred yet.
