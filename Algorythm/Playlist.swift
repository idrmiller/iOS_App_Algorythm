//
//  Playlist.swift
//  Algorythm
//
//  Created by David Miller on 3/27/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import Foundation
import UIKit


struct Playlist {
    
    var title: String?
    var description: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    //Using the index to refrence each dictionary, helps obtain the data from the music library
    // Would not use this for product implementation. Because we wouldn't know the structure before hand
    //  if we were calling the data from a website or API.
    
    //  When the playlistDictionary["title"] returns the item is set as any object, so we need to cast it to a string. Then we need to unwrapp the optional. Need to be carefule unwrapping, because it needs to exist before unwrapping.
    
    init(index: Int) {
        let musicLibrary = MusicLibrary().library
        let playlistDictionary = musicLibrary[index]
        
        title = playlistDictionary["title"] as! String!
        description = playlistDictionary["description"] as! String!
        
        let iconName = playlistDictionary["icon"] as! String!
        icon = UIImage(named: iconName)
        
        let largeIconName = playlistDictionary["largeIcon"] as! String!
        largeIcon = UIImage(named: largeIconName)
        
        //Join two arrays with similar content. storing artist name as an array, first save name to array and then send it to a an array string
        // artists = artists [] + playlistDictionary["artists"] as [String]

        artists += playlistDictionary["artists"] as! [String]
        
        
        let colorsDictionary = playlistDictionary["backgroundColor"] as! [String: CGFloat]
        backgroundColor = rgbColorFromDictionary(colorsDictionary)
        
        
        
        
        
    }
    
    // need to get the color from the MusicLibrary dictionary
    // need to use CGFloat because the color object uses CGFloat
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        // we do color/255.0 so that the number can between 0 and 1
    }
    
    
    
    
    
    
    
}











