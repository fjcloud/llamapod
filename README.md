# Llamapod

Drop easily your LLM API on an OpenShift Cluster

## Get Started

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
    "business",
    "marketing"
  ],
  "title": "An American restaurant chain has been accused of using fake waiters in its adverts, leading to a backlash from customers and the company itself"
}
```

That's all for the moment!
