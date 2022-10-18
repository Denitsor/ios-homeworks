//
//  RootCoordinator.swift
//  Navigation
//
//  Created by MacBook on 18.10.2022.
//

import Foundation
import UIKit

protocol RootCoordinator {
    func startApplication() -> UIViewController
}

class RootCoordinatorImp: RootCoordinator {
    func startApplication() -> UIViewController {
        return TabBarController()
    }
}
