//
//  SecondViewController.swift
//  BankApp
//
//  Created by Yatharth Mahawar on 12/14/20.
//

//
//  ViewController.swift
//  BankApp
//
//  Created by Yatharth Mahawar on 12/14/20.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController,BankManagerDelegate,UISearchTextFieldDelegate {
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var ifscCode: UILabel!
    @IBOutlet weak var cityName: UILabel!
    var bank = BankManager()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.delegate = self
        // Do any additional setup after loading the view.
        self.searchText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return searchText.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        let BankDataDetails = BankSaveData()
        BankDataDetails.bankName = bankName.text!
        BankDataDetails.ifscCode = ifscCode.text!
        BankDataDetails.cityName = cityName.text!
        realm.beginWrite()
        realm.add(BankDataDetails)
        try! realm.commitWrite()
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        bank.fetchBankData(bankCode: searchText.text!)
    }
    
    func dipUpdateBankData(bank: BankDataModel) {
        DispatchQueue.main.async {
            self.bankName.text = bank.name
            self.ifscCode.text = bank.ifsc
            self.cityName.text = bank.city
            
            
        }
    }
}

