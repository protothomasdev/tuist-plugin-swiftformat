import ArgumentParser

/// The entry point of the plugin. Main command that must be invoked in `main.swift` file.
struct MainCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "plugin-swiftformat",
        abstract: "A plugin that extends Tuist with SwiftFormat.",
        subcommands: [
//            SwiftLintCommand.self, // lints code
            VersionCommand.self, // prints version of the plugin
            VersionSwiftLintCommand.self, // prints version of SwiftLint
        ],
        defaultSubcommand: VersionCommand.self
    )
}
