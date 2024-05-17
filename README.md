# Llamapod

Drop easily your LLM API on an OpenShift Cluster

## Getting Started

```shell
oc new-project llm-api
oc new-app https://github.com/fjcloud/llamapod
oc expose svc/llamapod
```

## Play with it

### generate_news.sh

In this example you will run one time a prompt for getting a creative news title and again another less creative, more limited prompt for getting tags in json

```shell
./generate_news.sh
```

Expected output

```shell
{
  "tags": [
    "technology",
    "electricity",
    "toasting"
  ],
  "title": "Tesla Model 3: It's not just a car, but also the world's best electric toaster"
}
```

### webserver.sh

In this example we will emulate a web server using llm, a good way for creating a honeypot

```shell
nc -l -p 3000 -k -e ./webserver.sh
```

Expected response from netcat :

```shell
curl localhost:3000/api/ping -v -H "Host: hello.llm"
{
    "message": "Pong!"
}
curl localhost:3000/api/bye -H "Host: hello.llm"
{
    "message": "Bye!"
}
curl -X POST localhost:3000/api/v1
{
    "message": "success"
}
```

## Benchmark

```shell
oc exec deploy/llamapod -- /bin/sh ./TinyLlama-1.1B-Chat-v1.0.F16.llamafile -f getty.txt -t 0 -n 22
```

Example output on ARM Ampere Altra 16 cores :

```shell
...
llama_print_timings:        load time =      83.73 ms
llama_print_timings:      sample time =       1.06 ms /    22 runs   (    0.05 ms per token, 20793.95 tokens per second)
llama_print_timings: prompt eval time =    1063.97 ms /   217 tokens (    4.90 ms per token,   203.95 tokens per second)
llama_print_timings:        eval time =    1146.98 ms /    21 runs   (   54.62 ms per token,    18.31 tokens per second)
llama_print_timings:       total time =    2219.06 ms /   238 tokens
```

## Uninstall

```shell
oc delete all -l app=llamapod
```

That's all for the moment!
