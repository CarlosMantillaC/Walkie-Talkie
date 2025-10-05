//
//  ChannelUsersRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 29/08/25.
//

protocol ChannelUsersRepositoryProtocol {
    func fetchUsers(for channelName: String, completion: @escaping (Result<[String], Error>) -> Void)
}
