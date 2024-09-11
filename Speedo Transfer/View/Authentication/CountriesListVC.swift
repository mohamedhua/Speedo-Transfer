//
//  CountriesListVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 11/09/2024.
//

import UIKit

protocol CounteryListDelegate {
    func didSelectCountry(name: String)
}

class CountriesListVC: UIViewController {

    // MARK: - Porperties
    var counteries: [String] = ["Egypt", "Palestine", "Syrian"]
    var delegate: CounteryListDelegate?
    
    private var tableView: UITableView!
    private var grabber: UIView!
    private var containerStack: UIStackView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGrabber()
        setupTableView()
        setupContainerStack()

    }

    // MARK: - Private Methods
    private func setupGrabber() {
        grabber = UIView()
        grabber.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        grabber.layer.cornerRadius = 2.5
        grabber.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CounteryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CounteryCell")
        
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    private func setupContainerStack() {
        containerStack = UIStackView(arrangedSubviews: [grabber, tableView])
        containerStack.backgroundColor = .white
        containerStack.axis = .vertical
        containerStack.alignment = .fill
        containerStack.spacing = 10
        containerStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerStack)
        
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            containerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            containerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            containerStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            grabber.heightAnchor.constraint(equalToConstant: 5),
            grabber.widthAnchor.constraint(equalToConstant: 50),
            grabber.centerXAnchor.constraint(equalTo: containerStack.centerXAnchor)
        ])
    }
    
}
// MARK: - TableView DataSource and Delegate
extension CountriesListVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counteries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CounteryCell", for: indexPath) as! CounteryCell
        let countery = counteries[indexPath.row]
        cell.configure(with: countery)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountery = counteries[indexPath.row]
        delegate?.didSelectCountry(name: selectedCountery)
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let padding: CGFloat = 10
        let backgroundView = UIView(frame: CGRect(x: 0, y: padding / 2, width: tableView.bounds.width, height: cell.bounds.height - padding))
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
        backgroundView.backgroundColor = .white
        cell.backgroundView = backgroundView

        cell.contentView.backgroundColor = .clear
        cell.layer.masksToBounds = false
        cell.contentView.layer.masksToBounds = false
    }
}
