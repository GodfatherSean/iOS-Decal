/*
 
 Partner 1 Name + Email:
 Partner 2 Name + Email:
 
*/

import Foundation 
/*:
 # Lab 1: Swift Playgrounds
 
 Please refer to the [lab spec](http://iosdecal.com/sp19/lab/lab1/) for further instructions.
 
 ### Problem 1: Swift Warmup
*/
// Implement the following functions:

func tossCoin() -> String {
    return arc4random() / 2 == 0 ? "Heads" : "Tails"
}

func simulateTosses(numTosses n: Int) -> Int{
    var cnt = 0
    for i in 1...n {
        if tossCoin() == "Heads" {
            cnt += 1
        }
    }
    return cnt
}

// Uncomment the following lines to run sanity check tests:

tossCoin()  // Should return either "Heads" or "Tails"
simulateTosses(numTosses: 50)   // Should return a number close to 25

/*:
 ### Problem 2: Digits
*/
//Implement the `digits` function:

func digits(ofNumber n: Int) -> [Int] {
    if n < 10 {
        return [n]
    } else {
        return digits(ofNumber: n / 10) + [n % 10]
    }
}

// Uncomment the following lines to run sanity check tests:

digits(ofNumber: 123)  // returns [1, 2, 3]
digits(ofNumber: 0)    // returns [0]

/*:
 ### Problem 3: Number Frequency
*/
// Implement the `frequency` function:

func frequency(ofNumbers ns: [Int]) -> String {
    var dict = Dictionary<Int, Int>()
    for n in ns {
        if let val = dict[n] {
            dict[n] = val + 1
        } else {
            dict[n] = 1
        }
    }
    var result = ""
    for key in dict.keys.sorted(by: <) {
        if let val = dict[key] {
            result += "\(key):\(val), "
        }
    }
    return result.count == 0 ? "" : String(result.prefix(result.count - 2))
}

// Uncomment the following lines to run sanity check tests:

frequency(ofNumbers: [3, 1, 2, 3, 2, 1, 2, 3, 2])  // returns "1:2, 2:4, 3:3"
frequency(ofNumbers: [1, 2]) // returns "1:1, 2:1"
frequency(ofNumbers: []) // returns ""

/*:
 ### Problem 4 (Optional): Roman Numerals to Integer
 */
// Implement the `romanToInt` function:

func romanToInt(ofRoman s : String) -> Int {
    var dict = Dictionary<Character, Int>()
    dict["I"] = 1
    dict["V"] = 5
    dict["X"] = 10
    dict["L"] = 50
    dict["C"] = 100
    dict["D"] = 500
    dict["M"] = 1000
    var ans = 0, p: Character = "0"
    for c in s {
        if let val = dict[c] {
            ans += val
        }
        if ((p == "I" && (c == "V" || c == "X"))
            || (p == "X" && (c == "L" || c == "C"))
            || (p == "C" && (c == "D" || c == "M"))) {
            if let val = dict[p] {
                ans -= 2 * val
            }
        }
        p = c
    }
    return ans
}

// Uncomment the following lines to run sanity check tests:

 romanToInt(ofRoman: "III")      // returns 3
 romanToInt(ofRoman: "LVIII")    // returns 58
 romanToInt(ofRoman: "MCMXCIV")  // returns 1994




