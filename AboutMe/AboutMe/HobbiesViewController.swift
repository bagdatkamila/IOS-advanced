//
//  HobbiesViewController.swift
//  AboutMe
//
//  Created by Камила Багдат on 13.02.2025.
//

import UIKit

class HobbiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var hobbies: [Hobby] = [
        Hobby(name: "Jigsaw puzzles", image: .jigsaw),
        Hobby(name: "Playing musical instruments", image: .music),
        Hobby(name: "Watching films", image: .watching),
        Hobby(name: "Baking", image: .baking),
        Hobby(name: "Creating videos", image: .video)
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
}

extension HobbiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hobbies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.hobbyImageView.image = hobbies[indexPath.row].image
        cell.hobbyNameLabel.text = hobbies[indexPath.row].name
        return cell
    }
}

