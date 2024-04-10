# Llamapod

Drop easily your LLM API on an OpenShift Cluster

## Getting Started

```shell
oc new-project llm-api
oc new-app https://github.com/fjcloud/llamapod
oc expose svc/llamapod
```

## Play with it

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

## Uninstall

```shell
oc delete all -l app=llamapod
```

That's all for the moment!
