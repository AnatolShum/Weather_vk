//
//  MainController.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 16.07.2024.
//

import UIKit

class MainController: UIViewController {
    private let layout: UICollectionViewFlowLayout
    private let conditionalImageView: ConditionImageView
    let collectionView: UICollectionView
    
    let weatherConditions: [Condition] = [
        Condition(name: "sunny", iconName: "sun.max", imageName: "sunny"),
        Condition(name: "partlyCloudy", iconName: "cloud.sun", imageName: "partlyCloudy"),
        Condition(name: "cloudy", iconName: "cloud", imageName: "cloudy"),
        Condition(name: "rainy", iconName: "cloud.rain", imageName: "rainy"),
        Condition(name: "drizzle", iconName: "cloud.drizzle", imageName: "drizzle"),
        Condition(name: "thunderstorm", iconName: "cloud.bolt.rain", imageName: "thunderstorm"),
        Condition(name: "snowy", iconName: "cloud.snow", imageName: "snowy"),
        Condition(name: "windy", iconName: "wind", imageName: "windy"),
        Condition(name: "foggy", iconName: "cloud.fog", imageName: "foggy"),
    ]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 14, bottom: 8, right: 14)
        layout.itemSize = CGSize(width: 140, height: 92)
        
        self.conditionalImageView = ConditionImageView()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        conditionalImageView.frame = view.bounds
        view = conditionalImageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        randomItem()
    }
    
    private func createUI() {
        collectionView.backgroundColor = .systemGray6.withAlphaComponent(0.2)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            WeatherConditionCell.self,
            forCellWithReuseIdentifier: WeatherConditionCell.reuseIdentifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func randomItem() {
        guard let randomCondition = weatherConditions.randomElement() else { return }
        let index =  getIndex(with: randomCondition)
        
        let indexPath = getIndexPath(with: index)
        
        let image = getImage(with: indexPath)
        conditionalImageView.setImage(with: image)
        
        scrollToItem(with: indexPath)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func getIndex(with condition: Condition) -> Int? {
        return weatherConditions.firstIndex { $0 == condition }
    }
    
    private func getIndexPath(with index: Int?) -> IndexPath? {
        guard let index else { return nil }
        return IndexPath(item: index, section: 0)
    }
    
    private func scrollToItem(with indexPath: IndexPath?) {
        guard let indexPath else { return }
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func getImage(with indexPath: IndexPath?) -> UIImage? {
        guard let indexPath else { return nil }
        let item = weatherConditions[indexPath.item]
        let imageName = item.imageName
        return UIImage(named: imageName)
    }
    
    func nextCondition(_ indexPath: IndexPath) {
        let image = getImage(with: indexPath)
        conditionalImageView.setImage(with: image)
        
        scrollToItem(with: indexPath)
    }
    
}
