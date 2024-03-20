from difflib import SequenceMatcher
import subprocess
import re
import os

def run_cmd(cmd, get_output= True, timeout=35, stop_on_error=True):
    "Run cmd logging input and output"
    output = ""
    try:
        if get_output:
            p= subprocess.Popen(cmd, stdout= subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
            output, err = p.communicate(timeout=timeout)
            rc = p.returncode
        else:
            result = subprocess.check_call(cmd, stderr=subprocess.STDOUT, shell=True, timeout = timeout)
    except subprocess.CalledProcessError as e:
        if stop_on_error:
            msg = 'Failed sudo_cmd: %s'%(e.returncode, str(e))
    except Exception as e:
        if stop_on_error:
            msg= 'Failed sudo_cmd: %s'% str(e)
    return output

def check(test_str):
    pattern= r'[^\.lorbamends-*\-\s]'
    if re.search(pattern, test_str):
        print('Invalid char in command %r, only chars in brackets are allowed [.lorbamends-*]\n' % (test_str))
        print('Char not permitted.')
    else:
        try:
            output = run_cmd(cmd, get_output=True, stop_on_error=True)
            print (output)
        except OSError:
            print('Unknown error.')

while True:
    try:
        s = input(' -> -> Empieza el challenge ')
    except:
        break

    try:
        cmd = s
        check(cmd)
    except OSError:
        print('Unknown error.')
