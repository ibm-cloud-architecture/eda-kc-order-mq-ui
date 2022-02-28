# eda-kc-order-mq-ui

Vejs application to demonstrate the Saga pattern. This is using NGinx to deliver the application and to proxy calls to backend services.


## Project setup

### Pre-requisites, install node, yarn, npm and vue CLI.

```sh
```

### install packages

```sh
yarn install
```

### Compiles and hot-reloads for development

```sh
yarn serve
```

### Compiles and minifies for production

```sh
yarn build
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration

See [Configuration Reference](https://cli.vuejs.org/config/).


## Build for openshift deployment

```
docker build -t quay.io/ibmcase/eda-kc-order-mq-ui .
```

## Deploy to OpenShift

All the deployment, config map... are defined in the [eda-kc-gitops repository in this folder](https://github.com/ibm-cloud-architecture/eda-kc-gitops/tree/main/environments/kc-dev/apps/app-eda-kc-order-mq-ui/services/eda-kc-order-mq-ui/base/config).

For instructions on how to deloy this component and the rest of the solution see the main read me of this eda-kc-gitops repo.