//
//  MainController.swift
//  SDD
//
//  Created by Rahmat Susanto on 30/09/23.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
  
        let home = HomeViewController()
        let promo = PromoViewController()
        let profile = ProfileViewController()
        
        let homeNavController = setupNavController(unselectedImage: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "home.fill"), for: home)
        let promoNavController = setupNavController(unselectedImage: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"), for: promo)
        let profileNavContrtoller = setupNavController(unselectedImage: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"), for: profile)
        
        viewControllers = [homeNavController, promoNavController, profileNavContrtoller]
    
    }

    private func setupNavController(unselectedImage: UIImage?, selectedImage: UIImage?,for controller: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: controller)
        nav.tabBarItem.image = unselectedImage?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        return nav
    }
}

