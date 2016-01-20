//
//  ImageViewController.swift
//  WireStorm
//
//  Created by Zhang Yi on 21/1/2016.
//
//

import UIKit

class ImageViewController: UIViewController {

    var asset:AssetType! //Parameter from server
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = asset.largepicURL {
            imageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "ic_placeholder"))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
