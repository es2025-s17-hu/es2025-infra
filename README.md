# es2025-s17-hu infra

## Description
This infrastructure was built for the EuroSkills Herning 2025 Hungarian National Competition. We used dedicated server to serve this insfrastructure, but is possible to install this environment to a standolne PC or laptop too.

The current config is designed for 6+1 competitors. Each competitor's ID is in the format `competitor-YYYY`, where `YYYY` is the competitor's four-digit PIN code, which also serves as a password in several places. 

## The Docker environment

A Docker környezet az alábbi konténereket futtatja:

- gitea:  Giteaself-hosted all-in-one software development service, it includes Git hosting, code review, team collaboration, package registry and CI/CD. It is similar to GitHub, Bitbucket and GitLab. 
- db: MySQL 8 container that provides database backend for Gitea
- db-competitor: MySQL 8 container that provides database backend for Gitea fork competitor works
- pma: PHPMyAdmin service, which provides graphical access to the db-competitior container database server
- verdaccio: a lightweight private npm proxy registry built in Node.js
- traefic: reverse proxy and load balancer that makes deploying microservices easy
- watchtower: application that monitors running containers for changes to the image
- runner1, ... runner8: runners for Gitea CI/CD processes
- competitor1a, competitor1b, competitor1c, competitor2a...: containers of the competitors' deployed project

## Installation

1. Issue the `docker compose up -d` command first.
2. ... 





