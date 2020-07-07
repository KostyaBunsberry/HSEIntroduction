//
//  DataViewController.swift
//  HSEIntroduction
//
//  Created by Kostya Bunsberry on 07.07.2020.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var emojiImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var emojiImage: UIImage?
    var headlineLabelText: String?
    var descriptionLabelText: String?
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headlineLabel.text = headlineLabelText
        descriptionLabel.text = descriptionLabelText
        emojiImageView.image = emojiImage
    }
}
