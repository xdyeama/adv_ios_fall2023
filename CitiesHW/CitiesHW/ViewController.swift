//
//  ViewController.swift
//  CitiesHW
//
//  Created by Beket Barlykov  on 28.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let data: [City] = City.makeMock()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTableView()
    }

    func setupTableView(){
        tableView.dataSource = self
        
        tableView.register(.init(nibName: CityTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CityTableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(from: data[indexPath.row])
        return cell;
    }
    
    
    
}

