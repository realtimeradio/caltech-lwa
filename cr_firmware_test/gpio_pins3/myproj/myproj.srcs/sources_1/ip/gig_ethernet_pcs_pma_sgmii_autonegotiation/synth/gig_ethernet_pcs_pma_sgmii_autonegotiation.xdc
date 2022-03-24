

#set_false_path  -to [get_pins -hier -filter {name =~  *core_resets_i/pma_reset_pipe_reg*/PRE}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *core_resets_i/pma_reset_pipe_reg*}] -filter {REF_PIN_NAME =~ PRE}]
#set_false_path  -to [get_pins -hier -filter {name =~  *core_resets_i/pma_reset_pipe*[0]/D}]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *core_resets_i/pma_reset_pipe*[0]}] -filter {REF_PIN_NAME =~ D}]





# Control Gray Code delay and skew across clock boundary
#set_max_delay -from [get_cells -hier -filter {name =~  *pcs_pma_block_i/transceiver_inst/rx_elastic_buffer_inst/wr_addr_*_reg[*]}] -to [get_pins -hier -filter { name =~ *reclock_wr_addrgray[*].sync_wr_addrgray/data_sync*/D}] 16 -datapath_only
set_max_delay -from [get_cells -hier -filter {name =~  *pcs_pma_block_i/transceiver_inst/rx_elastic_buffer_inst/wr_addr_*_reg[*]}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *reclock_wr_addrgray[*].sync_wr_addrgray/data_sync*}] -filter {REF_PIN_NAME =~ D}] 16 -datapath_only
#set_max_delay -from [get_cells -hier -filter {name =~ *pcs_pma_block_i/transceiver_inst/rx_elastic_buffer_inst/rd_addr_*_reg[*]}] -to [get_pins -hier -filter { name =~ *reclock_rd_addrgray[*].sync_rd_addrgray/data_sync*/D}] 8 -datapath_only
set_max_delay -from [get_cells -hier -filter {name =~ *pcs_pma_block_i/transceiver_inst/rx_elastic_buffer_inst/rd_addr_*_reg[*]}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *reclock_rd_addrgray[*].sync_rd_addrgray/data_sync*}] -filter {REF_PIN_NAME =~ D}] 8 -datapath_only

# Constrain between Distributed Memory (output data) and the 1st set of flip-flops
#set_false_path -from [get_clocks -of [get_pins -hier -filter { name =~ */transceiver_inst/gig_ethernet_pcs_pma_sgmii_autonegotiation_gt_i/inst/rxoutclk_out* }]] -to [get_pins -hierarchical -filter { name =~ *rx_elastic_buffer_inst/rd_data_reg*/D } ]
set_false_path -from [get_clocks -of [get_pins -of [get_cells -hierarchical -filter {NAME =~ *transceiver_inst/gig_ethernet_pcs_pma_sgmii_autonegotiation_gt_i/inst}] -filter {REF_PIN_NAME =~ rxoutclk_out*}]] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *rx_elastic_buffer_inst/rd_data_reg*}] -filter {REF_PIN_NAME =~ D}]

#set_false_path -from [get_pins -hierarchical -filter { name =~  *transceiver_inst/rx_elastic_buffer_inst/initialize_ram_complete_reg/C}] -to [get_pins -hierarchical -filter { name =~ *rx_elastic_buffer_inst/sync_initialize_ram_comp/data_sync_reg*/D } ]
set_false_path -from [get_pins -of [get_cells -hierarchical -filter {NAME =~ *transceiver_inst/rx_elastic_buffer_inst/initialize_ram_complete_reg}] -filter {REF_PIN_NAME =~ C}] -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *rx_elastic_buffer_inst/sync_initialize_ram_comp/data_sync_reg*}] -filter {REF_PIN_NAME =~ D}]


# false path constraints to async inputs coming directly to synchronizer
#set_false_path -to [get_pins -hier -filter {name =~ *SYNC_*/data_sync*/D }]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *SYNC_*/data_sync*}] -filter {REF_PIN_NAME =~ D}]
#set_false_path -to [get_pins -hier -filter {name =~ */sync_block_reset_done/data_sync_reg1/D }]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *sync_block_reset_done/data_sync_reg1}] -filter {REF_PIN_NAME =~ D}]
#set_false_path -to [get_pins -hier -filter {name =~ *reset_sync*/PRE }]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *reset_sync*}] -filter {REF_PIN_NAME =~ PRE}]

#set_false_path -to [get_pins -hier -filter {name =~ */*sync_speed_10*/data_sync*/D }]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *sync_speed_10*/data_sync*}] -filter {REF_PIN_NAME =~ D}]
#set_false_path -to [get_pins -hier -filter {name =~ */*gen_sync_reset/reset_sync*/PRE }]
set_false_path -to [get_pins -of [get_cells -hierarchical -filter {NAME =~ *gen_sync_reset/reset_sync*}] -filter {REF_PIN_NAME =~ PRE}]




