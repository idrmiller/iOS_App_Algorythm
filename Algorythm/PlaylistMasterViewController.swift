//
//  ViewController.swift
//  Algorythm
//
//  Created by David Miller on 3/23/15.
//  Copyright (c) 2015 David Miller. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {

   
    var playlistArray: [UIImageView] = []
    
    /* --- We had a button initially but removed it to add gestures. --> @IBOutlet weak var aButton: UIButton!
    */

    @IBOutlet weak var playlistimageView0: UIImageView!
    
    @IBOutlet weak var playlistimageView1: UIImageView!
    
    @IBOutlet weak var playlistimageView2: UIImageView!
    
    @IBOutlet weak var playlistimageView3: UIImageView!
    
    @IBOutlet weak var playlistimageView4: UIImageView!
    
    @IBOutlet weak var playlistimageView5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //We load the Array here because we want to make sure it loads.
        playlistArray += [playlistimageView0, playlistimageView1, playlistimageView2,
            playlistimageView3,
            playlistimageView4,
            playlistimageView5]
        
        for index in 0..<playlistArray.count {
            let playlist = Playlist(index: index)
            let playlistImageView = playlistArray[index]
            
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
            
        }
        
       
        
        /* --- here is the other refrence to the button we removed to implement the gestures capability. --> aButton.setTitle("Press me!", forState: UIControlState.Normal)
        */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" {
            
            let playlistImageView = sender!.view as! UIImageView
            //determines which playlist was selected to send to image controll.
            
            if let index = find(playlistArray, playlistImageView) {
                
                let playlistDetailController = segue.destinationViewController as! PlaylistDetailViewControlViewController
                playlistDetailController.playlist = Playlist(index: index)
                
            }
            
            
            
            
        }
    }
    
    @IBAction func showPlaylistDetail(sender: AnyObject) {
        
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
        
        
    }
    

}

