FROM mcr.microsoft.com/windows/server:ltsc2022

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference='SilentlyContinue';"]

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/v16.17.0/node-v16.17.0-win-x64.zip";
RUN Expand-Archive nodejs.zip -DestinationPath C:\;
RUN rm nodejs.zip;
RUN Rename-Item "C:\\node-v16.17.0-win-x64" c:\\nodejs
RUN SETX PATH C:\nodejs

WORKDIR /app

ADD package.json /app
ADD package-lock.json /app
ADD playwright.config.ts /app
ADD tests /app/tests

RUN npm ci
RUN npx playwright install

ENTRYPOINT [ "C:\\nodejs\\npx.cmd", "playwright", "test", "--project=Chromium", "--project=WebKit"]
