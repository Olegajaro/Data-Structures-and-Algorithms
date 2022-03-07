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

/*
    We ate given a string S representing a phone number, which we would
 like to reformat. String S consist of N characters: digits, spaces,
 and/or dashes. It contains at least two digits.
 
    Spaces and dashes in string S can be ignored. We want to reformat the given
 phone number is such a way that digits are grouped in blocks of length three,
 separated by single dashes. If necessary, the final block or the last two
 blocks can be of length two.
 
 For example:
 
 S = "00-44   48 5555 8361" should become
     "004-448-555-583-61"
 
 Assume:
 - S consists only of digits (0-9), spaces, and/or dashes (-)
 - S contains at least two digits
 
 Translate:
 
 Would like to reformat a phone number string so that:
 - every third char is a "-"
 - spaces and dashes don't matter
 - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)
 */

func reformatPhoneNumber(_ S: String) -> String {
    
    guard S.count >= 2 else { return "" }
    
    // removing spaces and dashes
    let noSpace = S.replacingOccurrences(of: " ", with: "")
    let noSpaceNoDash = noSpace.replacingOccurrences(of: "-", with: "")
    
    // looping through char-by-char append dashes
    var result = ""
    
    var count = -2
    
    for char in noSpaceNoDash {
        result.append(char)
        
        if count % 3 == 0 {
            result.append("-")
        }
        
        count += 1
    }
    
    // strip off lingering dash
    if result.last == "-" {
        result = String(result.dropLast())
    }
    
    // if second last char has a dash (-x)
    // reformat last three chars to (-xx)
    var chars = Array(result)
    let secondLastPointer = chars.count - 2
    if chars[secondLastPointer] == "-" {
        // *-x -> -*x
        chars[secondLastPointer] = chars[secondLastPointer - 1]
        chars[secondLastPointer - 1] = "-"
    }
    
    return String(chars)
}

reformatPhoneNumber("123456789")        // 123-456-789
reformatPhoneNumber("555372654")        // 555-372-654
reformatPhoneNumber("0 - 22 1985--324") // 022-198-53-24

// Edge cases
reformatPhoneNumber("01")                 // 01
reformatPhoneNumber("012")                // 012
reformatPhoneNumber("0123")               // 01-23
reformatPhoneNumber("0123       444")     // 012-34-44
reformatPhoneNumber("------0123     444") // 012-34-44

/*
    When someone searches their contacts based on a phone number, it's nice
 when a list of contact pops up.
 
    Write an algorithm thar searches your contacts for phone number strings,
 and returns"
 - NO CONTACT if contact can't be found
 - A contact if a contact is found
 - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase
*/

func searchContact(_ A: [String], _ B: [String], _ P: String) -> String {

    let zipSequence = zip(A, B)

    let dictionary = Dictionary(
        uniqueKeysWithValues: zipSequence
    ).sorted { $0.0 < $1.0 }

    for (key, value) in dictionary {
        if value.contains(P) {
            return key
        }
    }

    return "NO CONTACT"
}

//func searchContact(_ A: [String], _ B: [String], _ P: String) -> String {
//    var result = [String]()
//
//    // loop through looking for match - when found add to result
//    for i in 0..<B.count {
//        if B[i].contains(P) {
//            result.append(A[i])
//        }
//    }
//
//    if result.count == 0 {
//        return "NO CONTACT"
//    } else if result.count == 1 {
//        return result.first ?? ""
//    }
//
//    return result.sorted().first ?? ""
//}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

searchContact(A, B, P) // pom
searchContact(["sander", "amy", "ann"], ["12345", "23456","123"], "1") // ann
searchContact(["fit", "fat", "fut"], ["123", "456", "789"], "0")

// Edge cases
searchContact([String](), [String](), "")
searchContact(A, B, "")
