
#! /usr/bin/env python3 

import collections
import itertools

input_data = """4 4 4 2
4 4 2 2
2 2 2 4
2 4 2 2
L R D D D R R L"""

def process_input(data):
    data = [row for row in data.split('\n')]
    moves = data[4].split()
    table = data[:-1]
    table = [[int(elem) for elem in row.split(' ')] for row in table] 
    return [table, moves]

def shift_down(table):
    for row in range(3, 0, -1):
        for col in range(4):
            if table[row][col] == '-':
                for k in range(row-1, -1, -1):
                    if table[k][col] != '-':
                        table[row][col], table[k][col] = table[k][col], '-'
                        break
    return table

def down(table):
    for row in range(3, 0, -1):
        table = shift_down(table)
        for col in range(4):
            if table[row][col] == table[row-1][col] and not table[row][col] == '-':
                table[row][col] += table[row-1][col]
                table[row-1][col] = '-'
    table = shift_down(table)
    return table

def shift_up(table):
    for row in range(3):
        for col in range(4):
            if table[row][col] == '-':
                for k in range(row, 4):
                    if table[k][col] != '-':
                        table[row][col], table[k][col] = table[k][col], '-'
                        break
    return table

def up(table):
    for row in range(3):
        table = shift_up(table)
        for col in range(4):
            if table[row][col] == table[row+1][col] and not table[row][col] == '-':
                table[row][col] += table[row+1][col]
                table[row+1][col] = '-'
    table = shift_up(table)
    return table    

def shift_right(table):
    for col in range(3, 0, -1):
        for row in range(4):
            if table[row][col] == '-':
                for k in range(col-1, -1, -1):
                    if table[row][k] != '-':
                        table[row][col], table[row][k] = table[row][k], '-'
                        break
    return table

def right(table):
    for col in range(3, 0, -1):
        table = shift_right(table)
        for row in range(4):
            if table[row][col] == table[row][col-1] and not table[row][col] == '-':
                table[row][col] += table[row][col-1]
                table[row][col-1] = '-'
    table = shift_right(table)
    return table

def shift_left(table):
    for col in range(3):
        for row in range(4):
            if table[row][col] == '-':
                for k in range(col, 4):
                    if table[row][k] != '-':
                        table[row][col], table[row][k] = table[row][k], '-'
                        break
    return table

def left(table):
    for col in range(3):
        table = shift_left(table)
        for row in range(4):
            if table[row][col] == table[row][col+1] and not table[row][col] == '-':
                table[row][col] += table[row][col+1]
                table[row][col+1] = '-'
    table = shift_left(table)
    return table

def moves(table, move):
    if move == 'D':
        table = down(table)
    if move == 'U':
        table = up(table)
    if move == 'R':
        table = right(table)
    if move == 'L':
        table = left(table)
    return table

def print_table(table):
    for row in table:
        print(row)

# cnt = collections.Counter()

data = process_input(input_data)
table, swipes = data[0], data[1]

for move in swipes:
    table = moves(table, move)

table_list = list(itertools.chain(*table))
print(collections.Counter(table_list))