import ArgumentParser
import TuistPluginSwiftFormatFramework

extension MainCommand {
    /// A command to print the current version of SwiftLint.
    struct VersionSwiftLintCommand: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "version-swiftFormat",
            abstract: "Outputs the current version of SwiftLint."
        )
        
        func run() throws {
            VersionSwiftLintService()
                .run()
        }
    }
}
