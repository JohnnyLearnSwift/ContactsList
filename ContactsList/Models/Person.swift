//
//  Person.swift
//  ContactsList
//
//  Created by Eugenie Tyan on 15.08.2022.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let telephoneNumber: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
