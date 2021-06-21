//
//  CityWeatherView+CollectionView.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import UIKit

extension CityWeatherView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCell.cellIdentifier, for: indexPath) as? WeatherCell
        cell?.configCell(with: self.cityWeatherVM.cityWeatherResultEntity?.consolidated_weather?[indexPath.row + 1])
        return cell ?? UICollectionViewCell()
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
        }
}
