//
//  ViewController.swift
//  NamesList
//
//  Created by Beket Barlykov  on 05.10.2023.
//

import UIKit

enum States{
    case delete
    case def
}

protocol AddPersonProtocol{
    func addPerson(personList: [Person])
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    
    var isNameButtonSelected: Bool = false
    var isSurnameButtonSelected: Bool = false
    
    var delegate: AddPersonProtocol? = nil
    
    
    var personList: [Person] = [Person(name: "John", surname: "Snow"), Person(name: "Martin", surname: "Luther"), Person(name: "Martin", surname: "Eden"), Person(name: "Jack", surname: "Sparrow")]
    var personListTemp: [Person] = []
    
    var personTemp: Person?
    
    @IBOutlet weak var nameButton: UIButton!
    
    @IBOutlet weak var surnameButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        guard let newPerson = personTemp else{
            return
        }
        
        personList.append(newPerson)
        
        print(personList)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        personListTemp = personList
        
        tableView.register(UINib(nibName: PersonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    @IBAction func sortByName(_ sender: UIButton) {
        if isNameButtonSelected == false {
            nameButton.setTitleColor(.red, for: .selected)
            personListTemp = personList.sorted { (person1: Person, person2: Person) -> Bool in
                return person1.name < person2.name
            }
        }else{
            nameButton.setTitleColor(.systemBlue, for: .normal)
            personListTemp = personList
        }
        isNameButtonSelected.toggle()
        tableView.reloadData()
    }
    
    @IBAction func sortBySurname(_ sender: UIButton) {
        if isSurnameButtonSelected == false{
            surnameButton.setTitleColor(.red, for: .selected)
            personListTemp = personList.sorted { (person1: Person, person2: Person) -> Bool in
                return person1.surname < person2.surname
            }
        }else{
            surnameButton.setTitleColor(.systemBlue, for: .normal)
            personListTemp = personList
        }
        isSurnameButtonSelected.toggle()
        tableView.reloadData()
    }
    
    
    @IBAction func navigateToForm(_ sender: Any) {
        performSegue(withIdentifier: "openFormSeque", sender: nil)
        
        if self.delegate != nil{
            var data = self.personList
            self.delegate?.addPerson(personList: data)
        }
        
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        guard let addFormVC = seque.destination as? AddPersonFormViewController else{
            return
        }
        
//        addFormVC.onFinish = { [weak self] name, surname in
//            self.namesList.append(Person(name: name, surname: surname))
//        }
        addFormVC.namesList = personList
    }
    
    @IBAction func unwindToHomeViewController(_ sender: UIStoryboardSegue){
//        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personListTemp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as! PersonTableViewCell
        cell.nameLabel.text = personListTemp[indexPath.row].name
        cell.surnameLabel.text = personListTemp[indexPath.row].surname
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("Deleted")
            self.personListTemp.remove(at: indexPath.row)
            self.personList = personListTemp
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
        }
    }
    
    
}


