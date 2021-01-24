#!/Users/michael/anaconda3/bin/python

import jwt
import sys
import json

HELP = """使用方法:
mm -e "原始信息" 
mm -d "加密信息"""

cmd = sys.argv[1:]

if len(cmd) == 0:
    print(HELP)

elif len(cmd) == 2:
    key = input("密钥 >> ")
    data = {'data': cmd[1]}
        
    if cmd[0] == '-e':
        print(jwt.encode(data, key, algorithm='HS256').decode('utf-8'))
    elif cmd[0] == '-d':
        print(jwt.decode(cmd[1].encode('utf-8'), key, algorithm='HS256')['data'])

else:
    print('something is wrong')
