//
//  WebSocketServiceDelegate.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import Foundation

protocol WebSocketServiceDelegate: AnyObject {
    func didReceive(message: String)
    func didReceive(data: Data)
}
