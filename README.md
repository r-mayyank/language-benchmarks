# Performance Benchmark: Sum 1 to 10^8

This repository benchmarks different languages and runtimes calculating the sum from 1 to 100,000,000.

## Languages/Runtimes Tested
- JavaScript (Node.js)
- JavaScript (Bun)
- Go (single-threaded)
- Go (multi-threaded)
- Rust (single-threaded)
- Rust (multi-threaded)

## Expected Result
The sum from 1 to 100,000,000 = **5,000,000,050,000,000**

## Local Testing
```bash
# Run individual tests
./scripts/run_benchmarks.sh

# Or run specific language
node src/sum_node.js
bun src/sum_bun.js
go run src/sum_single.go
go run src/sum_multi.go
cd src && cargo run --release --bin sum_single
cd src && cargo run --release --bin sum_multi
```