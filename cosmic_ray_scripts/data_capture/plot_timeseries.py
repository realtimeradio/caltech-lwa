import argparse
import numpy as np
import matplotlib.pyplot as plt
parser=argparse.ArgumentParser(description='Plot single-board snapshot.')
parser.add_argument('fname', type=str, help='name of snapshot file to plot')
args=parser.parse_args()
snapshot = np.load(args.fname)
print(snapshot.shape)

#plot timeseries
for j in range(4):
    plt.figure(j+1)
    for i in range(16):
        plt.subplot(4,4,i+1)
        plt.plot(snapshot[:,i+16*j+4],',')
        
        if i > 11:
            plt.xlabel('time index')
        if i%4==0:
            plt.ylabel('antenna value')
    

plt.show()
