# Run Playwright tests inside Windows Docker container

## Limitations

- You need to use `mcr.microsoft.com/windows` or `mcr.microsoft.com/windows/server` as a base image, `servercore` or `nanoserver` don't work due to missing dependencies.
- Firefox currently does not launch inside Windows Containers: https://github.com/microsoft/playwright/issues/13679

## Usage

See the [`Dockerfile`](./Dockerfile) for the Dockerfile.

Demo project:

```bash
git clone https://github.com/mxschmitt/playwright-windows-containers
cd playwright-on-windows-containers
docker build -t mxschmitt/playwright-windows-containers .
docker run --rm mxschmitt/playwright-windows-containers
```
