//
//  ValidationErrors.swift
//  ProductApp
//
//  Created by Иван Миронов on 12.02.2021.
//

import Foundation

enum ValidationError: LocalizedError {
    case emptyProduct
    case zeroAmount
    
    var errorDescription: String? {
        switch self {
        case .emptyProduct:
            return "Fill \"Product name\" field!"
        case .zeroAmount:
            return "Amount equal zero"
        }
    }
}
