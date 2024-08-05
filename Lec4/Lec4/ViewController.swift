//
//  ViewController.swift
//  Lec4
//
//  Created by Beket Barlykov  on 29.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
        cell.textLabel?.text = "Some title"
        cell.detailTextLabel?.text = "Some description"
        return cell
    }
    
    
    
    
}

