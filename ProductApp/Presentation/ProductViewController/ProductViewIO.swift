//
//  ProductViewIO.swift
//  ProductApp
//
//  Created by Иван Миронов on 16.02.2021.
//

import Foundation


protocol ProductViewInput: AnyObject, BaseViewInput {
    func setupInitialState()
}

protocol ProductViewOutput {
    var productStore: [Product] { get }
    func viewIsReady()
    func prepareTextForShare() -> String
    func deleteAllproducts()
    func deleteProduct(at index: Int)
}
