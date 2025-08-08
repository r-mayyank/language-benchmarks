// sum_single.rs - Rust single-threaded sum
use std::time::Instant;

fn main() {
    let start = Instant::now();
    
    let n: i64 = 100_000_000;
    let mut sum: i64 = 0;
    
    for i in 1..=n {
        sum += i;
    }
    
    let elapsed = start.elapsed();
    println!("Sum: {}", sum);
    println!("Rust Single-threaded Time: {:?}", elapsed);
    
    // Verify correctness
    let expected: i64 = 5000000050000000;
    if sum == expected {
        println!("✅ Result is correct!");
    } else {
        println!("❌ Expected {}, got {}", expected, sum);
        std::process::exit(1);
    }
}