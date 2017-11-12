//: Playground - noun: a place where people can play

import UIKit

// 1. Arithmetic expression
1 + 2 * 5 / 2

// 2. Prefix notation
prefix operator §

prefix func §<T: Comparable>(lhs: [T]) -> [T] {
    let array = lhs
    return array.sorted { $0 < $1 }
}
§[4,7,3]
§["s", "a"]

// 3. Postfix notation
postfix operator ¶
postfix func ¶<T: Equatable>(array: [T]) -> [T] {
    return array.reversed()
}

["2", "1", "3"]¶
["d","a", "p"]¶

precedencegroup IntersectionOperatorPrecedence {
    associativity: left
}

precedencegroup UnionOperatorPrecedence {
    associativity: left
    higherThan: IntersectionOperatorPrecedence
}

// 4. Infix - Union
infix operator ∪: UnionOperatorPrecedence

func ∪ <T:Equatable>(lhs: [T], rhs:[T])->[T] {
    var result = lhs
    for element in rhs {
        if !lhs.contains(element) {
            result.append(element)
        }
    }
    return result
}
[1,2,3] ∪ [2,3,4]
["a", "e", "s"] ∪ ["a", "e", "l"]

// 5. Infix - Intersection
infix operator ∩: IntersectionOperatorPrecedence
func ∩<T: Equatable> (left: [T], right: [T]) -> [T] {
    var intersection: [T] = []
    for value in left {
        if right.contains(value) {
            intersection.append(value)
        }
    }
    return intersection
}
[7,8,9] ∩ [8,9,10]
["a", "c", "e"] ∩ ["a", "b"]

// 6. Both union and intersection opeartion
[1,2,3] ∪ [0,2,4,6] ∩ [2,4,6]

