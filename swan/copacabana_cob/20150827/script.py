from numpy import *
import matplotlib.pyplot as plt

data = np.loadtxt('bat_100_bg.prn')
plt.psd(b)
plt.show()




z = np.loadtxt('bat_100_bg.prn')
np.flipud(z)
plt.figimage(z)
plt.show()