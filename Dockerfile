# >>>>>> LocalTest
# Build: docker build -t bmx .
# Run:   docker run -p 8050:4050 bmx 
#
# >>>>>> DockerHub
# Build: docker build -t <yourname>/bmx .
# Login: docker login -u <yourname>
# Push:  docker push <yourname>/bmx
# Run:   docker run -p 8050:4050 <yourname>/bmx

FROM elixir:1.9

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV MIX_ENV=prod

WORKDIR /app

COPY _build/prod/rel/bmx /app/

EXPOSE 4050

CMD /app/bin/bmx foreground
