//
//  BallView.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 14.01.2022.
//

import UIKit

class BallView: UIView {
    
    private let ballImageView: UIImageView = {
        let image = UIImage(named: "8ball.png")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        let gearIcon = UIImage(systemName: "gearshape.fill")
        button.setImage(gearIcon, for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }

    func createSubviews() {
        backgroundColor = .white
        addSubview(ballImageView)
        addSubview(messageLabel)
        addSubview(settingsButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ballImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ballImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ballImageView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.9).isActive = true
        ballImageView.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.9).isActive = true
        
        messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        settingsButton.frame = CGRect(x: frame.width - safeAreaInsets.right - 60, y: safeAreaInsets.top, width: 60, height: 60)
        
    }
    
}
