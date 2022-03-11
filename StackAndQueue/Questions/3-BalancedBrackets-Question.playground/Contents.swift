import UIKit

/*
 Balanced brackets
 
    A bracket is considered to be any one of the following characters:
 (, ), {, }, [, or ].
 
    Two brackets are considered to be a matched pair if the an opening bracker
 (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or })
 of the exact same type. There are three types of matched pairs of brackers:
 [], {} and ().
 
    A matching pair of brackets is not balanced if the set of brackers it
 encloses are not matched. For example, {[(])} is not balanced because the
 contents in between { and } are not balanced. The pair of square brackets
 ecnloses a single, unbalanced opening bracker, (, and the pair of parentheses
 encloses a single, unbalanced closing square bracket, ].
 
    By this logic, we say a sequence of brackets is balanced if the following
 conditions are met:
 
    - It contains no unmatched brackets
    - The subset of brackets enclosed within the confines of a matched pair of
 brackets is also a matched pair of brackers.
    - Given strings of brackets, determine whether each sequence of brackets is
 balanced. If a string is balanced, return YES. Otherwise, return NO.
 */

func isBalanced(s: String) -> String {
    var stack = [Character]()
    
    for char in s {
        switch char {
        case "{", "(", "[" :
            stack.append(char)
        case "}":
            if stack.isEmpty || stack.last != "{" {
                return "NO"
            }
            stack.popLast()
        case ")":
            if stack.isEmpty || stack.last != "(" {
                return "NO"
            }
            stack.popLast()
        case "]":
            if stack.isEmpty || stack.last != "[" {
                return "NO"
            }
            stack.popLast()
        default:
            print("breaking \(char)")
        }
    }

    return stack.isEmpty ? "YES" : "NO"
}

//isBalanced(s: "{[()]}") // YES
//isBalanced(s: "[()]}") // NO
isBalanced(s: "({[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]}{[()]})"
)
