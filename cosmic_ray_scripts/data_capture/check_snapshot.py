import argparse
import numpy as np
import matplotlib.pyplot as plt
parser=argparse.ArgumentParser(description='Plot single-board snapshot.')
parser.add_argument('fname', type=str, help='name of snapshot file to plot')
args=parser.parse_args()
snapshot = np.load(args.fname)
print(snapshot.shape)
plt.figure()
#plot time stamps
for i in range(4):
    plt.subplot(221+i)
    plt.title(str(i))
    plt.xlabel('time index')
    plt.ylabel('timestamp')
    plt.plot(snapshot[:,i])
    
#plot time stamp derivative (timestamp should always increment by 1)
plt.figure()
for i in range(4):
    timestamps=snapshot[:,i]
    print("first timestamp", timestamps[0])
    print("last timestamp", timestamps[-1])
    diff=timestamps[1:] - timestamps[:-1]
    plt.subplot(221+i)
    plt.title(str(i))
    plt.xlabel('time index')
    plt.ylabel('timestamp derivative')
    plt.plot(diff)
    plt.ylim((-5,5))
#plot timeseries for the first 16 antennas
plt.figure()
for i in range(16):
    plt.xlabel('time index')
    plt.ylabel('antenna value')
    plt.plot(snapshot[:,i+4])

#plot whole data snapshot as image
plt.figure(figsize=(10,10))
plt.imshow(snapshot[:,4:], aspect=0.10, interpolation='none')
plt.colorbar()
plt.show()
