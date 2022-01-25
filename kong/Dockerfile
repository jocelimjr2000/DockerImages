FROM kong:2.5.1-alpine

USER root
RUN apk update && apk add git unzip luarocks
RUN luarocks install --pin lua-resty-jwt 0.2.2-0
RUN luarocks install kong-oidc

RUN mkdir /usr/local/share/lua/5.1/kong/plugins/custom-auth
COPY ./custom-auth/schema.lua /usr/local/share/lua/5.1/kong/plugins/custom-auth/schema.lua
COPY ./custom-auth/handler.lua /usr/local/share/lua/5.1/kong/plugins/custom-auth/handler.lua
ENV KONG_PLUGINS="custom-auth, bundled, oidc"

USER kong