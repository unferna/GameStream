//
//  LocalStorage.swift
//  GameStream
//
//  Created by Fernando Florez on 25/08/21.
//

import Foundation

class LocalStorage {
    private init() {}
    
    public static let shared = LocalStorage()
    
    private let db = UserDefaults.standard
    
    func saveData(email: String, password: String, name: String) -> Bool {
        print("Email:", email)
        print("Password:", password)
        print("Name:", name)
        
        db.setValue([email, password, name], forKey: "userData")
        
        return true
    }
    
    
    func getData() -> (email: String, password: String, name: String)? {
        if let record =  db.value(forKey: "userData") as? [String] {
            return (email: record[0], password: record[1], name: record[2])
        }
        
        return nil
    }
    
    func login(email: String, password: String) -> Bool {
        if let userData = getData(), userData.email == email && userData.password == password {
            return true
        }
        
        return false
    }
}
