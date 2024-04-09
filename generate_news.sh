#/bin/bash

LLM_API=$(oc get route llamapod -o json | jq -r .spec.host)

DEFAULT_PARAMS='{
    "n_predict": 30,
    "repeat_last_n": 40,
    "repeat_penalty": 1.30,
    "cache_prompt": true
}'

PROMPT1='
<|system|>
You are a sarcastic assistant helping creating funny breaking news title
<|user|>
A news related to JO 2024 of Paris
<|assistant|>
Paris 2024: Ganges water will be poured into the Seine to purify it
<|user|>
A random sarcastic breaking news
<|assistant|>
'

PAYLOAD1=$(echo $DEFAULT_PARAMS | jq --arg prompt "$PROMPT1" '. + {"prompt": $prompt, "temperature": 0.7}')

NEWS=$(curl -s $LLM_API/completion -H "Content-Type: application/json" -d "$PAYLOAD1" | jq -r .content)

PROMPT2='
<|system|>
You are an helpfull assistant creating json tags from news title
<|user|>
After solar eclipse, concerns about eye injuries appear to rise
<|assistant|>
{"tags": ["science", "astronomy", "health"]}
<|user|>
'"${NEWS}"'
<|assistant|>
'

GRAMMAR=$(curl -s https://raw.githubusercontent.com/ggerganov/llama.cpp/master/grammars/json.gbnf)

PAYLOAD2=$(echo $DEFAULT_PARAMS | jq --arg prompt "$PROMPT2" --arg grammar "$GRAMMAR" '. + {"prompt": $prompt, "grammar": $grammar, "temperature": 0}')

TAGS=$(curl -s $LLM_API/completion -H "Content-Type: application/json" -d "$PAYLOAD2" | jq -j .content)

echo $TAGS | jq --arg title "$NEWS" '. + {"title": $title}'
