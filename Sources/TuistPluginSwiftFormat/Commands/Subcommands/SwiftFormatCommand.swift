import ArgumentParser
import TuistPluginSwiftFormatFramework
import SwiftFormat

extension MainCommand {
    /// A command to print the current version of the plugin.
    struct SwiftFormatCommand: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "swiftformat-lint",
            abstract: "lints the given directory with swiftformat"
        )
        
        @Option(
            name: .shortAndLong,
            help: "The path to the directory that contains the workspace or project whose code will be linted.",
            completion: .directory
        )
        var path: String?
        
        @Argument(
            help: "The target to be linted. When not specified all the targets of the graph are linted."
        )
        var target: String?
        
        @Flag(
            name: .shortAndLong,
            help: "Upgrades warnings to serious violations (errors)."
        )
        var strict: Bool = false
        
        func run() throws {
            VersionService().run()
        }
    }
}
