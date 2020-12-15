//
//  BankDataManger.swift
//  BankApp
//
//  Created by Yatharth Mahawar on 12/14/20.
//

import Foundation

protocol BankManagerDelegate {
    func dipUpdateBankData(bank:BankDataModel)
}

struct BankManager {
    
    let bankurl = "https://ifsc.razorpay.com/"
    
    var delegate: BankManagerDelegate?
    
    func fetchBankData(bankCode:String){
        let urlString = "\(bankurl)\(bankCode)"
        performRequest(urlString: urlString)
        
    }
    
    
    
    func performRequest(urlString:String){
        if let url = URL(string: urlString) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                    let res = try JSONDecoder().decode(BankData.self, from: data)
                    let bankName = res.BANK
                    let ifscCode = res.IFSC
                    let city = res.CITY
                    let bankDataFinal = BankDataModel(name: bankName, ifsc: ifscCode,city: city)
                    self.delegate?.dipUpdateBankData(bank:bankDataFinal)
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
            
        }
        
    }
}
