//
//  productStructure.swift
//  ProductApp
//
//  Created by Иван Миронов on 20.01.2021.
//

import UIKit

struct Product {
    var name: String
    var amount: Int
    
    func isValid() throws {
        if name.isEmpty {
            throw ValidationError.emptyProduct
        }
        if amount <= 0 {
            throw ValidationError.zeroAmount
        }
    }
}

