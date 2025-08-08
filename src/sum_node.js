// sum_node.js - Node.js single-threaded sum
console.time('Node.js Sum');
let sum = 0;
const n = 100_000_000;

for (let i = 1; i <= n; i++) {
    sum += i;
}

console.log(`Sum: ${sum}`);
console.timeEnd('Node.js Sum');

// Verify correctness
const expected = 5000000050000000;
if (sum === expected) {
    console.log('✅ Result is correct!');
} else {
    console.log(`❌ Expected ${expected}, got ${sum}`);
    process.exit(1);
}