//
//  HomeViewModel.swift
//  GSE_TechnicTest
//
//  Created by Jonathan Perez on 7/05/23.
//

import Foundation

class HomeViewModel {
    
    var repository = RepositoryData()
    var UserList : GSEUserModel?
    
    
    init() {}
    
    func getUsers (completionHandler: @escaping([GSEUserModelElement]?) -> Void) {
        let urlService = ""
        repository.apiRest.request(urlService: urlService, completionHandler: completionHandler)
    }
     
    func getUserByID (id : Int, completionHandler : @escaping(GSEUserModelElement?) -> Void ) {
        let urlService2 = "/\(id)"
        repository.apiRest.requestById(urlService: urlService2, completionHandler: completionHandler)
    }
    
}
