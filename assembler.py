#! /usr/bin/env python
import re

MEM_SIZE = 52428800  # 50 MB
#MEM_SIZE = 50
directive_re = re.compile("((?P<label>[a-zA-Z]+)\s+)?((?P<type>\.[a-zA-Z]+)\s+)(?P<value>(-?[0-9]+)|'(.{1,2})')")
instruction_re = re.compile("^((?P<label>[A-Za-z0-9]+)\s+)?(?P<instruction>[A-Za-z]{3})\s+((?P<op_one>(R|r)\d)\s+(?P<op_two>#(-)?\d+|'.'|[A-Za-z0-9])|(?P<single_op>\d+))")


class DuplicateLabelError(Exception): pass
class UndefinedLabelError(Exception): pass


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


class Assembler:
    symbol_table = dict()
    pc = 0
    source = None
    code_space = 0

    def read(self, filename):
        self.source = open(filename, 'r')

    def first_pass(self):
        line_number = 1
        for line in self.source:
            print line
            directive = directive_re.search(line)
            print match.groupdict()
            if directive:
                result = direct.groupdict()
                if result['label']:
                    if symbol_table.get(result['label']):
                        raise DuplicateLabelError("Line: " + line_number)
                    else:
                        symbol_table[result['label']] = {(self.pc, line_number)}
            else:
                pass
            self.pc = self.pc + 1
            line_number = line_number + 1



class VirtualMachine:
    pass
