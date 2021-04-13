import sys
import yaml

if len(sys.argv) < 2:
    print("Usage: make_register_docs.py path/to/jasper.per")
    exit()

with open(sys.argv[1]) as fh:
    raw = fh.read()

d = yaml.load(raw)

outfh = open('memory_map_doc.rst', 'w')

outfh.write('.. list-table:: Register Descriptions\n')
outfh.write('    :widths: 10 10 10 70\n')
outfh.write('    :header-rows: 1\n')
outfh.write('\n')
outfh.write('    * - Register Name\n')
outfh.write('      - Size (Bytes)\n')
outfh.write('      - Permission\n')
outfh.write('      - Description\n')

for ybname, yb in sorted(d['yellow_blocks'].items()):
    if yb['tag'] not in ['xps:sw_reg', 'xps:bram']:
        continue
    if yb['tag'] == 'xps:sw_reg':
        size = 4
        if yb['io_dir'] == 'From Processor':
            perm = 'r/w'
        else:
            perm = 'r'
    if yb['tag'] == 'xps:bram':
        size = yb['data_width'] * 2**yb['addr_width']
        width = yb.get('type_str', '')
        perm = 'r/w'
    name = '_'.join(ybname.split('/')[1:])
    desc = ' '.join(yb.get('desc_str', '').split('\n'))
    outfh.write('    * - %s\n' % name)
    outfh.write('      - %s\n' % size)
    outfh.write('      - %s\n' % perm)
    outfh.write('      - %s\n' % desc)
outfh.write('\n')


outfh.close()
