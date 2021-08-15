import argparse
import numpy as np
import matplotlib.pyplot as plt
parser=argparse.ArgumentParser(description='Plot data from single packet.')
parser.add_argument('fname', type=str, help='name of file to plot')
args=parser.parse_args()
snapshot = np.load(args.fname)
print(snapshot.shape)
print("min, max", snapshot.min(), snapshot.max())
plt.figure()
plt.figure(figsize=(10,10))
plt.imshow(snapshot[:,:], aspect=0.10)
plt.colorbar()
plt.show()
