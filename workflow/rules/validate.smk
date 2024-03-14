FIGURES_VALIDATE = [
    "seasonal_stacked_plot",
    "carrier_production_bar",
    "production_deviation_bar",
    "val_bar_regional_emissions",
    "val_generator_data_panel",
    "val_heatmap_curtailment",
    "val_heatmap_capacity_factor",
    "val_box_region_lmps",
]


rule plot_validation_figures:
    input:
        network=RESULTS
        + "{interconnect}/networks/elec_s_{clusters}_ec_l{ll}_{opts}_{sector}_operations.nc",
        historic_first=DATA + "eia/6moFiles/EIA930_BALANCE_2019_Jan_Jun.csv",
        historic_second=DATA + "eia/6moFiles/EIA930_BALANCE_2019_Jul_Dec.csv",
    output:
        **{
            fig: RESULTS
            + "{interconnect}/figures/cluster_{clusters}/l{ll}_{opts}_{sector}/%s.pdf"
            % fig
            for fig in FIGURES_VALIDATE
        },
    log:
        "logs/plot_figures/validation_{interconnect}_{clusters}_l{ll}_{opts}_{sector}.log",
    threads: 1
    resources:
        mem_mb=5000,
    script:
        "../scripts/plot_validation_production.py"
