import ArgumentParser
import Foundation

@main
struct Wordvet: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A utility for interacting with Apple system dictionaries.",
        subcommands: [Vet.self, Dict.self],
    )
}
