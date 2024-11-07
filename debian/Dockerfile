### This builds the image for the debian github self-hosted runner.

ARG BUNDLE_IMAGE=gh-self:amd64-linux-base
FROM ${BUNDLE_IMAGE} AS retrieve-bundle

FROM debian:bookworm-slim as final

# Create a user for the runner
RUN useradd -m github
# Create home directory.
RUN mkdir -p /home/github
# Change the ownership of the directory to the runner user.
RUN chown -R github:github /home/github

# Start working on home directory.
WORKDIR /home/github

# Copy the entrypoint script.
COPY entrypoint .
# Change the ownership of the entry point to the runner user.
RUN chown -R github:github /home/github/entrypoint
# Make the entrypoint executable.
RUN chmod +x /home/github/entrypoint

# Copy the bundle to dist.
COPY --from=retrieve-bundle /home/github/actions-runner-linux.tar.gz /home/github
# Change the ownership of the entry point to the runner user.
RUN chown -R github:github /home/github/actions-runner-linux.tar.gz

# Get updates.
RUN apt-get update
# Install necessary dependencies.
RUN apt-get install -y sudo
RUN apt-get install -y --reinstall ca-certificates
# Remove cached packages.
RUN rm -rf /var/lib/apt/lists/*

# Add github user to sudoers.
RUN echo "github ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# Switching to the github user.
USER github

# Download and extract the GitHub Actions runner.
RUN tar xzf ./actions-runner-linux.tar.gz \
    && rm -f ./actions-runner-linux.tar.gz

# Install remaining dotnet dependencies.
RUN sudo /home/github/bin/installdependencies.sh

LABEL source_repository="https://github.com/aldhinn/gh-self"

ENTRYPOINT [ "/home/github/entrypoint" ]