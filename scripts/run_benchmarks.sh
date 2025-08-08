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
echo "🦀 Rust (Single-threaded):"
if command -v cargo &> /dev/null; then
    cd src && cargo run --release --bin sum_single && cd ..
else
    echo "❌ Rust/Cargo not found"
fi