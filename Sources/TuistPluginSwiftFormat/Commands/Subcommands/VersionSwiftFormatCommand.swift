import ArgumentParser
import TuistPluginSwiftFormatFramework

extension MainCommand {
    /// A command to print the current version of SwiftLint.
    struct VersionSwiftFormatCommand: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "version-swiftformat",
            abstract: "Outputs the current version of SwiftFormat."
        )

        func run() throws {
            VersionSwiftFormatService()
                .run()
        }
    }
}
