//
//  ImageViewController.swift
//  TestNASAClient
//
//  Created by Raghu, Reshma L on 26/02/21.
//

import UIKit
import NASAImageLibrary

class ImageViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    var imageModel: ImageModel?
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        NASAImageLibraryClient.fetchImage(imageModel: self.imageModel!) { (data, error) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }
    }
}
