//
//  RegisterRequest.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

struct RegisterRequest: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let confirmPassword: String
}
