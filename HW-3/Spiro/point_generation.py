import math

t=0.00
R = 8.0/10000
r = 1.0/10000
a = 4.0/10000
with open("output_coords.txt", 'w') as f:
    while t < 16*math.pi:
        x = (R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t) -118.28929758579238
        y = (R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t) +34.02127020854859
        res=""
        res+=str(x)+ ',' +str(y)+ ",0.\n"
        f.write(res)
        #f.write("\n")
        t=t+0.01
        
        