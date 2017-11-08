//
//  UIImage+Lazy.swift
//  SimpleHotels
//
//  Created by Najmul Hasan on 11/7/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFrom(link _link:String, withPlaceHolder _image: UIImage) {
        self.image = _image
        URLSession.shared.dataTask( with: NSURL(string:_link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async() {
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
