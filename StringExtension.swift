//
//  StringExtension.swift
//  Panagram
//
//  Created by Nick Migacz on 10/19/20.
//

import Foundation

extension String{
    func isAnagramOf(_ s: String) -> Bool { //for Anagrams
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "") //returns new string
        let lowerOther = s.lowercased().replacingOccurrences(of: " ", with: "") //returns new string
        return lowerSelf.sorted() == lowerOther.sorted() //compares the two string
    }
    
    func isPalindrome() -> Bool { //For Palindrome
        let f = self.lowercased().replacingOccurrences(of: " ", with: "") //returns new string
        let s = String(f.reversed()) //string of reverse of word
        return f==s //compares them if identical
    }
}
