# Assignment 2 — Build, Containerize and Automate

**Student name:** Sohaib Ali  
**Registration number:** FA23-BAI-057  
**Course:** DevOps for Cloud Computing, Lab Course

> Replace every bracketed instruction with your real account information, URL, observation, or screenshot. Do not submit invented links or evidence.

## Submission links — keep all four on page 1

- **GitHub repository:** https://github.com/sohaibali66/devop-057
- **Docker Hub repository:** [CREATE/VERIFY `sohaib66/devops-a2`, THEN PASTE ITS REAL URL]
- **Successful GitHub Actions run:** [PASTE REAL SUCCESSFUL RUN URL]
- **Failed GitHub Actions run:** [PASTE REAL FAILED RUN URL]

## Project overview

This project presents a responsive personal portfolio for Sohaib Ali, a BS Artificial Intelligence student.  
The site uses semantic HTML and custom CSS and is served from an Nginx Docker container.  
A GitHub Actions workflow validates the required page content and builds the container image.  
On pushes to `main`, the workflow publishes the `latest` image to the configured Docker Hub repository.

## Evidence checklist

Insert a legible screenshot for each item. Replace each placeholder with the actual image; ensure the portfolio screenshot includes the browser address bar.

1. **At least five meaningful Git commits:** [INSERT SCREENSHOT OF ACTUAL COMMIT HISTORY]
2. **Merged `feature-endpoint` pull request:** [INSERT SCREENSHOT OF ACTUAL MERGED PULL REQUEST]
3. **Docker Hub repository with `manual` and `latest` tags:** [INSERT SCREENSHOT OF ACTUAL REPOSITORY AND TAGS]
4. **Genuine failed GitHub Actions run:** [INSERT SCREENSHOT OF ACTUAL FAILED TEMPORARY-BRANCH RUN]
5. **Successful GitHub Actions run:** [INSERT SCREENSHOT OF ACTUAL SUCCESSFUL `main` RUN]
6. **Portfolio at `http://localhost:8080`:** [INSERT SCREENSHOT WITH ADDRESS BAR VISIBLE]

## Webhook results

Copy the event header values and payload fields from the actual webhook.site requests. The usual header name is `X-GitHub-Event`; verify the received request rather than assuming a value. The `ref` column applies only to a push.

| Event | Value of the event header | Value of the `ref` field (push only) | Your own observation |
|---|---|---|---|
| Ping | [ACTUAL RECEIVED VALUE] | Not applicable | [YOUR OBSERVATION] |
| Push | [ACTUAL RECEIVED VALUE] | [ACTUAL PAYLOAD VALUE] | [YOUR OBSERVATION] |
| Pull request opened | [ACTUAL RECEIVED VALUE] | Not applicable | [YOUR OBSERVATION] |

A webhook sends event information to an external HTTP endpoint. GitHub Actions executes configured automation workflows in response to repository events. Record the observed event headers, payload details, and any relevant screenshots above and in [WEBHOOK_GUIDE.md](./WEBHOOK_GUIDE.md).

## Real problem and solution

- **Problem I actually encountered:** [DESCRIBE A REAL PROBLEM; DO NOT INVENT ONE]
- **Actual error message or observed behavior:** [PASTE THE REAL MESSAGE OR DESCRIBE WHAT HAPPENED]
- **Steps I took to diagnose it:** [DESCRIBE YOUR ACTUAL STEPS]
- **Solution and verification:** [DESCRIBE THE REAL FIX AND HOW YOU VERIFIED IT]
