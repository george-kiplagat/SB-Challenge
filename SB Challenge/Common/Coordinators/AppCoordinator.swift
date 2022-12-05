//
//  AppCoordinator.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation
import UIKit


class AppCoordinator : Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        goToHome()
    }
    
    
    func goToHome(){
        // Initiate HomeTabBar Coordinator
        
        let coordinator = HomeCoordinator.init(navigationController: navigationController)
        coordinator.parentCoordinator = self
        children.append(coordinator)
        
        coordinator.start()
        
    }
    
    
}
