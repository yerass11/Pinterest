import UIKit

final class ImageCache {
    static let shared = ImageCache()
    
    private init() {}

    private var cache: [String: UIImage] = [:]
    
    func image(for url: String) -> UIImage? {
        return cache[url]
    }
    
    func set(_ image: UIImage, for url: String) {
        cache[url] = image
    }
}
