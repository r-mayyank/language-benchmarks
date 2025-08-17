// sum_multi.go - Go multi-threaded sum
package main

import (
    "fmt"
    "runtime"
    "sync"
    "time"
)

func main() {
    start := time.Now()
    
    const n = 100_000_000
    numWorkers := runtime.NumCPU()
    chunkSize := n / numWorkers
    
    var wg sync.WaitGroup
    results := make([]int64, numWorkers)
    
    fmt.Printf("Using %d goroutines\n", numWorkers)
    
    for i := 0; i < numWorkers; i++ {
        wg.Add(1)
        go func(workerID int) {
            defer wg.Done()
            
            start := int64(workerID*chunkSize + 1)
            end := int64((workerID+1) * chunkSize)
            if workerID == numWorkers-1 {
                end = n // Handle remainder
            }
            
            var localSum int64 = 0
            for j := start; j <= end; j++ {
                localSum += j
            }
            results[workerID] = localSum
        }(i)
    }
    
    wg.Wait()
    
    var totalSum int64 = 0
    for _, result := range results {
        totalSum += result
    }
    
    elapsed := time.Since(start)
    fmt.Printf("Sum: %d\n", totalSum)
    fmt.Printf("Go Multi-threaded Time: %v\n", elapsed)
    
    // Verify correctness
    const expected int64 = 5000000050000000
    if totalSum == expected {
        fmt.Println("✅ Result is correct!")
    } else {
        fmt.Printf("❌ Expected %d, got %d\n", expected, totalSum)
    }
}