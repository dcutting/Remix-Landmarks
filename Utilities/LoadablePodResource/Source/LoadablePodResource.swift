public protocol LoadablePodResource: class {}

extension LoadablePodResource {
    
    static func loadBundle(named name: String) -> Bundle? {
        let podBundle = Bundle(for: self)
        guard let bundleURL = podBundle.url(forResource: name, withExtension: "bundle"),
            let bundle = Bundle(url: bundleURL) else {
                return nil
        }
        return bundle
    }
}

extension LoadablePodResource where Self: UIViewController {
    
    public static func fromStoryboard(named storyboardName: String, identifier: String, bundle bundleName: String) -> Self {
        if let bundle = loadBundle(named: bundleName) {
            let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
            if let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self {
                return viewController
            }
        }
        preconditionFailure("Could not load \(identifier) from storyboard \(storyboardName) in bundle \(bundleName)")
    }
}

