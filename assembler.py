#! /usr/bin/env python
import re

MEM_SIZE = 52428800  # 50 MB
#MEM_SIZE = 50
directive_re = re.compile(r"((?P<label>[a-zA-Z]+)\s+)?((?P<type>\.[a-zA-Z]+)\s+)(?P<value>(-?[0-9]+)|'(.{1,2})')")
instruction_re = re.compile(r"^((?P<label>[A-Za-z0-9]+)\s+)?(?P<instruction>[A-Za-z]{3})\s+((?P<op_one>(R|r)\d)\s+((?P<d_num>#(-)?\d+)|(?P<op_reg>[rR]\d+)|(?P<d_char>'.')|(?P<op_label>[A-Za-z0-9]+))|(?P<single_op>[a-zA-Z0-9]+))")


class DuplicateLabelError(Exception): pass
class UndefinedLabelError(Exception): pass
class UnknownInstructionError(Exception): pass
class UnknownDirectiveError(Exception): pass

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
            line = line.strip()
            directive = directive_re.search(line)
            instruction = instruction_re.search(line)
            if line:
                if directive and directive.groupdict()['type']:
                    result = directive.groupdict()
                    if result['label']:
                        label = self.symbol_table.get(result['label'])
                        if label:
                            raise DuplicateLabelError(line_number, '-', line)
                        else:
                            self.symbol_table[result['label']] = (self.pc, [line_number])
                elif instruction and instruction.groupdict()['instruction']:
                    result = instruction.groupdict()
                    label = result.get('op_label') or result.get('single_op')
                    if label:
                        try:
                            self.symbol_table[label][1].append(line_number)
                        except KeyError:
                            import ipdb; ipdb.set_trace()
                            raise UndefinedLabelError(
                                str(line_number) + ': ' + label + ' -' + line)
                else:
                    raise UnknownInstructionError(line_number, '-', line)
                    
            self.pc = self.pc + 1
            line_number = line_number + 1
        print self.symbol_table


class VirtualMachine:
    pass
