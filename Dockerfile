# To build:
# 
#     $ docker build . -t bugmark/bmx
#
# To push:
#
#     $ docker login
#     $ docker push
#
# To run:
#
#     $ docker run -p 4000:4000 bugmark/bmx
#
# To run with `nginx_proxy`
#
#     $ docker run -p 4000:4000 -e VIRTUAL_HOST=bmx.yourdomain bugmark/bmx
#

FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 4000
ENV PORT=4000 MIX_ENV=prod

ADD . .

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
# ADD app/bmx_web/assets/package.json assets/
# RUN cd app/bmx_web/assets && \
#     npm install

# Run frontend build, compile, and digest assets
# RUN cd assets/ && \
#     npm run deploy && \
#     cd - && \
#     mix do compile, phx.digest

RUN mix do compile, phx.digest

USER default

CMD ["mix", "phx.server"]
