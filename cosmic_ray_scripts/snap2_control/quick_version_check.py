import casperfpga
import lwa_f

for hostname in ['snap01','snap02','snap02','snap04','snap05','snap06','snap07','snap08','snap09','snap10','snap11']:
    brd=casperfpga.CasperFpga(hostname)
    lwaf=lwa_f.blocks.fpga.Fpga(brd,'')
    print(hostname, ' is running version ', lwaf.get_firmware_version())

