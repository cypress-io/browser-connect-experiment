# browser-connect-experiment
> Debugging Docker on Mac Chrome to Cypress connection time out

## Build Docker image

```
npm run build
```

Which creates an image named `cypress-chrome-vnc`

## Run Docker image

Switch into a folder with Cypress tests, for example grab
[cypress-test-tiny](https://github.com/cypress-io/cypress-test-tiny)

```
git clone git@github.com:cypress-io/cypress-test-tiny.git
cd cypress-test-tiny
docker run -p 5900 -e HOME=/ -v $PWD:/src -w /src cypress-chrome-vnc x11vnc -forever -create
```

It shows that VNC is running on local (to the container) port `5900`, but we do
not know the external container IP and port. To find it:

```
docker ps
... PORT
    0.0.0.0:32768->5900/tcp
```

Open VNC client, for example the free 'RealVNC' client from https://www.realvnc.com
and enter `0.0.0.0:32768` url. Click to allow connecting over unencrypted
connection without a password and see the desktop. You should have a terminal shell
with outside files mapped into `/src` folder. Install Cypress (via `npm i` or
`npm i cypress`) and you should be able to see its version.

![Cypress version](img/vnc-docker.png)
