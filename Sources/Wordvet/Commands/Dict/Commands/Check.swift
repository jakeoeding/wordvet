import ArgumentParser
import DictionaryKit
import Foundation

extension Wordvet.Dict {
    struct Check: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Check if a specific dictionary is available on this system."
        )

        @Argument(help: "The identifier of the dictionary to for check the existence of.")
        var identifier: String

        mutating func run() {
            print(TTTDictionary.availableDictionaries().contains(where: { $0.identifier == identifier }))
        }
    }
}
