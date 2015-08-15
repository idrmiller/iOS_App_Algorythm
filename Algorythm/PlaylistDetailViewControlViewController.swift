//
//  PlaylistDetailViewControlViewController.swift
//  Algorythm
//
//  Created by David Miller on 3/24/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import UIKit

class PlaylistDetailViewControlViewController: UIViewController {

    
    
     //we make the Playlist! optional because we are unsure, which playlist will be sent to the seque.
    // This playlist also alows us to create a Playlist instance for us to use in our code.
    var playlist: Playlist?
    
    @IBOutlet weak var playListCoverImage: UIImageView!
    @IBOutlet weak var playListTitle: UILabel!
    @IBOutlet weak var playListDescription: UILabel!

    @IBOutlet weak var playlistArtist0: UILabel!
    @IBOutlet weak var playlistArtist1: UILabel!
    @IBOutlet weak var playlistArtist2: UILabel!
    @IBOutlet weak var playlistArtist3: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // This was a placeholder we removed --> buttonPressLabel.text = playlist?.title
        
        // We are going to use the outlets we just added to display the information. @IBOutlets playListCoverImage and the 2 below.
        
        if playlist != nil {
            
            playListCoverImage.image = playlist!.largeIcon
            playListCoverImage.backgroundColor = playlist!.backgroundColor
            playListTitle.text = playlist!.title
            playListDescription.text = playlist!.description
            
        }
        
        
        /*  In this next section: we will select the artist name from 
            the playlist. We will grab the artist out of the array using
            the first index values.
        */
        
        playlistArtist0.text = playlist!.artists[0]
        playlistArtist1.text = playlist!.artists[1]
        playlistArtist2.text = playlist!.artists[2]
        playlistArtist3.text = playlist!.artists[3]
    
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
