//
//  AddViewController.swift
//  ProductApp
//
//  Created by Иван Миронов on 23.01.2021.
//

import UIKit

class AddViewController: UIViewController, AddViewInput {
    var output: AddViewOutput!
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var newProductTextField: UITextField!
    @IBOutlet weak var stepperValue: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        output = AddPresentor(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        navigationItem.title = "Add"
    }
    
    @IBAction func changingAmount(_ sender: UIStepper) {
        countingLabel.text = Int(sender.value).description
    }
    
    @IBAction func addProduct(_ sender: UIButton) {
        let name = newProductTextField.text ?? ""
        let amount = Int(stepperValue.value)
        let product = Product(name: name, amount: amount)
        output.save(product)
    }
    
    func close() {
        performSegue(withIdentifier: "unwindToMainVC", sender: nil)
    }
}

