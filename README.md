# svaeva-redux

<div align="center">

[![Build status](https://github.com/svaeva-redux/svaeva-redux/workflows/build/badge.svg?branch=master&event=push)](https://github.com/svaeva-redux/svaeva-redux/actions?query=workflow%3Abuild)
[![Python Version](https://img.shields.io/pypi/pyversions/svaeva-redux.svg)](https://pypi.org/project/svaeva-redux/)
[![Dependencies Status](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)](https://github.com/svaeva-redux/svaeva-redux/pulls?utf8=%E2%9C%93&q=is%3Apr%20author%3Aapp%2Fdependabot)

[![Code style: ruff](https://img.shields.io/badge/code%20style-ruff-000000.svg)](https://github.com/charliermarsh/ruff)
[![Security: bandit](https://img.shields.io/badge/security-bandit-green.svg)](https://github.com/PyCQA/bandit)
[![Pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/svaeva-redux/svaeva-redux/blob/master/.pre-commit-config.yaml)
[![Semantic Versions](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--versions-e10079.svg)](https://github.com/svaeva-redux/svaeva-redux/releases)
[![License](https://img.shields.io/github/license/svaeva-redux/svaeva-redux)](https://github.com/svaeva-redux/svaeva-redux/blob/master/LICENSE)
![Coverage Report](assets/images/coverage.svg)

`svaeva-redux` is Python package and software suite to deploy Language Agents (LA).

</div>

## Introduction

`svaeva-redux` is deployed using 5 docker containers that communicate between each other.

These are
1. A [redis](https://redis.io/) database that stores configurations and all client data.
2. ```handlers``` A client handler used to accept incoming requests from specific programs, e.g., WhatsApp or Telegram messengers.
3. ```langserve-app``` A [langserve](https://github.com/langchain-ai/langserve) app defining the features of the LA.
4. ```manager``` A frontend relying on a [streamlit](https://streamlit.io/) interface to quickly change system prompts of the Language Agent (LA) deployed.
5. ```schedulers``` A "gifting" server capable of sending generative model assets to users at pre-defined schedules based on their interactions with the LA. These assets are placed on a queue.

## 🚀 Deployment Example 

The following is a demonstration of how to easily deploy an LA to Telegram Messenger with changable system prompts.

This LA behavior allows for
1. Normal texting.
2. Sending voice messages and fast transcription from Speech to Text (STT).
3. Image understanding via a Visual-Language Model (VLM).
4. Scheduling the gifting of image assets based on user interaction from DALL-E

This example utilizes the following external APIs:
1. OpenAI (Visual-language understanding)
2. Deepgram (Speech to Text handling)
3. Telegram (client handler).

Deploying the following example of a Language Agent (current default) relies on a single docker-compose file to spin up the appropriate containers that will talk to each other.

Before that, let's ensure we have the appropriate .env file populated with the needed API keys and settings.

#### Step 1: Define environment variables for servers

See the following [guide](https://core.telegram.org/bots/tutorial#obtain-your-bot-token) section to do this easily (2 min).


#### Step 2: Prepare your .env file with appropriate parameters and API keys

The following ```.env``` file with the following variables _must_ be placed in the most parent directory of this repository 

```bash
REDIS_HOST=redis-stack # this is the name of the container in the compose file.
REDIS_PORT=6379 # default
REDIS_DB_INDEX=0 # default
REDIS_USER=<YOUR REDIS USER (OPTIONAL)>
REDIS_PASSWORD=<YOUR REDIS PASSWORD (OPTIONAL)>
REDIS_OM_URL=redis://redis-stack:6379/0 # Redis URL for redis-om use

LANGSERVE_HOST=langserve-app # default container name
LANGSERVE_PORT=8000

TELEGRAM_BOT_TOKEN=<YOUR TELEGRRAM BOT TOKEN> # the bot token you got from step 1

OPENAI_API_KEY=<YOUR OPENAI API KEY>
DEEPGRAM_API_KEY=<YOUR DEEPGRAM API KEY>
```

#### Step 3: Define environment variables for the Streamlit Prompt Change Server.
The streamlit app is protected by a password to prevent someone changing the settings without permission.
Write the line below with your desired username and password into ```secrets.toml``` in the same location as the ```/.env``` file.
```bash
your_username = "<YOUR PASSWORD>"
```

#### Step 4: Use [docker-compose](https://docs.docker.com/get-docker/) to build containers and deploy!

Now as the final step we can deploy our servers and enjoy our bot!
```bash
docker-compose -f docker-compose-multimodal-telegram-bot.yaml up -d
```

## 🎯 What's next

Well, that can be up to you 💪🏻. 

### Open source community features


## 📈 Releases


### List of labels and corresponding titles

|               **Label**               |  **Title in Releases**  |
| :-----------------------------------: | :---------------------: |
|       `enhancement`, `feature`        |       🚀 Features       |
| `bug`, `refactoring`, `bugfix`, `fix` | 🔧 Fixes & Refactoring  |
|       `build`, `ci`, `testing`        | 📦 Build System & CI/CD |
|              `breaking`               |   💥 Breaking Changes   |
|            `documentation`            |    📝 Documentation     |
|            `dependencies`             | ⬆️ Dependencies updates |

You can update it in [`release-drafter.yml`](https://github.com/svaeva-redux/svaeva-redux/blob/master/.github/release-drafter.yml).

GitHub creates the `bug`, `enhancement`, and `documentation` labels for you. Dependabot creates the `dependencies` label. Create the remaining labels on the Issues tab of your GitHub repository, when you need them.

## 🛡 License

[![License](https://img.shields.io/github/license/elacosse/svaeva-redux)](https://github.com/elacosse/svaeva-redux/blob/master/LICENSE)

This project is licensed under the terms of the `MIT` license. See [LICENSE](https://github.com/svaeva-redux/svaeva-redux/blob/master/LICENSE) for more details.

## 📃 Citation

```bibtex
@misc{svaeva-redux,
  author = {Eric Lacosse},
  title = {`svaeva-redux` is Python package and software suite to deploy Language Agents (LA).},
  year = {2024},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/elacosse/svaeva-redux}}
}
```

