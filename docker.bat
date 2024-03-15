@echo off 
set DOCKER_DISTRO=Ubuntu-22.04
set args=%*
wsl -d %DOCKER_DISTRO% wsl-docker-wrapper %args:\=/%
