use std::io::{self, BufRead};

fn main() {
    let mut buffer = String::new();
    let input = io::stdin();
    input.read_line(&mut buffer).expect("Failed to read line");
    let number_of_tests = buffer.trim().parse().unwrap();

    for line in input.lock().lines().take(number_of_tests) {
        let mut nums: Vec<f32> = line.unwrap()
            .split_whitespace()
            .map(|n| n.parse().unwrap())
            .collect();
        let (pa, pb) = (nums[0] / 100., nums[1] / 100.);
        let q = ((1. - pa) * pb) / (1. - (1. - pa) * (1. - pb));
        print!("{} ", ((1. - q) * 100.).round());
    }

    println!()
}