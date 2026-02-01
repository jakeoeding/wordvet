import ArgumentParser
import DictionaryKit
import Foundation

extension Wordvet.Dict {
    struct List: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "List the available dictionaries on this system."
        )

        @Option(name: .shortAndLong, help: "Filter results for matching locale.")
        var locale: String?

        mutating func run() {
            var availableDicts = TTTDictionary.availableDictionaries()

            if let locale {
                availableDicts = availableDicts.filter { $0.primaryLanguage == locale }
            }

            let maxLength = availableDicts.reduce(into: 0) { (maxLength, dict) in
                maxLength = max(maxLength, dict.identifier?.count ?? 0)
            }

            let formattedDictionaries = availableDicts
                .map { dict in
                    let identifier = dict.identifier ?? ""
                    let name = dict.name ?? ""
                    return "\(identifier.padding(toLength: maxLength, withPad: " ", startingAt: 0))\t\(name)"
                }
                .joined(separator: "\n")

            print(formattedDictionaries)
        }
    }
}
