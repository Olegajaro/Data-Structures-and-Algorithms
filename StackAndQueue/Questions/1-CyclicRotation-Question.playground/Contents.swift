import UIKit

/*
 Rotate array to left N times.
 
 For example, given
 
    A = [3, 8, 9, 7, 6]
    K = 3
 the function should return [7, 6, 3, 8, 9]. Three rotations were made:
 
    [3, 8, 9, 7, 6] -> [8, 9, 7, 6, 3]
    [8, 9, 7, 6, 3] -> [9, 7, 6, 3, 8]
    [9, 7, 6, 3, 8] -> [7, 6, 3, 8, 9]
 
 Shoot for correctness. Not performance.
 */

func solutionQueueLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    // treat like a queue enqueuing and dequeuing off the end
    for _ in 1...K {
//        let rotateElement = result.removeFirst()
//        result.append(rotateElement)
        let first = result.first!
        result.append(first)
        result.remove(at: 0)
    }
    
    return result
}

solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 1) // [2, 3, 4, 5, 1]
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 2) // [3, 4, 5, 1, 2]
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 3) // [4, 5, 1, 2, 3]
 
solutionQueueLeft(A: [3, 8, 9, 7, 6], K: 3) // [7, 6, 3, 8, 9]
