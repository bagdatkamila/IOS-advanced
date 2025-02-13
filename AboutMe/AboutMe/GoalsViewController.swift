//
//  GoalsViewController.swift
//  AboutMe
//
//  Created by Камила Багдат on 13.02.2025.
//

import UIKit

class GoalsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals: [String] = ["To be in Paris Fashion Week", "To start a creative and  public project on Instagram", "To buy a car and go on a road trip", "To learn a new language", "To become a better person", "To buy a fridge full of kinder", "To become really quilified specialist in a field"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension GoalsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = goals[indexPath.row]
        return cell
    }
    
}
