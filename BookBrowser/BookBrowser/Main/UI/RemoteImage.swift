//
//  RemoteImage.swift
//  DevyceTest
//
//  Created by Vitalii Harshyn on 03.12.2024.
//
import SwiftUI

struct RemoteImage: View {
    
    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: URL(string: url))
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            RoundedRectangle(cornerRadius: 10)
                .fill(.regularMaterial)
        }
    }
}

@MainActor
class ImageLoader: ObservableObject {
    
    private let imageCache = ImageCache()
    
    @Published var image: UIImage?
    
    @Published var imageError: Error?

    private var url: URL?

    init(url: URL?) {
        self.url = url
      
        Task {
            do {
                try await loadImage()
            } catch {
                imageError = error
            }
        }
    }

    private func loadImage() async throws {
        guard let url else { throw URLError(.badURL) }
        if let cachedImage = imageCache.get(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }
        let (data, _) = try await URLSession.newInstance().data(for: request(url))
        guard let image = UIImage(data: data) else { throw URLError(.cannotDecodeContentData) }
        self.image = image
        imageCache.put(image, forKey: url.absoluteString)
    }
    
    private func request(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        return request
    }
}

private class ImageCache {
    private let cache = NSCache<NSString, UIImage>()

    func put(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
