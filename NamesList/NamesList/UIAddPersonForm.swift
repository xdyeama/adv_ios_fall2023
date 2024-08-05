//
//  AddPersonViewController.swift
//  NamesList
//
//  Created by Beket Barlykov  on 02.11.2023.
//

import Foundation
import UIKit


class UIAddPersonForm: UIViewController{
    
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
        self.navigationController?.popViewController(animated: true)
    }

}
