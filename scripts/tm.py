#!/usr/bin/python

home = "/home/ouyangxiongyi"

# get data
rf = open(home + "/tm.log")
wf = open(home + "/tm_out1", "w")
t = 0

while True:
    line = rf.readline()
    w = line.split()
    if not line: break
    if len(w) > 4 and w[4] == "eth0":
        line = rf.readline()
        w = line.split()
        wf.write("%s %s %s\n" % (t, w[1], w[3]))
        t += 1;
rf.close()
wf.close()

# get speed
rf = open(home + "/tm_out1")
wf = open(home + "/tm_out2", "w")

line = rf.readline()
w1 = line.split()
while True:
    line = rf.readline()
    if not line: break
    w2 = line.split()
    wf.write("%s %s %s\n" % (w2[0], str(eval(w2[1] + "-" + w1[1]), str(eval(w2[1] + "-" + w1[1])))))
    w1 = w2
rf.close()
wf.close()

#plot 'tm_out2' using 1:($2/1024) with linespoints
