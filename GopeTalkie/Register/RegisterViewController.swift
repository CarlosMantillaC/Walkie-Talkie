//
//  RegisterViewController.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import UIKit

class RegisterViewController: UIViewController {
    var presenter: RegisterPresenterProtocol?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: StyledTextField!
    @IBOutlet weak var lastNameTextField: StyledTextField!
    @IBOutlet weak var emailTextField: StyledTextField!
    @IBOutlet weak var passwordTextField: StyledTextField!
    @IBOutlet weak var confirmPasswordTextField: StyledTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startObservingKeyboard()
        
        passwordTextField.textContentType = .oneTimeCode
        confirmPasswordTextField.textContentType = .oneTimeCode
    }
    
    @IBAction func didTapSend(_ sender: Any) {
        if let presenter = presenter {
            presenter.didTapSend(
                firstName: nameTextField.text ?? "",
                lastName: lastNameTextField.text ?? "",
                email: emailTextField.text ?? "",
                password: passwordTextField.text ?? "",
                confirmPassword: confirmPasswordTextField.text ?? ""
            )
        }
    }
    
    deinit {
        stopObservingKeyboard()
    }
}

extension RegisterViewController: RegisterViewProtocol {
    func makeSuccessAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        })
        return alert
    }
    
    func makeErrorAlert(_ error: String) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }
    
    func showSuccess(message: String) {
        let alert = makeSuccessAlert(message: message)
        present(alert, animated: true)
    }
    
    func showError(_ error: String) {
        let alert = makeErrorAlert(error)
        present(alert, animated: true)
    }
}

extension RegisterViewController: KeyboardScrollable {
    var keyboardScrollableView: UIScrollView {
        return scrollView
    }
}
