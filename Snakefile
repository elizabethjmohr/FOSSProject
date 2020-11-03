SITES = [
        "MART",
        "SYCA",
        "POSE"
        ]

YEARMONTH = "2020-09"

rule get_data:
    input:
        site: SITES
        monthyear: YEARMONTH
        script: "/analyses/downloadNEONData.R"
    output:"/data/{input.monthyear}/{input.site}.rds"
    shell: "RScript {input.script} {input.site} {input.year}"

rule plot_data:
    input:
        monthyear: YEARMONTH
        script: "/analyses/plotNEONData.R"
    output:"/plots/{input.monthyear}.png"
    script:"RScript {input.script} {input.year}"
