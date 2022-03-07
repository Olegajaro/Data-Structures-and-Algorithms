import UIKit

struct Person {}

//let ints = [1, 2, 3]
//let strings = ["a", "b", "c"]
//let people = [Person(), Person(), Person()]

let ints = [Int]()
let strings = [String]()
let people = [Person()]

var array = ["a", "b", "c", "d"]
//array.insert("e", at: 99)
array.remove(at: 1)
array.insert("b", at: 1)
array.append("e")
//print(array)

// Array features
/*
 Fixed size
 Random access - O(1)
 Insert/Delete - O(n)
 Arrays can shrink and grow - O(n)
 Swift arrays handle heavy lifting for you
 */

// MARK: - Sample Questions

/*
 Rotate array to right N times.
 
 For example, given
 
 A = [3, 8, 9, 7, 6]
 K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:
 
 [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
 [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
 [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 */

func solution(A: [Int], K: Int) -> [Int] {

    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }

    var result = A

    for _ in 0..<K {
        let lastElement = result.remove(at: result.count - 1)
        result.insert(lastElement, at: 0)
    }

    return result
}

//func solution(A: [Int], K: Int) -> [Int] {
//
//    guard !A.isEmpty else { return [] }
//    guard K > 0 else { return A }
//
//    var result = A
//
//    for _ in 0..<K { // O(n)
//        result = rotateRightOnce(A: result)
//    }
//
//    return result
//}
//
//func rotateRightOnce(A: [Int]) -> [Int] {
//    var newArray = Array<Int>(repeating: 0, count: A.count)
//
//    for i in 0..<A.count - 1 { // O(n)
//        newArray[i + 1] = A[i]
//    }
//
//    newArray[0] = A.last ?? 0
//    return newArray
//}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]
solution(A: [], K: 1) // []
solution(A: [1], K: 2) // [1]
solution(A: [3, 8, 9, 7, 6], K: -1)
