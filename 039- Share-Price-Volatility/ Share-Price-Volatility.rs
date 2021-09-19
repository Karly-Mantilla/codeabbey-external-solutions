use std::fmt;
use std::env;
use std::io;
use std::fs;

// general functions

fn get_first_arg() -> Option<String> {
    let args: Vec<String> = env::args().collect();
    args.get(1).map(|v| v.to_string())
}

fn read_by_line(filename: &str) -> Result<Vec<String>, io::Error> {
    let contents = fs::read_to_string(filename)?;
    let result: Vec<String> = contents.lines()
        .map(|s| s.to_string())
        .collect();
    Ok(result)
}

// generalize over numeric types
fn parse_str_as_numeric<T>(s: &str) -> Vec<T> where 
T: std::str::FromStr {
    let result = s.split_whitespace()
        .map(|w| w.parse().unwrap_or_else(|_| panic!("Cannot parse as intended."))) 
        .collect();
    result
}

fn print_vec<T: fmt::Display>(v: &Vec<T>){
    for elem in v {
        print!("{} ", elem);
    }
    print!("\n");
}

fn vec_to_tup<T: Clone>(v: &Vec<T>) -> (T, T) {
    (v[0].clone(), v[1].clone())
}

fn vec_to_tup3<T: Clone>(v: &Vec<T>) -> (T, T, T) {
    (v[0].clone(), v[1].clone(), v[2].clone())
}

fn print_sep() {
    println!("{}", "-".repeat(65));
}

// problem specific 

#[derive(Debug)]
struct Stock {
    name: String,
    price: Vec<f64>,
}

fn process_one_line(s: &str) -> Stock {
    let words: Vec<&str> = s.split_whitespace().collect();
    let name: String = words[0].to_owned();
    let price: Vec<f64> = words[1..].into_iter()
        .map(|v| v.parse().unwrap())
        .collect();
    Stock {
        name,
        price,
    } 
}


fn mean(v: &Vec<f64>) -> f64 {
    let total: f64 = v.iter().sum();
    let length: usize = v.len();
    total / (length as f64)
}

fn sd(v: &Vec<f64>) -> f64 {
    let average = mean(v);
    let squared_diff: Vec<f64> = v.into_iter()
        .map(|v| v - average)
        .map(|diff| diff.powi(2))
        .collect();
    mean(&squared_diff).sqrt()
}

fn main() {
    // read input

    let filename = get_first_arg().unwrap();
    let input = read_by_line(filename.as_str()).unwrap();
    let (head, tail) = input.split_at(1);
    // println!("{:?}", tail);

    // parse 

    let checksum: usize = head[0].parse().unwrap();
    let data: Vec<Stock> = tail.iter()
        .map(|s| process_one_line(s))
        .collect();
    print_sep();
    println!("{:?}", data);
    assert_eq!(checksum, data.len());

    // main part
    
    let result: Vec<(&str, f64, f64)> = data.iter()
        .map(|stock| (stock.name.as_str(), mean(&stock.price), sd(&stock.price)))
        .filter(|&(_, avg, sd)|  sd >= 4.0 * 0.01 * avg)
        .collect();
    print_sep();
    println!("{:?}", result);

    print_sep();
    for (name, _, _) in result {
        print!("{} ", name);
    }
    println!("");
    print_sep();

}