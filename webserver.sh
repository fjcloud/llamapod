#!/bin/bash

LLM_API=$(oc get route llamapod -o json | jq -r .spec.host)

TMP_FILE=$(mktemp)

while IFS= read -r -t 0.2 line; do
    echo "$line" >> "$TMP_FILE"
done

REQUEST=$(cat $TMP_FILE)

DEFAULT_PARAMS='{
    "n_predict": 128,
    "repeat_last_n": 40,
    "repeat_penalty": 1.30,
    "cache_prompt": true,
    "stop": ["<", "`"]
}'

PROMPT1='
<|system|>
You are an HTTP server. Given a URL, return the corresponding HTTP response and content. No explanations. You respect rfc2616.
<|user|>
GET /healthz HTTP/1.1
Host: hello.world
User-Agent: curl/8.4.0
Accept: */*
<|assistant|>
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8

ok
<|user|>
'"${REQUEST}"'
<|assistant|>
'
PAYLOAD1=$(echo $DEFAULT_PARAMS | jq --arg prompt "$PROMPT1" '. + {"prompt": $prompt, "temperature": 0.1}')

curl -s $LLM_API/completion -H "Content-Type: application/json" -d "$PAYLOAD1" | jq -r .content

rm $TMP_FILE
