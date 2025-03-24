//
//  Managers.swift
//  memory
//
//  Created by Камила Багдат on 23.02.2025.
//

import UIKit

protocol ProfileUpdateDelegate: AnyObject {
    // TODO: Consider protocol inheritance requirements
    // Think: When should we restrict protocol to reference types only?
    func profileDidUpdate(_ profile: UserProfile)
    func profileLoadingError(_ error: Error)
}

class ProfileManager {
    // TODO: Think about appropriate storage type for active profiles
    private var activeProfiles: [String: UserProfile] = [:]
    
    // TODO: Consider reference type for delegate
    weak var delegate: ProfileUpdateDelegate?
    
    
    // TODO: Think about reference management in closure
    var onProfileUpdate: ((UserProfile) -> Void)?
    
    
    init(delegate: ProfileUpdateDelegate) {
        // TODO: Implement initialization
        self.delegate = delegate
    }
    
    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        // TODO: Implement profile loading
        // Consider: How to avoid retain cycle in completion handler?
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
                   
            if let profile = self.activeProfiles[id] {
                DispatchQueue.main.async {
                    completion(.success(profile))
                    self.delegate?.profileDidUpdate(profile)
                }
            } else {
                let error = NSError(domain: "ProfileError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Профиль не найден"])
                DispatchQueue.main.async {
                    completion(.failure(error))
                    self.delegate?.profileLoadingError(error)
                }
            }
        }
    }
    
    func updateProfile(_ profile: UserProfile) {
        activeProfiles[profile.id.uuidString] = profile
        onProfileUpdate?(profile)
        delegate?.profileDidUpdate(profile)
    }
}

protocol ImageLoaderDelegate: AnyObject {
    // TODO: Think about protocol requirements
    // Consider: What types can conform to this protocol?
    // Consider: How does this affect memory management?
    func imageLoader(_ loader: ImageLoader, didLoad image: UIImage)
    func imageLoader(_ loader: ImageLoader, didFailWith error: Error)
}

class ImageLoader {
    // TODO: Consider reference type for delegate
    weak var delegate: ImageLoaderDelegate?
    
    // TODO: Think about closure reference type
    var completionHandler: ((UIImage?) -> Void)?
    
    func loadImage(url: URL) {
        // TODO: Implement image loading
        // Consider: How to avoid retain cycle?
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }  // Ensure self is available
                    
                    // Simulate image loading
            let image = UIImage(systemName: "person.circle") // Example image
                    
                    // Back to the main thread to update the UI
            DispatchQueue.main.async {
                if let image = image {
                    self.completionHandler?(image)  // Calling the completion handler
                    self.delegate?.imageLoader(self, didLoad: image)  // Notifying delegate
                } else {
                    let error = NSError(domain: "ImageLoaderError", code: 500, userInfo: [NSLocalizedDescriptionKey: "Error loading image"])
                    self.delegate?.imageLoader(self, didFailWith: error)  // Notifying delegate of failure
                }
            }
        }
    }
}
