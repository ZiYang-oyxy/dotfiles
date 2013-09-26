#!/usr/bin/python
# stack symbol parser
import os
import string
import sys

#define android product name
ANDROID_PRODUCT_NAME = 'tr781'

ANDROID_WORKSPACE = os.getcwd()+"/"

# addr2line tool path and symbol path
addr2line_tool = ANDROID_WORKSPACE + 'prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-addr2line'
symbol_dir = ANDROID_WORKSPACE + 'out/debug/target/product/' + ANDROID_PRODUCT_NAME +'/symbols' #need "debug" string between out and target?
symbol_bin = symbol_dir + '/system/bin/'
symbol_lib = symbol_dir + '/system/lib/'


class ReadLog:
    def __init__(self,filename):
        self.logname = filename
    def parse(self):
        f = file(self.logname,'r')
        lines = f.readlines()
        if lines != []:
            print 'read file ok'
        else:
            print 'read file failed'
        result =[]
        for line in lines:
            if line.find('stack') != -1:
                print 'stop search'
                break
            elif line.find('system') != -1:
                #print 'find one item' + line
                result.append(line)
        return result

class ParseContent:
    def __init__(self,addr,lib):
        self.address = addr # pc address
        self.exename = lib  # executable or shared library
    def addr2line(self):
        cmd = addr2line_tool + " -C -f -s -e " + symbol_dir + self.exename + " " + self.address
        #print cmd
        stream = os.popen(cmd)
        lines = stream.readlines();
        list = map(string.strip,lines)
        return list
    
inputarg = sys.argv
if len(inputarg) < 2:
    print 'Please input panic log'
    exit()

filename = inputarg[1]
readlog = ReadLog(filename)
inputlist = readlog.parse()

for item in inputlist:
    itemsplit = item.split()
    test = ParseContent(itemsplit[-2],itemsplit[-1])
    list = test.addr2line()
    print "%-30s%s" % (list[1],list[0])
