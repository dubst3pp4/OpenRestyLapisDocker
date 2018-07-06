# Docker & OpenResty & Lapis
Simple Docker project to setup an OpenResty & Lapis web development environment.

 - [Lapis](http://leafo.net/lapis), A web framework for Lua or MoonScript
 - [OpenResty](https://openresty.org), OpenResty® is a dynamic web platform based on NGINX and LuaJIT
 - [Lua](https://www.lua.org), The Lua language
 - [MoonScript](https://moonscript.org), A programmer friendly language that compiles to Lua.

## How to setup
Specify the type of the Lapis Project (MoonScript or Lua) by setting the `LAPIS_TYPE` environment variable in the `container/openresty/Dockerfile`.
If you leave it empty, Lapis will by default create an initial MoonScript project, if you set it to `lua`, Lapis will create a Lua project.

## Building the image
Build the image by running

    ./docker-build.sh

This command will pass your current UID to the build process, which ensures, that OpenResty will run with your UID, which means, that the NGINX process and the generated files are owned by you. You can specify additional parameters (like `--no-cache`), which will be simply appended to the `docker-compose build` command that gets executed.

## Starting the container
Start the container by running

    ./docker-start.sh

This will start the container, mount a volume from the hosts (your computer) `html` directory into the containers `/app` directory.
If an `nginx.conf` file is not present, it will create a new Lapis project. After that or when a NGINX configuration is already present, it will simply start the `CMD` which is defined in the `container/openresty/Dockerfile` - by default the `lapis server` command.

You can also specify additional parameters (like `-d`) which will appended to the `docker-compose up` command that gets executed.

## Note
This is just an hobby project and has been tested on Fedora 28 and Ubuntu 18.04 only. Any improvements are welcome!
