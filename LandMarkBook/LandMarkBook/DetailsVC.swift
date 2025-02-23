//
//  DetailsVC.swift
//  LandMarkBook
//
//  Created by Muratcan Gebeş on 22.02.2025.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLabel.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage
    }
    

}
