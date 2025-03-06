//
//  UserProfileViewController.swift
//  memory
//
//  Created by Камила Багдат on 23.02.2025.
//

import UIKit

class UserProfileViewController: UIViewController, ProfileUpdateDelegate {
    var profileManager: ProfileManager?
    var imageLoader: ImageLoader?
    
    // UI Components
    private var usernameLabel: UILabel!
    private var bioLabel: UILabel!
    private var followersLabel: UILabel!
    private var updateProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupProfileManager()
    }
    
    private func setupUI() {
        // Set up labels
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        bioLabel = UILabel()
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        followersLabel = UILabel()
        followersLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followersLabel)
        
        // Set up button
        updateProfileButton = UIButton(type: .system)
        updateProfileButton.translatesAutoresizingMaskIntoConstraints = false
        updateProfileButton.setTitle("Update Profile", for: .normal)
        updateProfileButton.addTarget(self, action: #selector(updateProfile), for: .touchUpInside)
        view.addSubview(updateProfileButton)
        
        // Add constraints
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            followersLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 20),
            followersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            updateProfileButton.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 30),
            updateProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupProfileManager() {
        profileManager = ProfileManager(delegate: self)
        profileManager?.loadProfile(id: "1") { result in
            switch result {
            case .success(let profile):
                // Update UI with profile data
                self.displayProfile(profile)
            case .failure(let error):
                // Handle error
                self.displayError(error)
            }
        }
    }
    
    @objc func updateProfile() {
        profileManager?.loadProfile(id: "1", completion: { [weak self] result in
            switch result {
            case .success(let profile):
                // Update the profile UI
                self?.displayProfile(profile)
            case .failure(let error):
                self?.displayError(error)
            }
        })
    }
    
    func profileDidUpdate(_ profile: UserProfile) {
        // Handle profile update
        displayProfile(profile)
    }
    
    func profileLoadingError(_ error: Error) {
        // Handle error display
        displayError(error)
    }
    
    func displayProfile(_ profile: UserProfile) {
        usernameLabel.text = "Username: \(profile.username)"
        bioLabel.text = "Bio: \(profile.bio)"
        followersLabel.text = "Followers: \(profile.followers)"
    }
    
    func displayError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

