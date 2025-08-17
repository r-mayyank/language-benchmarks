use std::sync::mpsc;
use std::thread;
use std::time::Instant;

fn main() {
    let start = Instant::now();

    let n: i64 = 100_000_000;
    let num_threads = num_cpus::get();
    let chunk_size = n / num_threads as i64;

    println!("Using {} threads", num_threads);

    let (tx, rx) = mpsc::channel();

    for i in 0..num_threads {
        let tx_clone = tx.clone();
        thread::spawn(move || {
            let start_val = (i as i64) * chunk_size + 1;
            let end_val = if i == num_threads - 1 {
                n
            } else {
                (i as i64 + 1) * chunk_size
            };

            let mut local_sum: i64 = 0;
            for j in start_val..=end_val {
                local_sum += j;
            }

            tx_clone.send(local_sum).unwrap();
        })
    }
}

drop(tx);

let total_sum: i64 = rx.iter().sum();

let elapsed = start.elapsed();
println!("Sum: {}", total_sum);
println!("Rust Multi-threaded Time: {:?}", elapsed);

// Verify correctness
let expected: i64 = 5000000050000000;
if total_sum == expected {
    println!("✅ Result is correct!");
} else {
    println!("❌ Expected {}, got {}", expected, total_sum);
    std::process::exit(1);
}