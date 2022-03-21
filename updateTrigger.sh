#!/bin/bash

# Get and set the webhook secret
webhookSecret='1234abc'

# Set the variables
projectName='test'
triggerName='test trigger'
pipelineName='test'
serviceAccountName='Trigger-SC'

ectool createServiceAccount "$serviceAccountName" --description "Service Account for Github webhook triggers." || echo "Service account $serviceAccountName already exists."

getTrigger=$(ectool getTrigger "$projectName" "$triggerName" --pipelineName "$pipelineName")
status="$?"

if [ "$status" -eq 0 ];then
    ectool modifyTrigger "$projectName" "$triggerName" --pipelineName "$pipelineName" --triggerType 'webhook' --pluginKey 'EC-Github' --pluginParameter repositories="$(cat repositoryList)" includeBranches="$(cat includeBranches)" pushEvent='true' --serviceAccountName 'Trigger-SC' --webhookSecret "$webhookSecret"
else
    ectool createTrigger "$projectName" "$triggerName" --pipelineName "$pipelineName" --triggerType 'webhook' --pluginKey 'EC-Github' --pluginParameter repositories="$(cat repositoryList)" includeBranches="$(cat includeBranches)" pushEvent='true' --serviceAccountName 'Trigger-SC' --webhookSecret "$webhookSecret"
fi