from __future__ import division
from operator import mul
from collections import namedtuple

Data = namedtuple("Data", "year days price")

def getData(fname):
    with open(fname,"r") as f:
        data = []
        f.readline()
        for line in f.readlines():
            params = map(float,line.replace(":","").strip().split())
            data.append(Data(*params))
    return data

def mean(x):
    return sum(x)/len(x)

def variance(x, y):
    return sum(map(mul, x, y))/len(x) - mean(x)*mean(y)

data = getData("095.txt")
x = [d.days for d in data]
y = [d.price for d in data]

b = variance(x,y)/variance(x,x)
print b, mean(y)-b*mean(x)