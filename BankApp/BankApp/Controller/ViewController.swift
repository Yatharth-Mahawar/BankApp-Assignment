//
//  ViewController.swift
//  BankApp
//
//  Created by Yatharth Mahawar on 12/14/20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let bank = realm.objects(BankSaveData.self)
        return bank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCell
        let bank = [realm.objects(BankSaveData.self)]
        for bankData in bank {
            cell.bankName.text = bankData[indexPath.row].bankName
            cell.ifscCode.text = bankData[indexPath.row].ifscCode
            cell.address.text = bankData[indexPath.row].cityName
        }
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    
    @IBAction func reloadData(_ sender: UIButton) {
        tableView.reloadData()
    }
    
}


