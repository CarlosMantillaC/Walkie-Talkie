//
//  ChannelsViewController.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import UIKit

class ChannelsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ChannelsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de Canales"
        
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        guard let tableView = tableView else { return }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChannelsTableViewCell", bundle: nil), forCellReuseIdentifier: "ChannelsCell")
        tableView.backgroundColor = .clear
    }
}

extension ChannelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.channelsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelsCell", for: indexPath) as? ChannelsTableViewCell else {
            return UITableViewCell()
        }
        
        presenter?.configure(cell: cell, at: indexPath.row)
        return cell
    }
}

extension ChannelsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectChannel(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ChannelsViewController: ChannelsViewProtocol {
    func reloadData() {
        tableView?.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

