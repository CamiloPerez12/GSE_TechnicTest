//
//  HomeViewController.swift
//  GSE_TechnicTest
//
//  Created by Jonathan Perez on 7/05/23.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let homeViewModel = HomeViewModel()
    var users : [GSEUserModelElement]? = []
    var user: ObservableObject<[GSEUserModelElement]?> = ObservableObject(nil)
    var userID = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        retrieveData()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    func retrieveData () {
        homeViewModel.getUsers() { data in
            DispatchQueue.main.async {
                self.users = data
                if let data = data {
                    self.user.value = data
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",
                                                 for: indexPath) as! CustomTableViewCell
        
        cell.iconImageView?.image = UIImage(systemName: "person.circle")
        cell.Name.text = users?[indexPath.row].name ?? "no se encontro"
        cell.Email.text = users?[indexPath.row].email
        cell.WebSite.text = users?[indexPath.row].website
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        userID = users?[indexPath.row].id ?? 0
        self.performSegue(withIdentifier: "goToDetails", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;//Choose your custom row height
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let DVC = segue.destination as! DetailsViewController
            DVC.userId = userID
        }
    }

}

