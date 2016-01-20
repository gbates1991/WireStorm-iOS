//
//  AssetsListTableVC.swift
//  WireStorm
//
//  Created by Zhang Yi on 21/1/2016.
//
//

import UIKit

class AssetsListTableVC: UITableViewController {
    
    var assets:[AssetType] = []{
        // When assets are set, re-load table view controller
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension

        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        APIManager.getAssets{ assets, error in
            hud.hide(true)
            guard let assets = assets where error == nil else {
                let alertVC = UIAlertController(title: nil, message: "Error occured.", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                alertVC.addAction(action)
                self.presentViewController(alertVC, animated: true, completion: nil)
                return
            }
            self.assets = assets
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: UITableViewDataSource
extension AssetsListTableVC{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifierAsset, forIndexPath: indexPath) as! AssetTableViewCell
        
        // Configure the cell...
        cell.asset = assets[indexPath.row]
        return cell
    }
}

// MARK: - UITableView Delegate
extension AssetsListTableVC{
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let asset = assets[indexPath.row]
        
        // Don't like to use storyboard segue.
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(kStoryboardIdImageViewScreen) as? ImageViewController{
            vc.asset = asset
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

