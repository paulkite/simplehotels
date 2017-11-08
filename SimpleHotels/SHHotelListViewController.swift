//
//  SHHotelListViewController.swift
//  SimpleHotels
//
//  Created by Najmul Hasan on 11/7/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import UIKit

class SHHotelListViewController: UIViewController {

    var defaultSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    var dataTask: URLSessionDataTask?
    
    var hotels = [AnyObject]()
    let urls = ["https://techblog.expedia.com/utility/san-francisco-hotels.json",
                "https://techblog.expedia.com/utility/chicago-hotels.json"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.reloadData()
        self.tableView.setContentOffset(CGPoint.zero, animated: false)
        
        fetchHotelData(for: urls[0])
    }
    
    @IBAction func segmentedValuChanged(sender: Any?){
    
        let segmentControl = sender as! UISegmentedControl
        fetchHotelData(for: urls[segmentControl.selectedSegmentIndex])
    }
    
    func fetchHotelData(for city: String ){
    
        if dataTask != nil {
            dataTask?.cancel()
        }
        // enable the network indicator on the status bar to indicate to the user that a network process is running
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL(string: city)
        // from the session you created, you initialize a URLSessionDataTask to handle the HTTP GET request.
        // the constructor of URLSessionDataTask takes in the URL that you constructed along with a completion handler to be called when the data task completed
        dataTask = defaultSession.dataTask(with: url!) {
            data, response, error in
            // invoke the UI update in the main thread and hide the activity indicator to show that the task is completed
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            // if HTTP request is successful you call updateSearchResults(_:) which parses the response NSData into Tracks and updates the table view
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.loadHotelsWithData(data)
                }
            }
        }
        // all tasks start in a suspended state by default, calling resume() starts the data task
        dataTask?.resume()
    }
    
    // This helper method helps parse response JSON NSData into an array of Track objects.
    func loadHotelsWithData(_ data: Data?) {
        hotels.removeAll()
        do {
            if let data = data, let response = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions(rawValue:0)) as? [String: AnyObject] {
                // Get the results array
                if let array: AnyObject = response["hotels"] {
                    hotels = array as! [AnyObject]
                } else {
                    print("Results key not found in dictionary")
                }
            } else {
                print("JSON Error")
            }
        } catch let error as NSError {
            print("Error parsing results: \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.setContentOffset(CGPoint.zero, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let  indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        let controller: SHHotelViewController = segue.destination as! SHHotelViewController
        controller.hotel = hotels[(indexPath?.row)!] as! [String : AnyObject]
    }
}

// MARK: UITableViewDataSource

extension SHHotelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SHHotelCell", for: indexPath) as!SHHotelCell
        
        let hotel = hotels [indexPath.row]
        
        // Configure title and artist labels
        cell.nameLabel.text = hotel ["hotelName"] as? String
        
        let rate = hotel ["lowRate"] as! String
        let currency = hotel ["rateCurrencyCode"] as! String
        cell.priceLabel.text = String.init(format: "\(rate) \(currency)")
        cell.thumbnailView?.loadImageFrom(link: (hotel ["thumbnailUrl"] as? String)!, withPlaceHolder: UIImage.init(named: "hotel_icon.png")!)
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension SHHotelListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
