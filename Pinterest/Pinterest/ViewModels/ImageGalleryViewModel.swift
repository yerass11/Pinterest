import Foundation
import SwiftUI

final class ImageGalleryViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    @Published var isLoading: Bool = false
    
    func fetchImages(count: Int = 5) {
        let group = DispatchGroup()
        var newImages: [ImageModel] = []

        DispatchQueue.main.async {
            self.isLoading = true
        }

        for _ in 0..<count  {
            group.enter()

            let imageURLString = "https://picsum.photos/200/300?random=\(UUID().uuidString)"

            guard let url = URL(string: imageURLString) else {
                group.leave()
                continue
            }

            if let cachedImage = ImageCache.shared.image(for: imageURLString) {
                DispatchQueue.main.async {
                    newImages.append(ImageModel(image: cachedImage))
                    group.leave()
                }
                continue
            }

            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url),
                      let image = UIImage(data: data) else {
                    group.leave()
                    return
                }

                ImageCache.shared.set(image, for: imageURLString)

                DispatchQueue.main.async {
                    newImages.append(ImageModel(image: image))
                    group.leave()
                }
            }
        }

        group.notify(queue: .main) {
            self.images.append(contentsOf: newImages)
            self.isLoading = false
        }
    }
}
