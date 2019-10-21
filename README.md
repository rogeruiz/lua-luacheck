# Luacheck

A Lua and Luacheck ready Docker image to be leveraged by folks wanting to use
GitHub Actions.

## Why does this exist?

This exists to minimize the amount of time it takes to build the Docker image
since Lua and Luacheck take a while to compile. About 3 minutes. _yikes!_

## How do I use this?

This Docker image can be used in GitHub Actions by having a local Dockerfile
such as the following in `.github/actions/lua-luacheck`.

```Dockerfile
FROM rogeruiz/lua-luacheck:latest

# This is a local file relative to the Dockerfile named `lua-test`.
COPY lua-test /usr/local/bin/lua-test

ENTRYPOINT ["lua-test"]
```

```sh
#!/bin/sh

luacheck "${GITHUB_WORKSPACE}"/*.lua --globals "ngx"
```

### Setting up a workflow with this

To leverage this properly, you'll also need to create a GitHub Actions Workflow
to leverage your local Actions. The `main.yml` file will live within
`.github/workflows`.

```yaml
name: Lint lua files

on:
    pull_request:
        branches:
        - master

jobs:
    lint_lua:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: ./.github/actions/lua-luacheck
```
