//
//  ImageViewModel.swift
//  pinterest2
//
//  Created by Камила Багдат on 03.04.2025.
//

import SwiftUI
import UIKit
import Foundation

final class ImageViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    
    func getImage() {
        var tempImages: [ImageModel] = []
        let group = DispatchGroup()
        
        let urlStrings: [String] = (0...5).map { _ in
            "https://picsum.photos/id/\(Int.random(in: 0...1000))/500"}
        
        for url in urlStrings {
            group.enter()
            downloadImage(urlString: url) { model in
                if let model = model {
                    tempImages.append(model)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.images += tempImages
        }
    }
    
    func downloadImage(urlString: String, completion: @escaping (ImageModel?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }

            if let safeData = data {
                guard let image = UIImage(data: safeData) else {
                    print("Cannot create image")
                    completion(nil)
                    return
                }

                let convertedImage = Image(uiImage: image)
                let model = ImageModel(image: convertedImage)
                completion(model)
            }
        }
        .resume()
    }
}
