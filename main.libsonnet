local environment = import "environment.libsonnet";
local certificate = import "certificate.libsonnet";

{
    environment: environment,
    certificate: certificate,
}