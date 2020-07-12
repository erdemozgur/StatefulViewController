//
//  LoadingView.swift
//  Example
//
//  Created by Alexander Schuch on 29/08/14.
//  Copyright (c) 2014 Alexander Schuch. All rights reserved.
//

import UIKit
import StatefulViewController

class LoadingView: BasicPlaceholderView, StatefulPlaceholderView {

	let label = UILabel()
    let imageView = UIImageView()
	
	override func setupView() {
		super.setupView()
		
        imageView.image = UIImage(named: "vesikalik")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        centerView.addSubview(imageView)
        
		label.text = "Loading..."
		label.translatesAutoresizingMaskIntoConstraints = false
		centerView.addSubview(label)
		
        let activityIndicator = UIActivityIndicatorView(style: .gray)
		activityIndicator.startAnimating()
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		centerView.addSubview(activityIndicator)
        
        if #available(iOS 11.0, *) {
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
            imageView.bottomAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: -60).isActive = true


        } else {
            // Fallback on earlier versions
        }
		
        let views = ["label": label, "activity": activityIndicator]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "|-[activity]-[label]-|", options: [], metrics: nil, views: views)
		let vConstraintsLabel = NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: views)
		let vConstraintsActivity = NSLayoutConstraint.constraints(withVisualFormat: "V:|[activity]|", options: [], metrics: nil, views: views)
        

        
		centerView.addConstraints(hConstraints)
		centerView.addConstraints(vConstraintsLabel)
		centerView.addConstraints(vConstraintsActivity)
	}

    func placeholderViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}
