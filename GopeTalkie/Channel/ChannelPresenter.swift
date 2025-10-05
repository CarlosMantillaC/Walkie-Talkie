//
//  HomePresenter.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import Foundation

final class ChannelPresenter {
    weak var view: ChannelViewProtocol?
    var interactor: ChannelInteractorProtocol?
    var router: ChannelRouterProtocol?
    private let channel: Channel?
    
    init(channel: Channel?) {
        self.channel = channel
    }
}

extension ChannelPresenter: ChannelPresenterProtocol {
    func viewDidLoad() {
        guard let channel = channel else {
            view?.showDisconnectedState()
            return
        }
        interactor?.connectToChannel(named: channel.name)
        view?.setChannelName(channel.name)
        interactor?.fetchUsersInChannel(named: channel.name)
    }
    
    func didTapLogout() {
        interactor?.logout()
    }
    
    func startTalking() {
        interactor?.startTalking()
    }
    
    func stopTalking() {
        interactor?.stopTalking()
    }
    
    func didTapExit() {
        interactor?.disconnectFromChannel()
    }

    func refreshUsers() {
        guard let channel = channel else { return }
        interactor?.fetchUsersInChannel(named: channel.name)
    }
    
    func didTapDropdown() {
        if let view = view {
            router?.presentChannelsModally(from: view)
        }
    }
}

extension ChannelPresenter: ChannelInteractorOutputProtocol {
    func logoutSucceeded(message: String) {
        router?.navigateToLogin(with: message)
    }

    func didFetchUsers(_ emails: [String]) {
        let count = emails.count
        let text = "\(count) conectados"
        view?.displayUsers(text)
    }
    
    func didDisconnect() {
        view?.showDisconnectedState()
    }
}
