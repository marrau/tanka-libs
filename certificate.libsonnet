{
    local this = self,
    name:: "",
    secretName:: std.format("%s-tls", this.name),
    domains:: [],
    issuer:: "letsencrypt-prod-no-follow",


    apiVersion: "cert-manager.io/v1",
    kind: "Certificate",
    metadata: {
        name: this.name,
    },
    spec: {
        secretName: this.secretName,
        dnsNames: this.domains,
        issuerRef: {
            name: this.issuer,
            kind: "ClusterIssuer",
            group: "cert-manager.io",
        },
    },
}