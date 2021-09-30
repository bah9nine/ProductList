//
//  AddViewIO.swift
//  ProductApp
//
//  Created by Иван Миронов on 16.02.2021.
//

import Foundation


protocol AddViewInput: class, BaseViewInput {
    func setupInitialState()
    func close()
}

protocol AddViewOutput {
    func viewIsReady()
    func save(_ product: Product)
}

