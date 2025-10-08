//
//  main.swift
//  wordvet
//
//  Created by Jake Oeding on 10/6/25.
//

import Foundation

// TODO: accept a file as command line arg
let filePath = ""

guard let wordList = try? String(contentsOfFile: filePath, encoding: .utf8).split(separator: "\n") else {
    print("Couldn't find \(filePath)")
    exit(EXIT_FAILURE)
}
