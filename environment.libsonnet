{
    local this = self,
    stage:: "",
    namespace:: "",
    resources:: {},

    apiVersion: 'tanka.dev/v1alpha1',
    kind: 'Environment',
    metadata: {
        name: this.stage,
    },
    spec: {
        namespace: this.namespace,
    },
    data: this.resources,
}