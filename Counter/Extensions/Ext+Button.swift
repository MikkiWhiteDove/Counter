//
//  Ext+Button.swift
//  Counter
//
//  Created by Mishana on 16.05.2023.
//

import UIKit

extension UIButton {
    func visible(title: String? ,bacground color: UIColor, image: String?) {
        self.setImage(UIImage(systemName: image ?? ""), for: .normal)
        self.setTitle(title ?? "", for: .normal)
        self.imageView?.image = UIImage(systemName: "plus")
        self.backgroundColor = color
        self.tintColor = .white
        self.layer.cornerRadius = 10
    }
}
