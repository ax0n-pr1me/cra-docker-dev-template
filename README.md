# New UI Repo

## Dev in Docker

If you have docker installed on your system you should be able to `docker-compose up -d --build` and visit [localhost:3001](localhost:3001) to see the app.

Make edits to [./src/app.js](./src/app.js) and see the app update live in the browser.

To watch the containers logs, `docker logs -f <container id>`

To stop the container `docker-compose stop`

From the terminal without compose...  

`docker build -t sample:dev .`

`docker run -it --rm -v ${PWD}:/usr/src/app -v /usr/src/app/node_modules -p 3001:3000 -e CHOKIDAR_USEPOLLING=true sample:dev`


## Production Builds

`docker build -f Dockerfile.prod -t sample:prod .`

`docker run -it --rm -p 1337:80 sample:prod`

`docker-compose -f docker-compose.prod.yml up -d --build`



good starting point infoprmation below - but leaves a few unanswered questions...
https://mherman.org/blog/dockerizing-a-react-app/