import SwiftFormat

/// A service that prints the version of the integrated SwiftFormat.
public final class VersionSwiftFormatService {
    public init() {}

    /// The entry point of the service.
    public func run() {
        print(SwiftFormat.version)
    }
}
