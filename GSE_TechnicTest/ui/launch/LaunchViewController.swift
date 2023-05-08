//
//  LaunchViewController.swift
//  GSE_TechnicTest
//
//  Created by Pedro Vanegas on 7/05/23.
//

import Foundation
import UIKit

class LaunchViewController : UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 1.024, height: 200))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.width - size
            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
        })
        
    }
}
