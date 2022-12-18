# DockerLiveNet
An example of the basics to run .NET with hot-reloading in docker, and then to produce a production release

## Usage
* Clone the repository
* Start in development mode in Docker with hot-reloading and linked to local files using `npm run start` or `yarn start`
  * You can stop the development Docker instance with `npm run stop` or `yarn stop`
  * You can then remove the development docker instance with `npm run rm` or `yarn rm`
* Access the site on `http://localhost:15001`, amend files and pause for the site to reload and then retry
* Run the production build in Docker, with optimised image via multi-layer build, using `npm run production` or `yarn production`
  * You can stop the production Docker instance with `npm run production:stop` or `yarn production:stop`
  * You can then remove the production Docker instance with `npm run production:rm` or `yarn production:rm`
