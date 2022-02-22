//
//  Coordinator.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
