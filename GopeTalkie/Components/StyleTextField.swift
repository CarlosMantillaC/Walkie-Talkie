//
//  StyleTextField.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import UIKit

class StyledTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    private func setupStyle() {
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.fromHex("4b0082").cgColor
        layer.cornerRadius = 20
        clipsToBounds = true
    }
}
