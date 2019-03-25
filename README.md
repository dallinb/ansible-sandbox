# Ansible Sandbox

[![Build Status](https://travis-ci.org/dallinb/ansible-sandbox.png?branch=master)](https://travis-ci.org/dallinb/ansible-sandbox)

## Introduction

This repository is intended to be a introduction to using kitchen test and
Docker to test Ansible code.

For these steps to work on your local machine, you will need to have
[Docker installed](https://docs.docker.com/engine/installation/).

## Tests and TravisCI

The provided [`Makefile`](./Makefile) provides the following targets:

| Target         | Description                                          |
|----------------|------------------------------------------------------|
|`before_script` | Show the versions of the individual tools installed. |
|`install`       | Install the required tools.                          |
|`script`        | The default action.  Runs the tests.                 |

### Integration with TravisCI

The file [`.travis.yml`](.travis.yml) configures the project to run on
[TravisCI](https://travis-ci.org/dallinb/ansible-sandbox).  It has been written
to cache the Ruby gems and Python packages to improve performance.  The
Docker image is not cached as this is
[advised against](https://docs.travis-ci.com/user/caching/#Things-not-to-cache)
in the TravisCI documentation.  The build installation and build steps for
Travis are mirrored in the provided
[`Makefile`](Makefile) so to emulate what is ran on the Travis server locally
simply run `make`.
