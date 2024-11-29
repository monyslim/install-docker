# Install Docker GitHub Action
A simple and reusable GitHub Action to install Docker on your runner using Docker's official installation commands.

## Features
- Docker's latest stable version by default.
- Supports installing specific versions of Docker.
- Includes additional components:
    - Docker Compose Plugin.
    - Docker Buildx Plugin.

## Usage
To use this action in your workflows, include it in your **.github/workflows/<workflow-name>.yml file.**

## Basic Example to test the action 
The following example installs the latest stable version of Docker:
```yaml
name: Install Docker Workflow

on: push

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Install Docker
        uses: ./ # Uses the action from the current repository
```

## Using the action in your workflow
To use this action in your **CI/CD** Pipeline
```yaml
name: Install Docker Workflow

on: push

jobs:
  install-docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Install Docker
        uses: monyslim/docker-install-action@v1
```

## How It Works
1. Updates the package index on the runner.
2. Installs prerequisites for Docker.
3. Adds Docker’s GPG key and repository to the runner.
4. Installs Docker along with Compose and Buildx plugins.
5. Verifies Docker installation by running **docker --version.**

## Outputs
This action does not produce direct outputs but ensures Docker is installed and ready for use in subsequent steps.

# License
This project is licensed under the MIT License. See the **LICENSE** file for details.

# Support
For any issues or suggestions, please open an issue in this repository’s issue tracker.