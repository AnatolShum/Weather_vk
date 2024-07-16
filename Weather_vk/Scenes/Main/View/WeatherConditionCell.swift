//
//  WeatherConditionCell.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 16.07.2024.
//

import UIKit

class WeatherConditionCell: UICollectionViewCell {
    static let reuseIdentifier = "WeatherConditionCell"
    
    private let conditionImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = UIColor(named: "cardBlue")
        return image
    }()
    
    private let conditionTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.textColor = .blue.withAlphaComponent(0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "cardBlue")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
        self.backgroundColor = .cyan.withAlphaComponent(0.3)
        
        createUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        addSubview(conditionImage)
        addSubview(conditionTitle)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            conditionImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            conditionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            conditionImage.heightAnchor.constraint(equalToConstant: 44),
            conditionImage.widthAnchor.constraint(equalTo: conditionImage.heightAnchor, multiplier: 1),
            conditionTitle.topAnchor.constraint(equalTo: conditionImage.bottomAnchor, constant: 8),
            conditionTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            conditionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configureCell(image: UIImage?, title: String) {
        let unwrappedImage = image ?? UIImage(systemName: "questionmark.circle")!
        
        DispatchQueue.main.async {
            self.conditionImage.image = unwrappedImage
            self.conditionTitle.text = title.localized()
        }
    }
    
    func animate() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.7
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        } completion: { _ in
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }
    }
   
}
