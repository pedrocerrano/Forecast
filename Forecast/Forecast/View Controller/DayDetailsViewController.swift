//
//  DayDetailsViewController.swift
//  Forecast
//
//  Created by Karl Pfister on 1/31/22.
//

import UIKit

class DayDetailsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var dayForecastTableView: UITableView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentHighLabel: UILabel!
    @IBOutlet weak var currentLowLabel: UILabel!
    @IBOutlet weak var currentDescriptionLabel: UILabel!
    
    //MARK: - Properties
   
    //MARK: - View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayForecastTableView.dataSource = self
        dayForecastTableView.delegate = self
    }
    
    func updateViews() {
        
    }
    
}// End of class

//MARK: - Extenstions
extension DayDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        return cell
    }
}// End of extension
