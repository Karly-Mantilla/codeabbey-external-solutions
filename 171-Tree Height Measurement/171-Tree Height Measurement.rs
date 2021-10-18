use std::io::{self, BufRead};
use std::f64::consts::PI;

fn calc_dist(dist: u32, angle: f64) {
  // println!("{} {}", dist, angle);
  let real_angle = (angle - 90.0) * 2.0 * PI / 360.0;
  println!("{}", (real_angle.tan() * dist as f64).round());
}

fn main() {
  let stdin = io::stdin();
  let lines = stdin.lock().lines();
  let mut n = 0;

  for line in lines {
    let l = line.unwrap();
    if n != 0 {
      let params: Vec<&str> = l.split_whitespace().collect();
      // shift = params[1].parse().unwrap_or(0);

      let distance: u32 = params[0].parse().unwrap_or(0) as u32;
      let angle: f64 = params[1].parse().unwrap_or(0.0) as f64;
      calc_dist(distance, angle);
    } else {
      n = 1;
    }
  }
}