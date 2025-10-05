//
//  LoginRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 29/08/25.
//

protocol LoginRepositoryProtocol {
    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> Void)
}
