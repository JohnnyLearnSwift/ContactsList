//
//  ContactsDetail.swift
//  ContactsList
//
//  Created by Eugenie Tyan on 16.08.2022.
//

import UIKit

class ContactsDetail: UIViewController {

    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelTel: UILabel!
    @IBOutlet var labelEmail: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = person.fullName
        labelTel.text = "Phone: \(person.telephoneNumber)"
        labelEmail.text = "Email: \(person.email)"
    }
}
