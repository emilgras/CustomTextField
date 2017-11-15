//
//  CustomField.swift
//  Example
//
//  Created by Emil Gräs on 15/11/2017.
//  Copyright © 2017 Emil Gräs. All rights reserved.
//

import UIKit


@IBDesignable
class CustomField: UITextField {
    
    private var imageView: UIImageView?
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            if let image = image {
                setupLeftImageView(with: image)
            }
        }
    }
    
    private func setupLeftImageView(with image: UIImage) {
        imageView = UIImageView()
        guard let imageView = imageView else { return }
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0),
            imageView.widthAnchor.constraint(equalToConstant: frame.height)
            ])
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let left = self.image != nil ? frame.height + self.leftPadding : self.leftPadding
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let left = self.image != nil ? frame.height + self.leftPadding : self.leftPadding
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let left = self.image != nil ? frame.height + self.leftPadding : self.leftPadding
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0))
    }

}
