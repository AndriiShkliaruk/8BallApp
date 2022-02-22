//
//  ViewController.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 14.01.2022.
//

import UIKit
import AudioToolbox
import SwiftSpinner

class BallViewController: UIViewController {
    private let ballView = BallView()
    private var viewModel = BallViewModel()
    var coordinator: MainCoordinator?
    
    private lazy var settingsBarButtonItem: UIBarButtonItem = {
        let icon = UIImage(systemName: viewModel.settingsIconName)
        return UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(settingsBarButtonTapped))
    }()
    
    override func loadView() {
        view = ballView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.messageLabel.text = viewModel.callToShakeText
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        coordinator?.navigationController.navigationBar.tintColor = .gray
        navigationItem.rightBarButtonItem = settingsBarButtonItem
    }
    
    private func updateMessageLabel(message: String) {
        DispatchQueue.main.async {
            self.ballView.messageLabel.text = message
        }
    }
    
    
    // MARK: - User interaction methods
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateMessageLabel(message: viewModel.motionBeganText)
            SwiftSpinner.show(viewModel.loadingText)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            viewModel.getRandomAnswer { answerR in
                self.updateMessageLabel(message: answerR)
            }
            SwiftSpinner.hide()
            UIDevice.vibrate()
        }
    }
    
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateMessageLabel(message: viewModel.callToShakeText)
    }
    
    @objc func settingsBarButtonTapped(_ sender:UIButton!) {
        coordinator?.moveToSettings()
    }
    
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

