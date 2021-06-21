//
//  CoordinatorInterface.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set}
    
    func start()
}
