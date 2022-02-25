import sys
import os

if 'VIRTUAL_ENV' in os.environ:
    sys.path.append(os.environ['VIRTUAL_ENV'] + '/lib/python3.9/site-packages/')
elif '.venv' in os.listdir():
    sys.path.append(f'{os.getcwd()}/.venv/lib/python3.9/site-packages/')
