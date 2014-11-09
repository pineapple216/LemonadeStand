//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Koen Hendriks on 09/11/14.
//  Copyright (c) 2014 Koen Hendriks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fundsLabel: UILabel!
    @IBOutlet weak var lemonsLabel: UILabel!
    @IBOutlet weak var iceCubesLabel: UILabel!
    
    @IBOutlet weak var addedLemonsLabel: UILabel!
    @IBOutlet weak var addedIceCubesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions - Start Day Button
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
    }
    
    
    // MARK: IBActions - Purchasing
    
    @IBAction func purchaseLemonsButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unpurchaseLemonsButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func purchaseIceCubesButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func unpurchaseIceCubesButtonPressed(sender: AnyObject) {
    }
    
    // MARK: IBActions - Mixing
    
    @IBAction func addLemonsButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func removeLemonsButtonPressed(sender: AnyObject) {
    }

    @IBAction func addIceCubesButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func removeIceCubesButtonPressed(sender: AnyObject) {
    }
    
    
}





