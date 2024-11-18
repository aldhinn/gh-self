### This builds the base image for linux github runners.

FROM debian:bookworm as download

# Set build time variables.
ARG RUNNER_VERSION="2.320.0"
ARG GH_PLATFORM="x64"

WORKDIR /download

# Download curl.
RUN apt-get update
RUN apt-get install -y curl

# Download and extract the GitHub Actions runner bundle.
RUN curl --retry 3 -o actions-runner-linux.tar.gz -L \
    "https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-$GH_PLATFORM-$RUNNER_VERSION.tar.gz"

# Transfer to a smaller image base to reduce final image size.
FROM alpine:latest as dist

# Create home directory.
RUN mkdir -p /home/github
# Copy the bundle to dist.
COPY --from=download /download/actions-runner-linux.tar.gz /home/github

LABEL source_repository="https://github.com/aldhinn/gh-self"