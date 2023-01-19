import Foundation
import SwiftFormat

/// A service that prints the version of SwiftLint.
public final class VersionSwiftLintService {
    public init() {}
    
    /// The entry point of the service.
    public func run() {
        print(SwiftFormat.version)
    }
}
