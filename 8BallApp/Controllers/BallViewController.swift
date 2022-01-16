//
//  ViewController.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 14.01.2022.
//

import UIKit
import AudioToolbox

class BallViewController: UIViewController {
    
    private let ballView = BallView()
    private let callToShakeText = "Shake to see the answer"
    private var answer = ""
    let tempMessage = "No connection"
    
    private lazy var settingsBarButtonItem: UIBarButtonItem = {
        let gearIcon = UIImage(systemName: "gearshape.fill")
        return UIBarButtonItem(image: gearIcon, style: .plain, target: self, action: #selector(settingsBarButtonTapped))
    }()
    
    override func loadView() {
        view = ballView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.messageLabel.text = callToShakeText
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .gray
        navigationItem.rightBarButtonItem = settingsBarButtonItem
    }
    
    private func updateMessageLabel(message: String) {
        DispatchQueue.main.async {
            self.ballView.messageLabel.text = message
        }
    }
    
    
    // MARK: - User interaction events
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateMessageLabel(message: "")
        
        let url = URL(string: ballApiURL)
        DataFetcher.get(from: url!) { (result: Result<BallResponse, DataError>) in
            switch result {
            case .failure:
                self.answer = self.tempMessage
            case .success(let results):
                self.answer = results.magic.answer
            }
        }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIDevice.vibrate()
        updateMessageLabel(message: answer)
    }

    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateMessageLabel(message: callToShakeText)
    }
    
    @objc func settingsBarButtonTapped(_ sender:UIButton!) {
        let settingsViewController = SettingsTableViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

