local environment = import "environment.libsonnet";
local certificate = import "certificate.libsonnet";
local helm = import "helm.libsonnet";

{
    environment: environment,
    certificate: certificate,
    helm: helm,
}