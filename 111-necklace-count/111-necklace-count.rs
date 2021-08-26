use std::io;
use std::io::prelude::*;

fn gcd(mut a: i32, mut b: i32) -> i32 {
    while b != 0 {
        a %= b;
        let t = a;
        a = b;
        b = t;
    }
    a
}

fn phi(n: i32) -> i32 {
    (1..=n)
        .map(|k| gcd(n, k))
        .filter(|x| *x == 1)
        .count() as i32
}

fn main() {
    let stdin = io::stdin();
    let lines = stdin.lock().lines().skip(1).map(Result::unwrap);
    for line in lines {
        let mut parts = line
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap());
        let b = parts.next().unwrap();
        let n = parts.next().unwrap();
        let nkn = (1..=n)
            .filter(|d| n % d == 0)
            .map(|d| phi(d) * b.pow((n / d) as u32))
            .sum::<i32>() / n;
        print!("{} ", nkn);
    }
}