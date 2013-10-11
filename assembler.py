#! /usr/bin/env python
MEM_SIZE = 52428800  # 50 MB
#MEM_SIZE = 50


def _twos(val, bits):
    if ((val&(1<<(bits-1))) != 0):
        val = val-(1<<bits)
    return val        


def int_to_block(i):
    d = (i & 0b11111111)
    c = ((i >> 8) & 0b11111111)
    b = ((i >> 16) & 0b11111111)
    a = ((i >> 24) & 0b11111111)
    return a, b, c, d


def block_to_bin(b):
    return (b[0] << 24) + (b[1] << 16) + (b[2] << 8) + b[3]


class MemoryManager:
    memory = bytearray(MEM_SIZE)

    def store_int(self, i, loc):
        result = int_to_block(i)
        for byte in result:
            self.memory[loc] = byte
            loc = loc + 1

    def fetch_int(self, loc):
        bytes = []
        for i in range(4):
            bytes.append(self.memory[loc])
            loc = loc + 1
        return (_twos(block_to_bin(bytes), 32))
        
    def store_char(self, c, loc):
        self.memory[loc] = c

    def fetch_char(self, loc):
        return self.memory[loc]
