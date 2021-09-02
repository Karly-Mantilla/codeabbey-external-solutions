use std::io;
use std::str::FromStr;
use Cell::*;

fn main() {
    read_line();
    let line = read_line();
    let ops: Vec<_> = line.split_whitespace().map(|s|s.chars().next().unwrap()).collect();
    
    let mut place = [F7, F8, F9, F4, F5, F6, F1, F2, F3];
    
    for op in ops {
        let trans: &[[Cell; 4]; 5] =
            match op {
                'L' => &ROT_L,
                'R' => &ROT_R,
                'F' => &ROT_F,
                'B' => &ROT_B,
                'U' => &ROT_U,
                'D' => &ROT_D,
                _ => panic!("invalid op")
            };
        
        for k in 0..9 {
            'loop_i: for i in 0..5 {
                for j in 0..4 {
                    if trans[i][j] == place[k] {
                        place[k] = trans[i][(j+1) % 4];
                        break 'loop_i;
                    }
                }
            }
        }
    }
    
    for i in 0..9 {
        let c = match place[i] {
            U1 | U2 | U3 | U4 | U5 | U6 | U7 | U8 | U9 => 'U',
            F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 => 'F',
            B1 | B2 | B3 | B4 | B5 | B6 | B7 | B8 | B9 => 'B',
            L1 | L2 | L3 | L4 | L5 | L6 | L7 | L8 | L9 => 'L',
            R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 => 'R',
            D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 => 'D'
        };
        print!("{} ", c);
    }
}

#[derive(PartialEq, Eq, Copy, Clone)]
enum Cell {
    U1, U2, U3, U4, U5, U6, U7, U8, U9,
    D1, D2, D3, D4, D5, D6, D7, D8, D9,
    F1, F2, F3, F4, F5, F6, F7, F8, F9,
    B1, B2, B3, B4, B5, B6, B7, B8, B9,
    L1, L2, L3, L4, L5, L6, L7, L8, L9,
    R1, R2, R3, R4, R5, R6, R7, R8, R9
}

static ROT_U: [[Cell; 4];5] = [
    [U1, U3, U9, U7],
    [U2, U6, U8, U4],
    [R1, F1, L1, B1],
    [R2, F2, L2, B2],
    [R3, F3, L3, B3]
];

static ROT_F: [[Cell; 4];5] = [
    [F1, F3, F9, F7],
    [F2, F6, F8, F4],
    [U7, R1, D7, L9],
    [U8, R4, D8, L6],
    [U9, R7, D9, L3]
];

static ROT_R: [[Cell; 4];5] = [
    [R1, R3, R9, R7],
    [R2, R6, R8, R4],
    [F3, U3, B7, D7],
    [F6, U6, B4, D4],
    [F9, U9, B1, D1]
];

static ROT_L: [[Cell; 4];5] = [
    [L1, L3, L9, L7],
    [L2, L6, L8, L4],
    [F1, D9, B9, U1],
    [F4, D6, B6, U4],
    [F7, D3, B3, U7]
];

static ROT_B: [[Cell; 4];5] = [
    [B1, B3, B9, B7],
    [B2, B6, B8, B4],
    [R3, U1, L7, D1],
    [R6, U2, L4, D2],
    [R9, U3, L1, D3]
];

static ROT_D: [[Cell; 4];5] = [
    [D1, D3, D9, D7],
    [D2, D6, D8, D4],
    [F7, R7, B7, L7],
    [F8, R8, B8, L8],
    [F9, R9, B9, L9]
];

fn read_line() -> String {
    let mut stdin = io::stdin();
    let mut line = String::new();
    stdin.read_line(&mut line).unwrap();
    line.trim().to_string()
}

fn read_many<T: FromStr>() -> Vec<T> {
    read_line()
        .split_whitespace()
        .map(|s| s.parse().ok().unwrap())
        .collect()
}