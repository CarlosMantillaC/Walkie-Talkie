//
//  ChannelsRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 29/08/25.
//

protocol ChannelsRepositoryProtocol {
    func fetchChannels(completion: @escaping (Result<[Channel], Error>) -> Void)
}
