//
//  ViewController.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 14.01.2022.
//

import UIKit

class BallViewController: UIViewController {
    let ballView = BallView()
    
    override func loadView() {
        view = ballView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ballView.messageLabel.text = "Shake to see the answer"
    }
    
    
}

