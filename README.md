# Luacheck

This Docker image exists to be able to run `luacheck *.lua` on a given
`${WORSPACE_DIR}` variable that's passed into the Docker run command.


## Why does this exist?

This exists to minimize the amount of time it takes to build the Docker image
since Lua and Luacheck take a while to compile. About 3 minutes. _yikes!_

