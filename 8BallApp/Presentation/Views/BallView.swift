//
//  BallView.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 14.01.2022.
//

import UIKit

class BallView: UIView {
    private let ballImageView: UIImageView = {
        let image = UIImage(named: Constants.ballImageName)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(ballImageView)
        addSubview(messageLabel)
        setupLayout()
    }

    private func setupLayout() {
        ballImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ballImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ballImageView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.9).isActive = true
        ballImageView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.9).isActive = true
        
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
