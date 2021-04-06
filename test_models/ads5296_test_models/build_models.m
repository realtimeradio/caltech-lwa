% Start with clock 1, since this is the most useful compile
% until the new boards arrive
for clock=[1 0]
    for fmc_bver = [1 2]
        target_model = ['ads5296_fmca_r2_fmcb_r' num2str(fmc_bver) '_clk' num2str(clock)]
        a = jasper_frontend(target_model); system([a ' --jobs 12'])
    end
end
