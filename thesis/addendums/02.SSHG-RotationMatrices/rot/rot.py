import sys
import yaml
import numpy as np

infile = sys.argv[1]
PHI = np.radians(float(sys.argv[2]))

def parse_input(infile):
    with open(infile) as data_file:
        params = yaml.load(data_file)
    return params

def shgload(infile):
    global freq
    freq, re1w, im1w, re2w, im2w = np.loadtxt(infile, unpack=True)
    real = re1w + re2w
    imag = im1w + im2w
    chi2 = real + 1j * imag
    return chi2

PARAM = parse_input(sys.argv[1])    # Parses input file

CHI2 = {}
ALL_COMPONENTS = ['xxx', 'xyy', 'xzz', 'xyz', 'xxz', 'xxy',
                  'yxx', 'yyy', 'yzz', 'yyz', 'yxz', 'yxy',
                  'zxx', 'zyy', 'zzz', 'zyz', 'zxz', 'zxy']
for component in ALL_COMPONENTS:
    if component in PARAM['chi2']:
        value = PARAM['chi2'][component]
        shg = shgload(value)
        CHI2[component] = shg

ROT = { 'XXX': +   np.sin(PHI)**3              * CHI2['xxx']
               +   np.sin(PHI)*np.cos(PHI)**2  * CHI2['xyy']
               - 2*np.sin(PHI)**2*np.cos(PHI) * CHI2['xxy']
               -   np.sin(PHI)**2*np.cos(PHI)  * CHI2['yxx']
               -   np.cos(PHI)**3              * CHI2['yyy'] 
               + 2*np.sin(PHI)*np.cos(PHI)**2 * CHI2['yxy'] }

np.savetxt('out.txt', np.column_stack((freq, ROT['XXX'].real, ROT['XXX'].imag)),
           fmt=('%05.2f    % .8e    % .8e'))
