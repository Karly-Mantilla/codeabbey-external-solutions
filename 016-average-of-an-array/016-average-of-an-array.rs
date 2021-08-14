//average of an array
fn main() {
    let count: usize = std_input().trim().parse().unwrap();
    let mut out = Vec::new();
    for _ in 0..count {
        let vec: Vec<usize> = {
            let input = std_input();
            let output = input.trim().split_whitespace().map(|n| n.parse::<usize>().unwrap()).collect();
            output
        };
        let sum: usize = Iterator::sum(vec.iter());
        out.push({
            ((sum as f64) / ((vec.len() as f64) - 1.0)).round() as usize
        })
    }
    for val in out {
        print!("{:?} ", val);
    }
}
fn std_input() -> String {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).expect("Error");
    input
}