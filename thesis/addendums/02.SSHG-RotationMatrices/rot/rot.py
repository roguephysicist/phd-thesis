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

CHI2_ROT = {
    'XXX' : + np.sin(gamma)**3*CHI2['xxx'] + np.sin(gamma)*np.cos(gamma)**2*CHI2['xyy'] - 2*np.sin(gamma)**2*np.cos(gamma)*CHI2['xxy'] \
            - np.sin(gamma)**2*np.cos(gamma)*CHI2['yxx'] - np.cos(gamma)**3*CHI2['yyy'] + 2*np.sin(gamma)*np.cos(gamma)**2*CHI2['yxy']
    'XYY' : + np.sin(gamma)*np.cos(gamma)**2*CHI2['xxx'] + np.sin(gamma)**3*CHI2['xyy'] + 2*np.sin(gamma)**2*np.cos(gamma)*CHI2['xxy'] \
            - np.cos(gamma)**3*CHI2['yxx'] - np.sin(gamma)**2*np.cos(gamma)*CHI2['yyy'] - 2*np.sin(gamma)*np.cos(gamma)**2*CHI2['yxy']
    'XZZ' : + np.sin(gamma)*CHI2['xzz'] - np.cos(gamma)*CHI2['yzz']
    'XYZ' : + np.sin(gamma)**2*CHI2['xyz'] + np.sin(gamma)*np.cos(gamma)*CHI2['xxz'] \
            - np.sin(gamma)*np.cos(gamma)*CHI2['yyz'] - np.cos(gamma)**2*CHI2['yxz']
    'XXZ' : - np.sin(gamma)*np.cos(gamma)*CHI2['xyz'] + np.sin(gamma)**2*CHI2['xxz'] \
            + np.cos(gamma)**2*CHI2['yyz'] - np.sin(gamma)*np.cos(gamma)*CHI2['yxz']
    'XXY' : + np.sin(gamma)**2*np.cos(gamma)*CHI2['xxx'] - np.sin(gamma)**2*np.cos(gamma)*CHI2['xyy'] + (np.sin(gamma)**3 - np.sin(gamma)*np.cos(gamma)**2)*CHI2['xxy'] \
            - np.sin(gamma)*np.cos(gamma)**2*CHI2['yxx'] - np.sin(gamma)*np.cos(gamma)**2*CHI2['yyy'] + (np.cos(gamma)**3 - np.sin(gamma)**2*np.cos(gamma))*CHI2['yxy']
    'YXX' : + np.sin(gamma)**2*np.cos(gamma)*CHI2['xxx'] + np.cos(gamma)**3*CHI2['xyy'] - 2*np.sin(gamma)*np.cos(gamma)**2*CHI2['xxy'] \
            + np.sin(gamma)**3*CHI2['yxx'] + np.sin(gamma)*np.cos(gamma)**2*CHI2['yyy'] - 2*np.sin(gamma)**2*np.cos(gamma)*CHI2['yxy']
    'YYY' : + np.cos(gamma)**3*CHI2['xxx'] + np.sin(gamma)**2*np.cos(gamma)*CHI2['xyy'] + 2*np.sin(gamma)*np.cos(gamma)**2*CHI2['xxy'] \
            + np.sin(gamma)*np.cos(gamma)**2*CHI2['yxx'] + np.sin(gamma)**3*CHI2['yyy'] + 2*np.sin(gamma)**2*np.cos(gamma)*CHI2['yxy']
    'YZZ' : + np.cos(gamma)*CHI2['xzz'] + np.sin(gamma)*CHI2['yzz']
    'YYZ' : + np.sin(gamma)*np.cos(gamma)*CHI2['xyz'] + np.cos(gamma)**2*CHI2['xxz'] \
            + np.sin(gamma)**2*CHI2['yyz'] + np.sin(gamma)*np.cos(gamma)*CHI2['yxz']
    'YXZ' : - np.cos(gamma)**2*CHI2['xyz'] + np.sin(gamma)*np.cos(gamma)*CHI2['xxz'] \
            - np.sin(gamma)*np.cos(gamma)*CHI2['yyz'] + np.sin(gamma)**2*CHI2['yxz']
    'YXY' : + np.sin(gamma)*np.cos(gamma)**2*CHI2['xxx'] - np.sin(gamma)*np.cos(gamma)**2*CHI2['xyy'] - (np.cos(gamma)**3 - np.sin(gamma)**2*np.cos(gamma))*CHI2['xxy'] \
            + np.sin(gamma)**2*np.cos(gamma)*CHI2['yxx'] - np.sin(gamma)**2*np.cos(gamma)*CHI2['yyy'] + (np.sin(gamma)**3 - np.sin(gamma)*np.cos(gamma)**2)*CHI2['yxy']
    'ZXX' : + np.sin(gamma)**2*CHI2['zxx'] + np.cos(gamma)**2*CHI2['zyy'] - 2*np.sin(gamma)*np.cos(gamma)*CHI2['zxy']
    'ZYY' : + np.cos(gamma)**2*CHI2['zxx'] + np.sin(gamma)**2*CHI2['zyy'] + 2*np.sin(gamma)*np.cos(gamma)*CHI2['zxy']
    'ZZZ' : CHI2['zzz']
    'ZYZ' : + np.sin(gamma)*CHI2['zyz'] + np.cos(gamma)*CHI2['zxz']
    'ZXZ' : - np.cos(gamma)**CHI2['zyz'] + np.sin(gamma)**CHI2['zxz']
    'ZXY' : + np.sin(gamma)*np.cos(gamma)*CHI2['zxx'] - np.sin(gamma)*np.cos(gamma)*CHI2['zyy'] - np.cos(2*gamma)*CHI2['zxy']
}

np.savetxt('out.txt', np.column_stack((freq, ROT['XXX'].real, ROT['XXX'].imag)),
           fmt=('%05.2f    % .8e    % .8e'))
