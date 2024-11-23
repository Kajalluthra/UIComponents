import Foundation

extension Bundle {
    private static let packageName = "UIComponents"
    private static let moduleName = "UIComponents"
    
    #if targetEnvironment(simulator)
    static var customBundle: Bundle {
        final class CurrentBundleFinder {}

        let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        
        guard isPreview else {
            return Bundle.module
        }
        
        // This is a workaround for SwiftUI previews
        // previews crash when accessing other package view using assets from Bundle.module
        
        let bundleName = "\(packageName)_\(moduleName).bundle"
        
        func bundle(stepsBack: Int) -> Bundle? {
            var bundleURL = Bundle(for: CurrentBundleFinder.self).bundleURL
            for _ in 1...stepsBack { bundleURL.deleteLastPathComponent() }
            bundleURL.appendPathComponent(moduleName)
            bundleURL.appendPathComponent("Products")
            bundleURL.appendPathComponent("Debug-iphonesimulator")
            bundleURL.appendPathComponent("PackageFrameworks")
            
            let directories: [String]
            do {
                directories = try FileManager.default.contentsOfDirectory(atPath: bundleURL.path)
            } catch {
                return nil
            }
            
            guard let matchingDir = directories.first(where: { $0.hasSuffix(".framework") }) else {
                return nil
            }
            
            bundleURL.appendPathComponent(matchingDir)
            bundleURL.appendPathComponent(bundleName)
            
            return Bundle(url: bundleURL)
        }
        
        // Steps back 5 is a workaround for crashes
        // when another module is importing this module
        return bundle(stepsBack: 5) ?? .module
    }
    #else
    static var customBundle: Bundle { .module }
    #endif
}
