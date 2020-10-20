//
//  main.swift
//  Panagram
//
//  Created by Nick Migacz on 10/19/20.
//==============Tutorial credit==============
// Tutorial on creating this project is from: https://www.raywenderlich.com/511-command-line-programs-on-macos-tutorial
//===========================================

import Foundation

let panagram = Panagram()
if CommandLine.argc < 2 {
    panagram.interactiveMode()
} else{
    panagram.staticMode()
}
