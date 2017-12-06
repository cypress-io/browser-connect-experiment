# browser-connect-experiment
> Debugging Docker on Mac Chrome to Cypress connection time out

## Build Docker image

```
npm run build
```

Which creates an image named `cypress-chrome-vnc`

## Run Docker image

```
docker run -p 5900 -e HOME=/ d1 x11vnc -forever -create
```
