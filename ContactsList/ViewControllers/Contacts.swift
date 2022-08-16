//
//  Contacts.swift
//  ContactsList
//
//  Created by Eugenie Tyan on 15.08.2022.
//

import UIKit

class Contacts: UITableViewController {
    
    var contacts: [Person]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = "Back"
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContacts", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = contacts[indexPath.row]
        
        content.text = person.fullName
        
        cell.contentConfiguration = content
        return cell
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? ContactsDetail else { return}
        guard let indexPath = tableView.indexPathForSelectedRow else { return}
        detailsVC.person = contacts[indexPath.row]
    }

}
