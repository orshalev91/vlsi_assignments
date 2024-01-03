import math

with open('output.txt', 'w') as f:
    for i in range(0,256):
        val = i*90/255
        sin_val = round(math.sin(math.radians(val))*255)
        f.write(f'{i} : sinus <= {sin_val};\n')
        #print (f'i is {i}, val - {val}, sinval = {sin_val}')