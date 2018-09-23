#!/usr/bin/python
import healpy as hp
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams, rc
from scipy.stats.stats import pearsonr
plt.style.use(u"trygveplot")
import sys
dame = '/Users/trygveleithesvalheim/Documents/jobb/jastro/masterplots/figs/dame/dame64.fits'
dame = hp.read_map(dame)
j=0
for i in sys.argv[1:]:
    pip1=str(i)
    pip = hp.read_map(pip1)

    s=2
    b, m = np.polyfit(dame, pip, 1)
    r, p = pearsonr(dame, pip)
    print "new a=%.3g"%(b)
    plt.scatter(dame,pip, label=pip1+" r=%.4g"%(r),s=s, color="C"+str(j))
    plt.plot(np.unique(dame), np.poly1d(np.polyfit(dame, pip, 1))(np.unique(dame)),'--', color="C"+str(j))
    j+=1
#plt.tick_params(axis='both', which='major', labelsize=11)
plt.xlabel(r"Dame et al. CO amplitude $[\mathrm{K_{RJ}}\mathrm{km/s}]$")
plt.ylabel(r"CO file amplitude $[\mathrm{K_{RJ}}\mathrm{km/s}]$")
plt.legend(markerscale=4)
plt.xlim(0,200)
plt.ylim(0,200)
#plt.savefig("co32scatter.pdf", bbox_inches='tight',  pad_inches=0.02)
plt.show()
