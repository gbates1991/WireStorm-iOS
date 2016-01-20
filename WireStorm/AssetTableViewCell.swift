//
//  AssetTableViewCell.swift
//  WireStorm
//
//  Created by Zhang Yi on 21/1/2016.
//
//

import UIKit
import SDWebImage

class AssetTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var asset:AssetType?{
        didSet{
            setupCell()
        }
    }
    
    func setupCell(){
        guard let asset = asset else {
            return
        }
        
        textLabel?.text = asset.name
        detailTextLabel?.text = asset.position
        
        if let url = asset.smallpicURL {
            imageView?.sd_setImageWithURL(url, placeholderImage: UIImage(named: "ic_placeholder"))
        }
    }
}
