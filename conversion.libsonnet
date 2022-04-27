
{
    ingressConfig: {
        local this = self,
        certificates:: [],
        path:: "/*",

        hosts: [
            {
                host: host,
                paths: [
                    { path: this.path },
                ],
            }
            for cert in this.certificates
            for host in cert.spec.dnsNames
        ],
        tls: [
            {
                secretName: cert.spec.secretName,
                hosts: cert.spec.dnsNames,
            }
            for cert in this.certificates
        ],
    },
    imageDigest(image): {
        local digest = std.native("skopeoInspect")(std.format("%s:%s", [image.repository, image.tag])).Digest,
        local tagSplit = std.split(digest, ":"),

        image+: {
            repository: std.format("%s@sha256", super.repository),
            tag: tagSplit[1],
        }
    },
}