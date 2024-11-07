### This builds the base image for linux github runners.

FROM debian:bookworm as download

# Set build time variables.
ARG RUNNER_VERSION="2.320.0"
ARG GH_PLATFORM="x64"

# Create a user for the runner
RUN useradd -m github
# Create home directory.
RUN mkdir -p /home/github
# Change the ownership of the directory to the runner user.
RUN chown -R github:github /home/github

# Download curl.
RUN apt-get update
RUN apt-get install -y curl

WORKDIR /home/github

# Switching to the github user.
USER github

# Download and extract the GitHub Actions runner bundle.
RUN curl -o actions-runner-linux.tar.gz -L \
    "https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-$GH_PLATFORM-$RUNNER_VERSION.tar.gz"

# Transfer to a smaller image base to reduce final image size.
FROM alpine:latest as dist

# Create a user for the runner
RUN useradd -m github
# Create home directory.
RUN mkdir -p /home/github
# Change the ownership of the directory to the runner user.
RUN chown -R github:github /home/github

# Copy the bundle to dist.
COPY --from=download /home/github/actions-runner-linux.tar.gz /home/github
# Change the ownership of the entry point to the runner user.
RUN chown -R github:github /home/github/actions-runner-linux.tar.gz