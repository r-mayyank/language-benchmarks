#!/bin/bash

echo "🏁 Running Performance Benchmarks"
echo "=================================="
echo "Expected sum: 5,000,000,050,000,000"
echo ""

# Check if we're in the right directory
if [ ! -f "src/sum_node.js" ]; then
    echo "❌ Please run from project root directory"
    exit 1
fi

echo "🟨 JavaScript (Node.js):"
if command -v node &> /dev/null; then
    node src/sum_node.js
else
    echo "❌ Node.js not found"
fi

echo ""
echo "🟡 JavaScript (Bun):"
if command -v bun &> /dev/null; then
    bun src/sum_bun.js
else
    echo "❌ Bun not found, skipping..."
fi

echo ""
echo "🦀 Rust (Single-threaded):"
if command -v cargo &> /dev/null; then
    cd src && cargo run --release --bin sum_single && cd ..
else
    echo "❌ Rust/Cargo not found"
fi

echo ""
echo "🦀 Rust (Multi-threaded):"
if command -v cargo &> /dev/null; then
    cd src && cargo run --release --bin sum_multi && cd ..
else
    echo "❌ Rust/Cargo not found"
fi

echo ""
echo "🔵 Go (Single-threaded):"
if command -v go &> /dev/null; then
    go run src/sum_single.go
else
    echo "❌ Go not found"
fi

echo ""
echo "🔵 Go (Multi-threaded):"
if command -v go &> /dev/null; then
    go run src/sum_multi.go
else
    echo "❌ Go not found"
fi

echo ""
echo "🏁 Benchmark Complete!"