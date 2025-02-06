//
//  ViewController.swift
//  AboutMe
//
//  Created by Камила Багдат on 03.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let label = UILabel()
    
    let images = ["IMG_6117", "IMG_6118", "IMG_6119", "IMG_6120", "IMG_6121", "IMG_6122", "IMG_6123", "IMG_6124"]
    let texts = ["I am Kamila", "19 years old", "3rd year student", "furtunately not married", "Enjoy baking sweets", "love to read"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupImageView()
        setupLabel()
        setupButton()
        
    }
    
    func setupImageView() {
        imageView.frame = CGRect(x: 80, y: 100, width: 240, height: 240)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
       }
    
     func setupLabel() {
        label.frame = CGRect(x: 80, y: 350, width: 240, height: 200)
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
    }
    
    func setupButton() {
        let button = UIButton(frame: CGRect(x: 80, y: 500, width: 240, height: 50))
        button.setTitle("Something new", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func randomButtonTapped() {
        let randomIndex = Int.random(in: 0..<images.count)
        imageView.image = UIImage(named: images[randomIndex])
        label.text = texts[randomIndex]
    }
}

