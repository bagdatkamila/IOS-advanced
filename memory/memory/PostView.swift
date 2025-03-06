//
//  PostView.swift
//  memory
//
//  Created by Камила Багдат on 23.02.2025.
//

import UIKit

class PostView: UIView {
    var imageLoader: ImageLoader?
    
    // UI Components
    private var imageView: UIImageView!
    private var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        // Initialize and configure image view
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // Initialize activity indicator for loading
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        
        // Add constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupImageLoader() {
        imageLoader = ImageLoader()
        activityIndicator.startAnimating()
        imageLoader?.loadImage(url: URL(string: "https://i.scdn.co/image/ab67616d0000b273a0c28fb519ef61862c3e81cb")!) { [weak self] (image: UIImage?) in
                self?.activityIndicator.stopAnimating()
                if let loadedImage = image {
                    self?.displayImage(loadedImage)
                } else {
                    self?.displayError()
                }
            }
    }
    
    func displayImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func displayError() {
        // Handle error display
        print("Error loading image")
    }
}

