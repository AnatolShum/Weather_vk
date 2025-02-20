//
//  CollectionViewDataSource.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 16.07.2024.
//

import UIKit

extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherConditions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeatherConditionCell.reuseIdentifier,
            for: indexPath) as! WeatherConditionCell
        
        let condition = weatherConditions[indexPath.row]
        let image = UIImage(systemName: condition.iconName)
        
        cell.configureCell(image: image, title: condition.name)
        
        return cell
    }
}
