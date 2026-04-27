#!/usr/bin/env python3

"""
This script patches up the `casperfpga` submodule to get it working with Py3.10+.
This may seem like a strange choice when you could just update the submodule's
commit hash but I don't really want update/debug that right now.  Maybe some day.
"""

import os
import sys

PATCHES = {'./libs/casperfpga/src/casperfpga.py': [['import collections',
                                                    'try:\n    from collections import Callable\nexcept(ImportError):\n    # starting in Python 3.10, Callable is in abc\n    from collections.abc import Callable'],
                                                   ['if not isinstance(known_device_class, collections.Callable):',
                                                    'if not isinstance(known_device_class, Callable):']
                                                  ],
            './libs/casperfpga/src/transport_katcp.py': [["inform.arguments.append('-1')",
                                                          "inform.arguments.append(b'-1')"],
                                                        ]
          }


def main(args):
    for filename,patches in PATCHES.items():
        if os.path.exists(filename):
            print(f"Applying {len(patches)} patch(es) to '{filename}'")
            
            os.rename(filename, filename+'.old')
            with open(filename+'.old', 'r') as oh:
                with open(filename, 'w') as fh:
                    changed = False
                    for i,line in enumerate(oh):
                        for patch in patches:
                            line2 = line.replace(*patch)
                            if line2 != line:
                                print(f"  Patch applied at line {i+1}")
                                changed = True
                            line = line2
                        fh.write(line)
                        
                    if not changed:
                        print("  Nothing applied")


if __name__ == '__main__':
    main(sys.argv[1:])
