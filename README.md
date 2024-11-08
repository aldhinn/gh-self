<h1 align="center">
<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="GitHub Logo" alt="GitHub Logo" width="100">

gh-self

[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](./LICENSE)
</h1>

[![CI](https://github.com/aldhinn/gh-self/actions/workflows/ci.yaml/badge.svg)](https://github.com/aldhinn/gh-self/actions/workflows/ci.yaml)

**gh-runner** is a set of open source docker images for running ```GitHub Actions``` workflows.

## 🚀 Usage

This image provides a self-hosted runner for GitHub Actions. When setting up and running the container, you need to map local files containing your GitHub repository URL and runner registration token to the appropriate secrets within the container.

### 🛠️ Prerequisites

Before using this self-hosted runner, make sure you have:

1. A **GitHub repository** for which you will be running workflows.
2. A **GitHub runner registration token** (provided when setting up a new self-hosted runner for your repository).

   You can get this token by following these steps:
   - Go to **Settings** > **Actions** > **Runners** in your GitHub repository.
   - Click **New self-hosted runner** and under the instructions to **Configure**, you will see the token value written in such manner.
   ```
   ./config.sh --url https://github.com/your-org/your-repo --token <TOKEN_VALUE>
   ```
   - Keep this token value safe, as it will be needed to authenticate the runner.

### ⚙️ Steps to Run the Self-Hosted Runner

1. **Prepare the required files:**
   - Create a file `GITHUB_REPO_FILE` containing the URL to your GitHub repository (e.g., `https://github.com/your-org/your-repo`).
   - Create a file `TOKEN_VALUE_FILE` containing the GitHub runner registration token generated from the repository’s runner setup page.

3. **Run the Docker container:**

   When running the Docker container, make sure to map the local files (`GITHUB_REPO_FILE` and `TOKEN_VALUE_FILE`) to the correct paths inside the container where GitHub Actions will look for them. Use the following command:

   ```bash
   docker run -d --name github-actions-self-hosed-runner \
     -v /local/path/to/GITHUB_REPO_FILE:/run/secrets/GITHUB_REPO_FILE \
     -v /local/path/to/TOKEN_VALUE_FILE:/run/secrets/TOKEN_VALUE_FILE \
     aldhinn/gh-self:amd64-debian
   ```
   (The example above used the tag ```amd64-debian``` but choose the ones you'd like from [here](https://hub.docker.com/r/aldhinn/gh-self/tags).)