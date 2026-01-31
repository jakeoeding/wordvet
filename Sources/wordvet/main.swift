import ArgumentParser
import DictionaryKit
import Foundation

@main
struct Wordvet: ParsableCommand {
    @Option(name: .shortAndLong, help: "The input file to read from. Defaults to stdin if not provided.")
    var inputPath: String?

    @Option(name: .shortAndLong, help: "The file to write output to. Defaults to stdout if not provided.")
    var outputPath: String?

    mutating func run() throws {
        let wordList = try readInput().components(separatedBy: "\n")

        var validWords: [String] = []
        if let dict = TTTDictionary(named: DCSNewOxfordAmericanDictionaryName) {
            for word in wordList where !dict.entries(forSearchTerm: word).isEmpty {
                validWords.append(word)
            }
        }

        let outputText = validWords.joined(separator: "\n") + "\n"

        try writeOutput(outputText: outputText)
    }

    private func readInput() throws -> String {
        guard let inputPath else {
            let inputData = FileHandle.standardInput.readDataToEndOfFile()
            return String(data: inputData, encoding: .utf8) ?? ""
        }

        return try String(contentsOfFile: inputPath, encoding: .utf8)
    }

    private func writeOutput(outputText: String) throws {
        guard let outputPath else {
            FileHandle.standardOutput.write(Data(outputText.utf8))
            return
        }

        try outputText.write(
            to: URL(fileURLWithPath: outputPath),
            atomically: true,
            encoding: .utf8,
        )
    }
}
