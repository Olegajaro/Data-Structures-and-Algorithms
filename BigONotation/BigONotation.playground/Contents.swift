import UIKit

//: Big O Notation
// MARK: - O(N)
func findKey(_ arr: [String]) {
    let before = Date()
    
    for i in 0..<arr.count {
        if arr[i] == "key" {
            print("Found key!")
        }
    }
    
    let after = Date()
    let component = Calendar.current.dateComponents(
        [.nanosecond],
        from: before,
        to: after
    )
    let miliSeconds: Double = Double(component.nanosecond! / 1_000_000)
//    print("Finding key took: \(miliSeconds)")
}

//let key = ["key"]
let key = Array<String>(repeating: "", count: 100000)
findKey(key)

// MARK: - Example Big O performance

// Constant time O(1)
func constantTime(_ n: Int) -> Int {
    let result = n * n
    return result
}

// Linear time O(n)
// worst case perfomance
func linearTime(_ A: [Int]) -> Int {
    for i in 0..<A.count {
        if A[i] == 0 {
            return 0
        }
//        print(i)
    }
    
    return 1
}
linearTime([1, 2, 3])

// Logarithmic time O(log n)
// Binary search tree
func logarithmicTime(_ N: Int) -> Int {
    var n = N
    var result = 0
    
    while n > 1 {
        n /= 2
//        print(n)
        result += 1
    }
    
    return result
}
logarithmicTime(128)

// Quadratic time O(n^2)
func quadratic(_ n: Int) -> Int {
    var result = 0
    
    for i in 0..<n {
        for j in i..<n {
            result += 1
//            print("\(i) \(j)")
        }
    }
    
    return result
}

quadratic(16)

// MARK: - Sample questions
/*
    Given two arrays, create a function that let's a user know whether
 these two arrays contain any common items.
 */

// Naive brute force O(n^2)
func commonItemBrute(_ A: [Int], _ B: [Int]) -> Bool {
    for i in 0..<A.count {
        for j in 0..<B.count {
            if A[i] == B[j] {
                return true
            }
        }
    }
    
    return false
}

commonItemBrute([1, 2, 3], [4, 5, 6])
commonItemBrute([1, 2, 3], [3, 5, 6])

// Convert to hash and lookup via other index
func commonItemsHash(_ A: [Int], _ B: [Int]) -> Bool {

    // Still looping...but not nested O(2n) vs O(n^2)
    var hashA = [Int: Bool]() // O(n)
    for a in A { // O(n)
        hashA[a] = true
    }
    
    // Now lookup in the hash to see if elements of B exist
    for b in B {
        if hashA[b] == true {
            return true
        }
    }
    
    return false
}

commonItemsHash([1, 2, 3], [4, 5, 6])
commonItemsHash([1, 2, 3], [3, 5, 6])
