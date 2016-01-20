//
//  Asset.swift
//  WireStorm
//
//  Created by Zhang Yi on 21/1/2016.
//
//

import Foundation
import SwiftyJSON

protocol AssetType{
    var name:String { get }
    var position:String { get }
    var smallpicURL:NSURL? { get }
    var largepicURL:NSURL? { get }
}

struct Asset {
    let name:String
    let position:String
    let smallpicURL:NSURL?
    let largepicURL:NSURL?
    
    
    // Initializer
    init (json:JSON){
        name = json["name"].stringValue
        position = json["position"].stringValue
        smallpicURL = NSURL(string: json["smallpic"].stringValue)
        largepicURL = NSURL(string: json["lrgpic"].stringValue)
    }
}

extension Asset:AssetType { }