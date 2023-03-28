#This is a copy of the code I used to create the channel map text file which maps ADC input numbers (digital input in the system status and config spreadsheet) to cosmic ray output index and vice versa.  The code used to be part of the subarray_threshold_scan jupyter notebook but that's a confusing place for it. I haven't re-run it since moving it here.

#I set the data source to constant and then sent a snapshot, from which I construct the mapping to look up what digital input corresponds to a given channel index in my snapshots. This does not need to be repeated, since I saved the mapping file.

snapshotfname='/home/ubuntu/kp/caltech-lwa/cosmic_ray_scripts/data_capture/channel-mapping-snapshot.npy'
snapshot=np.load(snapshotfname)
plt.figure(figsize=(20,15))
channelmap=np.zeros((2,64))

for i in range(64):
    channelmap[0,i]=i
    channelmap[1,i]=snapshot[0,i+4]
    plt.subplot(8,8,1+i)
    plt.title(i)
    plt.plot(snapshot[:,i+4])
    if i > 55:
        plt.xlabel('frequency [MHz]')
    if i%8==0:
        plt.ylabel('power')
print(channelmap)
#np.savetxt("channelmap.txt",channelmap)
