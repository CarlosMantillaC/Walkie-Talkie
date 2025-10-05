//
//  RegisterProtocols.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import Foundation
import UIKit

protocol RegisterViewProtocol: AnyObject {
    func showSuccess(message: String)
    func showError(_ error: String)
}

protocol RegisterPresenterProtocol: AnyObject {
    func didTapSend(
        firstName: String,
        lastName: String,
        email: String,
        password: String,
        confirmPassword: String
    )
}

protocol RegisterInteractorProtocol: AnyObject {
    func register(user: RegisterRequest)
}

protocol RegisterInteractorOutputProtocol: AnyObject {
    func registerSuccess(message: String)
    func registerFailed(with error: Error)
}

protocol RegisterRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
