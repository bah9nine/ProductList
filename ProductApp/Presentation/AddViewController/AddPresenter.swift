//
//  AddPresentor.swift
//  ProductApp
//
//  Created by Иван Миронов on 09.02.2021.
//

import Foundation
import CoreData

class AddPresentor: AddViewOutput {
    weak var view: AddViewInput!
    let service = ProductServiceImp.shared
    
    init(view: AddViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func save(_ product: Product) {
        do {
            try product.isValid()
            try service.save(product)
            view.close()
        } catch {
            view.show(error)
        }
    }
}
