//
//  MainController.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 16.07.2024.
//

import UIKit

class MainController: UIViewController {
    let weatherConditions: [Condition] = [
        Condition(name: "sunny", iconName: "sun.max", imageName: ""),
        Condition(name: "partlyCloudy", iconName: "cloud.sun", imageName: ""),
        Condition(name: "cloudy", iconName: "cloud", imageName: ""),
        Condition(name: "rainy", iconName: "cloud.rain", imageName: ""),
        Condition(name: "drizzle", iconName: "cloud.drizzle", imageName: ""),
        Condition(name: "thunderstorm", iconName: "cloud.bolt.rain", imageName: ""),
        Condition(name: "snowy", iconName: "cloud.snow", imageName: ""),
        Condition(name: "windy", iconName: "wind", imageName: ""),
        Condition(name: "foggy", iconName: "cloud.fog", imageName: ""),
    ]
    
    var collectionView: UICollectionView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 14, bottom: 8, right: 14)
        layout.itemSize = CGSize(width: 140, height: 92)
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        randomItem()
    }
    
    private func createUI() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .systemGray5
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            WeatherConditionCell.self,
            forCellWithReuseIdentifier: WeatherConditionCell.reuseIdentifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func randomItem() {
        guard let randomCondition = weatherConditions.randomElement() else { return }
        let index =  weatherConditions.firstIndex { $0 == randomCondition }
        guard let index else { return }
        
        let indexPath = IndexPath(item: index, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}
