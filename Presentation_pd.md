---
title: Lessons learned from running Terraform at reasonable scale
theme: solarized
revealjs-url: https://unpkg.com/reveal.js/
---

> Why easy, when we can make it complicated?
> -- the unknown platform engineer

Utilizing FluxCD, Weaveworks TF-Controller and boring-registry at [LYNQTECH](https://www.lynq.tech/)

# Daniel Ciaglia // _Consultant_ { .r-fit-text }

:::::: {.columns}
::: {.column width="50%"}

- **Freelance**
  _since 2022_
- **TIER Mobility SE**
  _Director of Engineering_ 
- **kreuzwerker GmbH**
  _Principal Consultant_
- **Bundesdruckerei GmbH**
  _Senior Support Manager_
- _[**some more**]_
- SCUBA dive instructor
- **AWS User Group Berlin**
  co-organiser
:::
::: {.column width=50%}

![](assets/qr-linkedin.png){width=50%}

![](assets/qr-sigterm.png){width=50%}

:::
::::::

# Today's menu

1. A typical Terraform stack evolution
2. Running Terraform in GitOps
3. Thoughts on the stack
4. Architectural Decision Records summary

# (1.1) Typical Terraform stack evolution[^1]

_Stack: Terraform root module[^2], tracked with 1 state file_

_Related_: Highly recommend talk "Terraform: from zero to madness" by [@Timur Bublik](https://sessionize.com/timur-bublik/)

## (1.1.1) in the beginning

:::::: {.columns}
::: {.column width="33%"}

- you start your project
- put everything in 1 directory
- maybe split files by broader domains.
:::
::: {.column}

```text
.
├── databases.tf
├── vpc.tf
├── main.tf
├── outputs.tf
└── terraform.tf
```
:::
::::::

# Sources + Links

## Images
1. FluxCD documentation - https://fluxcd.io/flux/components/
2. Weave GitOps // Terraform Controller documentation - https://weaveworks.github.io/tf-controller/
3. Weave GitOps // The Policy Ecosystem - https://docs.gitops.weave.works/docs/policy/getting-started/

[^1]: your experience might be different :smile:

[^2]: https://developer.hashicorp.com/terraform/language/files#the-root-module

[^3]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself

[^4]: HashiTalks DACH 2020 - [Opinionated terraform modules and a registry](https://www.sigterm.de/2020/12/03/hashitalks-dach/)

[^5]: [How TIER switched paradigms - from team- to service-centric](https://tier.engineering/How-TIER-switched-paradigms-from-team-to-service-centric-Part-1)

[^6]: [Sensitive Data in State](https://developer.hashicorp.com/terraform/language/state/sensitive-data)

[^7]: [TF-CIX as an approach to share information between terraform stacks](https://www.sigterm.de/2021/09/02/tier-infra-part-3/)

[^8]: https://fluxcd.io/flux/components/

[^9]: https://github.com/weaveworks/tf-controller

[^10]: https://fluxcd.io/flux/components/kustomize/kustomizations/#post-build-variable-substitution/

[^11]: https://github.com/weaveworks/weave-gitops and https://docs.gitops.weave.works/

[^12]: https://fluxcd.io/flux/cmd/flux\_push\_artifact/

[^13]: https://www.opentofu.org/

[^14]: https://github.com/weaveworks/tf-controller/releases/tag/v0.16.0-rc.3

[^15]: Introducing the BACK Stack! - https://www.youtube.com/watch?v=SMlR12uwMLs

[^16]: [https://external-secrets.io/](https://external-secrets.io/latest/), [stakater/Reloader](https://github.com/stakater/Reloader)

[^17]: [Weave Policy Engine](https://docs.gitops.weave.works/docs/policy/intro/), [Integrate TF Controller with Flux Receivers and Alerts](https://weaveworks.github.io/tf-controller/use-tf-controller/flux-receiver-and-alert/), [Open Policy Agent](https://www.openpolicyagent.org/)

[^18]: _**Please note**: As the tf-runner ServiceAccount is usually very powerful, do not run it in an accessible namespace!_