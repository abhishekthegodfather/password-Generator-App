//
//  passGen.swift
//  passwordMaker
//
//  Created by Cubastion on 27/01/23.
//

import Foundation


func passGen(_ numOfChar: Int, _ splChar: Int, _ capChar: Int) -> String{
    
    let capChars = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let smallChars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let splChars = ["!", "\"", "#", "$", "%", "&", "\'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"]
    
    var password = ""
    
    for _ in 0..<capChar {
        let randomIndex = Int.random(in: 0..<capChars.count)
        password += capChars[randomIndex]
    }
    
    let n = numOfChar - splChar - capChar
    for _ in 0..<n{
        let randomIndex = Int.random(in: 0..<smallChars.count)
        password += smallChars[randomIndex]
    }

    for _ in 0..<splChar{
        let randomIndex = Int.random(in: 0..<splChars.count)
        password += splChars[randomIndex]
    }
    
    return password
}


func printStrongNess(_ str: String) -> String{
    let n = str.count
    var hasLower = false
    var hasUpper = false
    var hasDigit = false
    var specialChar = false
    var normalChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 "

    for char in str {
        if char.isLowercase {
            hasLower = true
        }
        
        if char.isUppercase {
            hasUpper = true
        }
        
        if char.isNumber {
            hasDigit = true
        }
        
        if !normalChars.contains(char) {
            specialChar = true
        }
    }
    
    if hasLower == true && hasUpper == true &&
        hasDigit == true && specialChar == true && n >= 8 {
        return "Strong"
    }else if (hasLower == true || hasUpper == true) &&
                specialChar == true && n >= 6 {
        return "Moderate"
    }else{
        return "Weak"
    }
}






    


