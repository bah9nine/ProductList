//
//  EditViewController.swift
//  ProductApp
//
//  Created by Иван Миронов on 22.01.2021.
//

import UIKit

class EditViewController: UIViewController, EditViewInput {
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var output: EditViewOutput!
    var indexRow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = EditPresentor(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        navigationItem.title = "Edit"
        let product = output.productStore[indexRow]
        countingLabel.text = product.amount.description
        editNameTextField.text = product.name
        stepper.value = Double(product.amount)
    }
    
    @IBAction func changingAmount(_ sender: UIStepper) {
        countingLabel.text = Int(sender.value).description
    }

    @IBAction func saveChanges(_ sender: UIButton) {
        guard let index = indexRow else { return }
        let name = editNameTextField.text ?? ""
        let amountText = countingLabel.text ?? ""
        let amount = Int(amountText) ?? 0
        let product = Product(name: name, amount: amount)
        output.saveChanges(product, index)
    }
    
    func close() {
        performSegue(withIdentifier: "unwindToMainVC", sender: nil)
    }
}
