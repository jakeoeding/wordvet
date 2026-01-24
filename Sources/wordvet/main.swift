import DictionaryKit
import Foundation

@main
struct Entrypoint {
    static func main() {
        // TODO: accept a file as command line arg
        let inputPath = ""
        let outputPath = ""

        guard let inputText = try? String(contentsOfFile: inputPath, encoding: .utf8) else {
            print("Couldn't find \(inputPath)")
            exit(EXIT_FAILURE)
        }

        let wordList = inputText.components(separatedBy: "\n")

        var validWords: [String] = []
        if let dict = TTTDictionary(named: DCSNewOxfordAmericanDictionaryName) {
            for word in wordList where dict.entries(forSearchTerm: word) != nil {
                validWords.append(word)
            }
        }

        let outputText = validWords.joined(separator: "\n")

        try? outputText.write(
            to: URL(fileURLWithPath: outputPath),
            atomically: true,
            encoding: .utf8,
        )
    }
}
