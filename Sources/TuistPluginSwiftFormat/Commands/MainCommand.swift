import ArgumentParser

/// The entry point of the plugin. Main command that must be invoked in `main.swift` file.
struct MainCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "plugin-swiftformat",
        abstract: "A plugin that extends Tuist with SwiftFormat.",
        subcommands: [
            VersionSwiftFormatCommand.self, // prints the version of SwiftFormat
//            VersionCommand.self, // prints version of the plugin
//            SwiftFormatCommand.self
        ],
        defaultSubcommand: VersionSwiftFormatCommand.self
    )
}
