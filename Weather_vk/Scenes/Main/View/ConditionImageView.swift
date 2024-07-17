//
//  ConditionImageView.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 17.07.2024.
//

import UIKit

class ConditionImageView: UIView {
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray3
        
        createUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        addSubview(imageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setImage(with image: UIImage?) {
        guard let image else { return }
        
        UIView.animate(withDuration: 0.5) {
            self.imageView.alpha = 0.1
        } completion: { _ in
            UIView.animate(withDuration: 1) {
                self.imageView.alpha = 1
                self.imageView.image = image
            }
        }
    }
    
}
