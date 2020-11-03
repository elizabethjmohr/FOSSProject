SITES = [
        "MART",
        "SYCA",
        "POSE"
        ]

YEARMONTH = "2020-09"

rule run_plot_data:
    input:
        expand("plots/{date}.png",
                date = YEARMONTH)

rule plot_data:
    input:
        data = expand("data/{date}/{siteCode}.rds",
                      date = YEARMONTH,
                      siteCode = SITES),
        plotScript = "analyses/plotNEONData.R"
    output: "plots/{date}.png"
    shell:"RScript {input.plotScript} {wildcards.date}"

rule get_data:
    input:
        script = "analyses/downloadNEONData.R"
    output: "data/{date}/{siteCode}.rds"
    shell: "RScript {input.script} {wildcards.siteCode} {wildcards.date}"
