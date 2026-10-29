# GitHub webhook testing with webhook.site

## Configure and observe

1. Visit <https://webhook.site> and copy the unique URL it generates for your session.
2. Open your GitHub repository and go to **Settings → Webhooks → Add webhook**.
3. Paste the unique webhook.site URL into **Payload URL**.
4. Set **Content type** to `application/json`.
5. Subscribe to **push** and **pull request** events. Keep the default initial ping enabled.
6. Save the webhook.
7. Inspect the received ping in webhook.site. Push a test change and inspect its delivery. Open a pull request and inspect the pull request opened delivery.
8. For each request, record the actual `X-GitHub-Event` header value, payload fields, and observed `ref` value when it is a push. Header names and values must be copied from the received request, not assumed.

The event header is normally named `X-GitHub-Event`; verify its actual presence and value in each delivery. A push payload commonly has a `ref` field, but copy the field exactly from the actual payload. Ping and pull request events do not need a push `ref`.

## Reusable observation table

Fill observations from real requests. Do not leave sample or invented values as evidence.

| Event | Value of the event header | Value of the `ref` field (push only) | Your own observation |
|---|---|---|---|
| Ping | Fill from actual received request | Not applicable | Fill after testing |
| Push | Fill from actual received request | Fill from actual received payload | Fill after testing |
| Pull request opened | Fill from actual received request | Not applicable | Fill after testing |

Record the observations, relevant payload fields, and event headers in this guide or in the matching Webhook results table in `REPORT_TEMPLATE.md`. Save screenshots only after replacing the unique URL with care if the capture would expose information you do not want to share.

## Webhook and GitHub Actions

A webhook sends repository event information to an external HTTP endpoint such as webhook.site. GitHub Actions executes automation workflows configured in the repository when selected repository events occur. The webhook demonstrates event delivery; the Actions workflow validates and builds this project.
