//
//  TabelViewCell.swift
//  ProductApp
//
//  Created by Иван Миронов on 20.01.2021.
//

import UIKit

class ProductCell: UITableViewCell {
    static let identifier = "ProductCell"
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
        
    func fill(with product: Product, index: Int) {
        amountLabel.text = product.amount.description
        nameLabel.text = product.name
        numberLabel.text = "\(index.description))"
    }
}
