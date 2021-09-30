//
//  CoreDataError.swift
//  ProductApp
//
//  Created by Иван Миронов on 12.02.2021.
//

import Foundation

enum CoreDataError: LocalizedError {
    case getProductForCoreData
    case clearCoreData
    case deleteProduct
    case save
    case edit
    
    var errorDescription: String? {
        switch self {
        case .clearCoreData:
            return "Error of clearing Core Data"
        case .deleteProduct:
            return "Error of deleting product"
        case .edit:
            return "Error of editing product"
        case .getProductForCoreData:
            return "Error receiving products from Core Data"
        case .save:
            return "Error of saving product"
        }
    }
}
