//
//  SecondViewController.swift
//  barakah
//
//  Created by Naufal on 5/18/15.
//  Copyright (c) 2015 snapsell. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var Properties: UIButton!
    @IBOutlet weak var games: UIButton!
    @IBOutlet weak var electronics: UIButton!
    @IBOutlet weak var Vehicles: UIButton!
    @IBOutlet weak var Accessories: UIButton!
    
    @IBOutlet weak var searchTitle: UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var pass:SearchResultView = segue.destinationViewController as! SearchResultView
        if(segue.identifier == "elec"){
            if(searchTitle?.text != nil){
                pass.tit = searchTitle?.text
            }
            pass.received = electronics.titleLabel!.text!
        }
        else if(segue.identifier == "game"){
            if(searchTitle?.text != nil){
                pass.tit = searchTitle?.text
            }
            pass.received = games.titleLabel!.text!
        }
        else if(segue.identifier == "acc"){
            if(searchTitle?.text != nil){
                pass.tit = searchTitle?.text
            }
            pass.received = Accessories.titleLabel!.text!
        }
        else if(segue.identifier == "veh"){
            if(searchTitle?.text != nil){
                pass.tit = searchTitle?.text
            }
            pass.received = Vehicles.titleLabel!.text!
        }
        else if(segue.identifier == "prop"){
            if(searchTitle?.text != nil){
                pass.tit = searchTitle?.text
            }
            pass.received = Properties.titleLabel!.text!
        }
    }

}

