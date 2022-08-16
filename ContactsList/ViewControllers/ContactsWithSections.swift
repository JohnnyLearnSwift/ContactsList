//
//  ContactsWithSections.swift
//  ContactsList
//
//  Created by Eugenie Tyan on 15.08.2022.
//

import UIKit

class ContactsWithSections: UITableViewController {
    
    var contacts: [Person]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = contacts[section]
        return person.fullName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContactsWithSections", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = contacts[indexPath.section]
        
        // Я чет не до конца въехал как foreach'ем перебирать массив, чтоб не хардкодить номера рядов
        switch indexPath.row {
        case 0:
            content.text = person.telephoneNumber
            content.image = UIImage(named: "phone")
        case 1:
            content.text = person.email
            content.image = UIImage(named: "email")
        default:
            break
        }
        content.imageProperties.maximumSize.height = 30
        
        cell.contentConfiguration = content

        return cell
    }
}
