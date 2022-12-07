# Jackett

API Support for your favorite torrent trackers

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository                           | Name   | Version |
| ------------------------------------ | ------ | ------- |
| https://bjw-s.github.io/helm-charts/ | common | 1.1.3   |

## TL;DR

```
helm repo add homelab-charts https://tbd
helm repo update
helm install jackett homelab-charts/jackett
```

## Values

| Key                                    | Type     | Default                                                                           | Description                                                         |
| -------------------------------------- | -------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| env                                    | object   | See below                                                                         | environment variables. See image docs for more details.             |
| env.TZ                                 | string   | `"UTC"`                                                                           | Set the container timezone                                          |
| image.pullPolicy                       | string   | `"IfNotPresent"`                                                                  | image pull policy                                                   |
| image.repository                       | string   | `"ghcr.io/linuxserver/jackett"`                                                   | image repository                                                    |
| image.tag                              | string   | `nil`                                                                             |                                                                     |
| ingress.main                           | object   | See values.yaml                                                                   | Enable and configure ingress settings for the chart under this key. |
| persistence                            | object   | See values.yaml                                                                   | Configure persistence settings for the chart under this key.        |
| service                                | object   | See values.yaml                                                                   | Configures service settings for the chart.                          |
| config.indexers | string[] | `empty` | Configure which trackers are added on startup                       |
