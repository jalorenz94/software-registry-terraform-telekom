# Evaluation of the Software Registry for Containers

1. Build custom image

`cd custom-image && docker build -t <registry_url>/rytle-test:latest .`

2. Push image to Software Registry

`docker push <registry_url>/rytle-test:latest`

3. Deploy image with terraform

`terraform init` <br />
`terraform plan` <br />
`terraform apply`