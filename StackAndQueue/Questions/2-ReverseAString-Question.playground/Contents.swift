import UIKit

/*
    Giving a String, write function that reverses the String
 using a stack.
 */

//func solution(_ text: String) -> String {
//
//    var arrayText = Array(text)
//
//    var result = [String.Element]()
//
//    for _ in 0..<arrayText.count {
//        result.append(arrayText.popLast() ?? " ")
//    }
//
//    return String(result)
//}

func solution(_ text: String) -> String {
    
    var chars = Array(text)
    
    // Create stack
    var result = [String]()
    
    // Push chars
    for char in chars {
        result.append(String(char))
    }
    
    // Pop chars
    for i in 0..<result.count {
        chars[i] = Character(result.popLast() ?? " ")
    }
    
    return String(chars)
}

solution("abc") // cba
solution("Would you like to play a game?")



