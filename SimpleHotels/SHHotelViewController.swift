//
//  SHHotelViewController.swift
//  SimpleHotels
//
//  Created by Najmul Hasan on 11/7/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import UIKit

class SHHotelViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    
    @IBOutlet weak var topContentsView: UIView!
    @IBOutlet weak var bottomContentsView: UIView!
    @IBOutlet weak var floatRatingView: FloatRatingView!
    
    public var hotel = [String : AnyObject]()
    let baseUrl = "https://media.expedia.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = hotel ["hotelName"] as? String
        let rate = hotel ["lowRate"] as! String
        let currency = hotel ["rateCurrencyCode"] as! String
        priceLabel.text = String.init(format: "\(rate) \(currency)")
        detailsLabel.text = hotel ["hotelDescription"] as? String
        
        let fullUrl = String.init(format: "\(baseUrl)\(hotel ["largeThumbnailUrl"] as! String)")
        hotelImage.loadImageFrom(link: fullUrl, withPlaceHolder: UIImage.init(named: "placeholder.jpg")!)
        
        topContentsView.layer.cornerRadius = 20.0
        bottomContentsView.layer.cornerRadius = 20.0
        mapButton.layer.cornerRadius = mapButton.frame.size.height/2
        
        topContentsView.backgroundColor = UIColor.init(white: 0.0, alpha: 0.4)
        bottomContentsView.backgroundColor = UIColor.init(white: 0.0, alpha: 0.4)
        
        // Reset float rating view's background color
        floatRatingView.backgroundColor = UIColor.clear
        
        /** Note: With the exception of contentMode, type and delegate,
         all properties can be set directly in Interface Builder **/
        floatRatingView.contentMode = UIViewContentMode.scaleAspectFit
        floatRatingView.type = .halfRatings
        
        let rating:String = (hotel ["hotelStarRating"] as? String)!
        floatRatingView.rating = Double(rating)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller: SHMapViewController = segue.destination as! SHMapViewController
        controller.latitude = hotel ["latitude"] as! String;
        controller.longitude = hotel ["longitude"] as! String;
    }
}
