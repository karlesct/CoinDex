//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import Combine
import ContactsUI

class MainMasterViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var contactAction: UIButton! {
        didSet {
            self.contactAction.setTitle("Contact Action",
                                         for: .normal)
            self.contactAction.addTarget(self,
                                          action: #selector(self.contacAction),
                                          for: .touchUpInside)

        }
    }
    
    // MARK: - Properties
    
    var viewModel: MainMasterViewModelProtocol?
    var navigator: MainMasterNavigator?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    // MARK: - Methods
    
    func setupUI() {
        self.setNavigation(image: .tabBar.exchangesIcon,
                           title: self.viewModel?.title ?? .empty,
                           color: .xFFFFFF)
        
        self.view.backgroundColor = .xF6F6F6
    }
    
    @objc func contacAction() {
        PermissionsProvider.request(permission: .contacts) { [weak self] result in
            NSLog("PermissionsProvider result: \(result)")
            switch result {
            case true:
                self?.getContacts()
            case false:
                break
            }
        }
    }
    
    func getContacts() {
        var contacts = [CNContact]()
        let key = [CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
       
       let contactStore = CNContactStore()
       do {
           try contactStore.enumerateContacts(with: request) {
               (contact, stop) in
               // Array containing all unified contacts from everywhere
               
               if contact.givenName == "Carles" {
                   contacts.append(contact)
                   print("[CONTACTS] - \(contacts)")
               }

           }
       }
       catch {
           print("unable to fetch contacts")
       }
    }
}

