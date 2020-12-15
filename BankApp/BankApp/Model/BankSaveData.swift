//
//  BankSaveData.swift
//  BankApp
//
//  Created by Yatharth Mahawar on 12/14/20.
//

import Foundation
import RealmSwift

class BankSaveData: Object {
    @objc dynamic var bankName:String = ""
    @objc dynamic var ifscCode:String = ""
    @objc dynamic var cityName:String = ""
    
}
