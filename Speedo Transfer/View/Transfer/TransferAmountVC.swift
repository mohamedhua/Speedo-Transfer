//
//  TransferVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 09/09/2024.
//

import UIKit

class TransferAmountVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var recipientNameTextField: UITextField!
    @IBOutlet weak var recipientAccountTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpBackground(innerView: innerView)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
    }
    
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(TransferConfirmationVC(), animated: true)
    }
    
    
    @IBAction func favoriteBtnTapped(_ sender: UIButton) {
    }
    
}
