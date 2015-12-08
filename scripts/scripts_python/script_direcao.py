# script para representar a direcao de ondas com vetores

import os
import numpy as np 
import scipy.io as sio
import matplotlib.pyplot as plt 


dir_bg = sio.loadmat('/home/rafael/Documentos/lamce/swan/simulacoes_swan/baia_de_guanabara/20150921/dir_copa.mat')
del dir_bg['__globals__'], dir_bg['__header__'], dir_bg['__version__']








