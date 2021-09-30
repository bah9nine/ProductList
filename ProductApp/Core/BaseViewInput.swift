//
//  BaseViewControllerInput.swift
//  ProductApp
//
//  Created by Иван Миронов on 16.02.2021.
//

import UIKit

protocol BaseViewInput {
    func showAlert(title: String?, massage: String?)
    func show(_ error: Error)
}

extension BaseViewInput {
    
    func showAlert(title: String? = nil, massage: String? = nil) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
    func show(_ error: Error) {
        showAlert(title: "Error", massage: error.localizedDescription)
    }
}
