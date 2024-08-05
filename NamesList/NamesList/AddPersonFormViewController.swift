//
//  AddPersonFormViewController.swift
//  NamesList
//
//  Created by Beket Barlykov  on 02.11.2023.
//

import UIKit

class AddPersonFormViewController: UIViewController, AddPersonProtocol {
    var onFinish: ((String, String) -> Void)?
    
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    var namesList: [Person]?
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeVC = segue.destination as? ViewController else{
            return
        }

        guard let name = nameTextField.text, let surname = surnameTextField.text else{
            return
        }
        homeVC.personTemp = Person(name: name, surname: surname)
    }
    
    @IBAction func executeUnwindSegueAction(_ sender: UIStoryboardSegue){
        guard let homeVC = sender.source as? ViewController else{
            return
        }
        guard let name = nameTextField.text, let surname = surnameTextField.text else{
            return
        }
        homeVC.personTemp = Person(name: name, surname: surname)
        self.dismiss(animated: true)
    }
    
    func addPerson(personList: [Person]) {
        guard let name = nameTextField.text, let surname = surnameTextField.text else {
            return
        }
        personList.append(Person(name: name, surname: surname))
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
