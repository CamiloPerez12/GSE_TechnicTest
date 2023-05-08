//
//  NetworkApiService.swift
//  GSE_TechnicTest
//
//  Created by Jonathan Perez on 7/05/23.
//

import Foundation
import Alamofire

class networkApiService {
    
    private var urlServer: String
    private var manager: Session
    
    init(urlServer: String) {
        self.urlServer = urlServer
        
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            return config
        }()
        
        self.manager = Session(configuration: configuration)
        
    }
    
    func request<T:Codable>(urlService: String, completionHandler: @escaping([T]?)->Void){
        manager.request("\(self.urlServer)\(urlService)").validate().responseDecodable(of: [T].self) { response in
            guard let data = response.value else { print(response); return }
            completionHandler(data)
        }
    }
    
    func requestById<T:Codable>(urlService: String, completionHandler: @escaping(T?)->Void){
        manager.request("\(self.urlServer)\(urlService)").validate().responseDecodable(of: T.self) { response in
            guard let data = response.value else { print(response); return }
            completionHandler(data)
        }
    }
    
}

