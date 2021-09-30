//
//  EditViewIO.swift
//  ProductApp
//
//  Created by Иван Миронов on 16.02.2021.
//

import Foundation


protocol EditViewInput: AnyObject, BaseViewInput {
    func setupInitialState()
    func close()
}

protocol EditViewOutput {
    var productStore: [Product] { get }
    func viewIsReady()
    func saveChanges(_ product: Product, _ index: Int)
}
