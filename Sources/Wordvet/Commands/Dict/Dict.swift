import ArgumentParser
import Foundation

extension Wordvet {
    struct Dict: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "View dictionaries available on your system, or check if a given dictionary is available.",
            subcommands: [Check.self, List.self],
        )
    }
}
