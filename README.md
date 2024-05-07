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

## Uninstall

```shell
oc delete all -l app=llamapod
```

That's all for the moment!
