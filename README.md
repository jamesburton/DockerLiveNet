# DockerLiveNet
An example of the basics to run .NET with hot-reloading in docker, and then to produce a production release

## Pre-requisites
* You must have a suitable version of docker running and configured for default access, with compose installed/available.  At the time of writing I am using Windows Docker Desktop 4.14.1, running on WSL2, `docker --version` returns `20.10.21, build baeda1f` and `docker compose version` returns `v2.12.2`, in-case this helps future users to migrate information.

## Usage
* Clone the repository
* Start in development mode in Docker with hot-reloading and linked to local files using `npm run start` or `yarn start`
  * Access the site on `http://localhost:15001`, amend files and pause for the site to reload and then retry
  * You can stop the development Docker instance with `npm run stop` or `yarn stop`
  * You can then remove the development docker instance with `npm run rm` or `yarn rm`
* Run the production build in Docker, with optimised image via multi-layer build, using `npm run production` or `yarn production`
  * Access the production instance on `http://localhost:2080`
  * You can stop the production Docker instance with `npm run production:stop` or `yarn production:stop`
  * You can then remove the production Docker instance with `npm run production:rm` or `yarn production:rm`

## General Principles

This uses a multi-layer docker build to optimise production, and until ASPNET supports AOT this is as far as we can go, but if/when that becomes supported then a single-file output can be achieved to run on the `scratch` image for maximum control.

The development instance maps the local folder as a colume so that code changes are detected by the running instance, and hot-reloaded as we are running in watch mode.

Ports could be parameterised, and additional services could be added to show multi-container compose usage, but the elements required to amend for such are all included so this should be easy to apply should you need it.

