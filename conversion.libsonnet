
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
}