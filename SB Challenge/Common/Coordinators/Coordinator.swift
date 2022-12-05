//
//  Coordinator.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}
