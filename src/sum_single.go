// sum_single.go - Go single-threaded sum
package main

import (
    "fmt"
    "time"
)

// RunSingleSum executes the single-threaded sum logic.
func RunSingleSum() {
    start := time.Now()
    
    var sum int64 = 0
    const n = 100_000_000
    
    for i := int64(1); i <= n; i++ {
        sum += i
    }
    
    elapsed := time.Since(start)
    fmt.Printf("Sum: %d\n", sum)
    fmt.Printf("Go Single-threaded Time: %v\n", elapsed)
    
    // Verify correctness
    const expected int64 = 5000000050000000
    if sum == expected {
        fmt.Println("✅ Result is correct!")
    } else {
        fmt.Printf("❌ Expected %d, got %d\n", expected, sum)
    }
}