//
//  consoleIO.swift
//  Panagram
//
//  Created by Nick Migacz on 10/19/20.
//

import Foundation

enum OutputType{
    case error
    case standard
}

class ConsoleIO {
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    func writeMessage(_ message: String, to: OutputType = .standard){
        switch to {
        case .standard:
            print("\(message)") //actual message to print
        case .error:
            fputs("Error: \(message)\n", stderr) // the destination, defaults to .standard
        }
    }
    
    func printUsage(){ //prints usage info to the console
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        writeMessage("usage:")
        writeMessage("\(executableName) -a string1 string2")
        writeMessage("or")
        writeMessage("\(executableName) - p string")
        writeMessage("or")
        writeMessage("\(executableName) -h to show usage information")
        writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }
    
}
