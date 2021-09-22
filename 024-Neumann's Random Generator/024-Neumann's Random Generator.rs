//Neumann's Random Generator
fn main() {
    let count: usize = input().trim().parse().unwrap();
    let input: Vec<usize> = input().trim().split_whitespace()
        .map(|n| n.parse().unwrap()).collect();
    for i in 0..count {
        let mut list = vec![input[i]];
        let mut counter = 0;
        'outer: loop {
            counter += 1;
            let next = {
                let clone = list.clone();
                let num = clone.last().unwrap();
                let powed = num * num;
                let mut string = powed.to_string();
                loop {
                    if string.len() < 8 {
                        string.insert(0, '0');
                    } else {
                        break;
                    }
                }
                let slice = &string[2..6];
                slice.parse::<usize>().unwrap()
            };
            for val in list.clone() {
                if next == val {
                    list.push(next);
                    break 'outer;
                }
            }
            list.push(next);
        }
        print!("{:?} ", counter);
    }
}
fn input() -> String {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).expect("Error");
    input
}