//
//  CityListView.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import UIKit

public class CityListView: UIViewController {

    var cityWeatherViewDelegate: ModalDelegate?
    var selectedCityID: Int = 0
    
    let cityList: [[Int: String]] = [[839722: "Sofia"], [2459115: "NY"], [1118370: "Tokyo"]]
    
    @IBOutlet weak var cityListTableView: UITableView!
    
    
    public init() {
        super.init(nibName: "CityListView", bundle: Bundle(for: CityListView.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.cityListTableView.delegate = self
        self.cityListTableView.dataSource = self
        
        self.cityListTableView.reloadData()
    }
}

extension CityListView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: .default, reuseIdentifier: "cityCell")
        cell.selectionStyle = .none
        cell.textLabel?.text = cityList[indexPath.row].values.first
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCityID = cityList[indexPath.row].keys.first ?? 0
        cityWeatherViewDelegate?.changeCity(value: self.selectedCityID)
        self.dismiss(animated: true, completion: nil)
    }
    
}
