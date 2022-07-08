# Atlantis docker image for azure

If you are using [azurerm] as [terraform-provider], then you are out of luck with the official image from [atlantis], as it is missing  [azure-cli] and python, which is required by [azure-cli].

With this image I want to overcome that problem, by extending the atlantis base image as follows

- install python
- install azure-cli

[atlantis]: https://github.com/runatlantis/atlantis
[azurerm]: https://www.terraform.io/language/settings/backends/azurerm
[azure-cli]: https://docs.microsoft.com/en-us/cli/azure/