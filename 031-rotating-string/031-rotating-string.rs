use std::io::{self, BufRead};

fn rotate(k: i32, s: &str) -> String {
    let mut chs: Vec<char> = s.chars().collect();
    if k < 0 {
        for _ in k..0 {
            rotate_right(&mut chs);
        }
    } else {
        for _ in 0..k {
            rotate_left(&mut chs);
        }
    }
    chs.into_iter().collect()
}

fn rotate_left(chs: &mut Vec<char>) {
    let length = chs.len();
    let c = chs[0];
    for i in 0..length - 1 {
        chs[i] = chs[i + 1];
    }
    chs[length - 1] = c;
}

fn rotate_right(chs: &mut Vec<char>) {
    let length = chs.len();
    let last = chs[length - 1];
    for i in (1..length).rev() {
        chs[i] = chs[i - 1];
    }
    chs[0] = last;
}

fn main() {
    let mut buffer = String::new();
    let input = io::stdin();
    input.read_line(&mut buffer).expect("Failed to read line");
    let number_of_pairs = buffer.trim().parse().unwrap();
    buffer.clear();

    for line in input.lock().lines().take(number_of_pairs) {
        let line = line.unwrap();
        let l: Vec<_> = line.split_whitespace().collect();
        let k: i32 = l[0].parse().unwrap();
        let s = l[1];
        print!("{} ", rotate(k, s));
    }

    println!();
}