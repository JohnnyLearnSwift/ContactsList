//
//  ContactsTabBar.swift
//  ContactsList
//
//  Created by Eugenie Tyan on 15.08.2022.
//

import UIKit

class ContactsTabBar: UITabBarController {
    
    var contacts: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeContacts()
        passDataToVCs()
    }

}

extension ContactsTabBar {
    private func initializeContacts() {
        var names = DataManager.names
        var surnames = DataManager.surnames
        var emails = DataManager.emails
        var telephoneNumbers = DataManager.telephoneNumbers
        
        for _ in 0...9 {
            let currentCount = names.count - 1
            
            let name = names.remove(at: Int.random(in: 0...currentCount))
            let surname = surnames.remove(at: Int.random(in: 0...currentCount))
            let email = emails.remove(at: Int.random(in: 0...currentCount))
            let telephoneNumber = telephoneNumbers.remove(at: Int.random(in: 0...currentCount))
            
            let person = Person(name: name, surname: surname, email: email, telephoneNumber: telephoneNumber)
            contacts.append(person)
        }
    }
    
    private func passDataToVCs() {
        guard let viewControllers = self.viewControllers else { return}
        for viewController in viewControllers {
            guard let navigationVC = viewController as? UINavigationController else { return}
            if let contactsVC = navigationVC.topViewController as? Contacts {
                contactsVC.contacts = self.contacts
            } else if let contactsWithSections = navigationVC.topViewController as? ContactsWithSections {
                contactsWithSections.contacts = self.contacts
            }
        }
    }
}
