local tanka = import "github.com/grafana/jsonnet-libs/tanka-util/main.libsonnet";

function(config) (
    local conf = {
        chart_dir: std.thisFile + "/../../../",
        name: error "Name must be set",
        chart: error "Chart must be set",
        namespace: "default",
        values: {},
    } + config;

    local helm = tanka.helm.new(conf.chart_dir);

    helm.template(conf.name, conf.chart, {
        namespace: conf.namespace,
        values: conf.values,
        includeCrds: true,
        apiVersions:  ["monitoring.coreos.com/v1"],
    })
)