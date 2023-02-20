import SwiftFormat
import ProjectAutomation

/// A service that prints the version of the integrated SwiftFormat.
public final class SwiftFormatService {
    public init() {}

    /// The entry point of the service. Invoke it to start linting.
    /// - Parameters:
    ///   - path: The path to the directory that contains the workspace or project whose code will be linted.
    ///   - projectName: The project to be linted. When not specified all files of the graph are linted.
    ///   - strict: If `true` then warnings will be updated to serious violations (errors).
    public func run(path: String, projectName: String?) throws {
        let graph = try getGraph(at: path)
        let pathToLint = try pathToLint(for: projectName, in: graph)
        
        let exitCode = CLI.run(in: pathToLint, with: ["lint"])
    }
    
    private func getGraph(at path: String?) throws -> Graph {
        do {
            return try Tuist.graph(at: path)
        } catch {
            throw SwiftFormatServiceError.graphNotFound
        }
    }
       
    private func pathToLint(for projectName: String?, in graph: Graph) throws -> String {
        if let projectName {
            guard let project = graph.projects.values.first(where: { $0.name == projectName }) else {
                throw SwiftFormatServiceError.projectNotFound(projectName: projectName)
            }
            
            return project.path
        }
        
        return graph.path
    }

}

enum SwiftFormatServiceError: Error {
    case graphNotFound
    case projectNotFound(projectName: String)
}
