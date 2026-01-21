import DictionaryKit
import Foundation

@main
struct wordvet {
    static func main() {
        // TODO: accept a file as command line arg
        let inputPath = ""
        let outputPath = ""

        guard let wordList = try? String(contentsOfFile: inputPath, encoding: .utf8).components(separatedBy: "\n") else {
            print("Couldn't find \(inputPath)")
            exit(EXIT_FAILURE)
        }

        var validWords: [String] = []
        if let dict = TTTDictionary(named: DCSNewOxfordAmericanDictionaryName) {
            for word in wordList {
                if dict.entries(forSearchTerm: word) != nil {
                    validWords.append(word)
                }
            }
        }

        try? String(validWords.joined(separator: "\n")).write(to: URL(fileURLWithPath: outputPath), atomically: true, encoding: .utf8)
    }
}
