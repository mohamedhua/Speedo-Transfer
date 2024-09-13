//
//  NotificationsViewController.swift
//  Speedo Transfer
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notifications"
        registerCells()
        assignDelegates()
    }

    private func registerCells() {
        tableView.register(UINib(nibName: NotificationTableViewCell.className, bundle: nil), forCellReuseIdentifier: NotificationTableViewCell.className)
    }
    
    private func assignDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.className, for: indexPath) as! NotificationTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(TransactionDetailsViewController(), animated: true)
    }
}
