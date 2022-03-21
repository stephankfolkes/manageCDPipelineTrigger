# Manage CD Pipeline Trigger

This repository contains a script that will create a trigger for an existing pipeline.
The webhook URL generated and webhook secret can then be configured in a [repository or organisation](https://docs.github.com/en/developers/webhooks-and-events/webhooks/about-webhooks) to automatically trigger the pipeline on events.

## How to use
Configure the variables in the `updateTrigger.sh` file.
Configure the `includeBranches` file with a comma separated list of branches.
Configure the `repositoryList` file with new line separated list of repositories.
Ensure the `includeBranches` and `repositoryList` files are within the same directory when ran.

Run `sh updateTrigger.sh`


