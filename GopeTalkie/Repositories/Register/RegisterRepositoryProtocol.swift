//
//  RegisterRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 29/08/25.
//

protocol RegisterRepositoryProtocol {
    func register(user: RegisterRequest, completion: @escaping (Result<RegisterResponse, Error>) -> Void)
}
