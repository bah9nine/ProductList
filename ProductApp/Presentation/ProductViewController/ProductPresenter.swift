//
//  ProductPresenter.swift
//  ProductApp
//
//  Created by Иван Миронов on 09.02.2021.
//

import Foundation

class ProductPresenter: ProductViewOutput {
    weak var view: ProductViewInput!
    let service = ProductServiceImp.shared
    var productStore: [Product] {
        service.productStore
    }
    
    init(view: ProductViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func prepareTextForShare() -> String {
        var text: String = ""
        let products = productStore
        
        for index in 0..<products.count {
            text += "\(index + 1)) \(products[index].name) - \(products[index].amount)\n"
        }
        return text
    }
    
    func deleteAllproducts() {
        do {
            try service.deleteAllProducts()
        } catch {
            view.show(error)
        }
    }
    
    func deleteProduct(at index: Int) {
        do {
            try service.deleteProductAt(index)
        } catch {
            view.show(error)
        }
    }
}
