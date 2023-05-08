//
//  DetailsViewController.swift
//  GSE_TechnicTest
//
//  Created by Jonathan Perez on 7/05/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var userId = Int()
    let homeViewModel = HomeViewModel()
    var users : GSEUserModelElement?
    var user: ObservableObject<GSEUserModelElement?> = ObservableObject(nil)

    @IBOutlet weak var userUserName: UILabel!
    @IBOutlet weak var userId2: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userStreet: UILabel!
    @IBOutlet weak var userSuite: UILabel!
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userZipcode: UILabel!
    @IBOutlet weak var userLat: UILabel!
    @IBOutlet weak var userLng: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userWebsite: UILabel!
    @IBOutlet weak var userCompName: UILabel!
    @IBOutlet weak var userCatch: UILabel!
    @IBOutlet weak var userBs: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(userId)
        retrieveDetailsData()
    }
    
    func retrieveDetailsData () {
        homeViewModel.getUserByID(id : userId) { data in
            DispatchQueue.main.async {
                self.users = data
                if let data = data {
                    self.user.value = data
                    self.userId2.text = String(self.user.value!.id)
                    self.userUserName.text = String(self.user.value!.username)
                    self.userName.text = String(self.user.value!.name)
                    self.userEmail.text = String(self.user.value!.email)
                    self.userStreet.text = String(self.user.value!.address.street)
                    self.userSuite.text = String(self.user.value!.address.suite)
                    self.userCity.text = String(self.user.value!.address.city)
                    self.userZipcode.text = String(self.user.value!.address.zipcode)
                    self.userLat.text = String(self.user.value!.address.geo.lat)
                    self.userLng.text = String(self.user.value!.address.geo.lng)
                    self.userPhone.text = String(self.user.value!.phone)
                    self.userWebsite.text = String(self.user.value!.website)
                    self.userCompName.text = String(self.user.value!.company.name)
                    self.userCatch.text = String(self.user.value!.company.catchPhrase)
                    self.userBs.text = String(self.user.value!.company.bs)
                }
            }
        }
    }

}
