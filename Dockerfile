FROM alpine:latest
LABEL maintainer="Roger Steve Ruiz <rruiz@hashicorp.com>"

ENV LUA_VERSION=5.2.4 \
    LUAROCKS_VERSION=2.4.2

RUN apk add --update --no-cache \
            musl-dev \
            ncurses \
            readline-dev \
            libc-dev \
            make \
            gcc \
            wget \
            git \
            zip \
            unzip

RUN wget https://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz -O - | tar -xzf -
WORKDIR lua-$LUA_VERSION
RUN make linux; make install
WORKDIR /
RUN rm -rf lua-${LUA_VERSION}

RUN wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz -O - | tar -xzf -
WORKDIR luarocks-$LUAROCKS_VERSION
RUN ./configure; make build; make install
WORKDIR /
RUN rm -rf luarocks-$LUAROCKS_VERSION

RUN luarocks install luacheck
