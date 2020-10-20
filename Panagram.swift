//
//  Panagram.swift
//  Panagram
//
//  Created by Nick Migacz on 10/19/20.
//

import Foundation

enum OptionType: String{ //base type so you can pass the option arg directly
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value{
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

class Panagram {
    let consoleIO = ConsoleIO()
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Panagram! This program checks if an input string is an anagram or palidrome")
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.writeMessage("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.") //prompts user to choose one of the two options
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .anagram: //anagram input
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()
                
                if first.isAnagramOf(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            case .palindrome: //palindrome input
                consoleIO.writeMessage("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
    
    func staticMode() { //represents non-interactive mode, when providing data thru command line args
        let argCount = CommandLine.argc //num of args passed to program
        let argument = CommandLine.arguments[1] //takes first real arg from array
        let (option, value) = getOption(argument.substring(from: argument.index(argument.startIndex, offsetBy: 1))) //parse arg and convert to OptionType
        
        switch option { //switch for processing input and output
        case .anagram: //must pass 4 args or error
            if argCount != 4{
                if argCount > 4 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else{
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]
                
                if first.isAnagramOf(second) {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome: //must pass 3 args or error
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else {
                let s = CommandLine.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        case .help: //prints usage info
            consoleIO.printUsage()
        case .unknown, .quit: //unknown value
            consoleIO.writeMessage("Unknown option \(value)")
            consoleIO.printUsage()
        }
    }
    
    func getOption(_ option: String) -> (option:OptionType, value: String) { //accepts an option arg and returns a tuple
        return (OptionType(value: option), option)
    }
    
    
}
