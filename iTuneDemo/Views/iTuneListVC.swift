//
//  iTuneListVC.swift
//  iTuneDemo
//
//  Created by Arnav Singhal on 17/02/23.
//

import Foundation
import UIKit

class iTuneListVC: UITableViewController {
    
    private let iTuneVM = iTuneListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateiTunes()
        configureUI()
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "iTunes"
        self.tableView.register(iTuneCell.self, forCellReuseIdentifier: "iTuneCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        iTuneVM.artists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "iTuneCell", for: indexPath) as? iTuneCell else {
            fatalError("ituneCell not found")
        }
        let artist = iTuneVM.artists[indexPath.row]
        cell.configure(artist)
        return cell
    }
    
    private func populateiTunes() {
        iTuneVM.fetchAdele()
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}
