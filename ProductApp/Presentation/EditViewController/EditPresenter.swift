//
//  EditPresentor.swift
//  ProductApp
//
//  Created by Иван Миронов on 09.02.2021.
//

import Foundation

class EditPresentor: EditViewOutput {
    weak var view: EditViewInput!
    let service = ProductServiceImp.shared
    var productStore: [Product] {
        service.productStore
    }
    
    init(view: EditViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func saveChanges(_ product: Product, _ index: Int) {
        do {
            try product.isValid()
            try service.edit(product, at: index)
            view.close()
        } catch {
            view.show(error)
        }
    }
}
