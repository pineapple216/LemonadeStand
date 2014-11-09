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
    
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    
    @IBOutlet weak var addedLemonsLabel: UILabel!
    @IBOutlet weak var addedIceCubesLabel: UILabel!
    
    // Instantiate the supplies and prices structs
    var supplies = Supplies(aMoney: 10, aLemons: 1, aiceCubes: 1)
    var prices = Prices()
    
    // Variables to keep track of the amount of lemons and iceCubes the user purchased and wants to add to the lemonade
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
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
        let customers = Int(arc4random_uniform(UInt32(11)))
        println("customers: \(customers)")
        
        if lemonsToMix == 0 || iceCubesToMix == 0 {
            showAlertWithText(message: "You need to add at least 1 Lemon and 1 Ice Cube")
        }
        else {
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
        
            for x in 0...customers{
                let preference = Double(arc4random_uniform(UInt32(101))) / 100
                
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else {
                    println("else statement evaluating")
                }
            }
            
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            
            updateMainView()
        }
    }


    // MARK: IBActions - Purchasing
    
    @IBAction func purchaseLemonsButtonPressed(sender: AnyObject) {
        // Check is the user has enough funds to purchase a lemon, if not, display a warning
        if supplies.money < prices.lemon{
            showAlertWithText(message: "Not enough funds available to purchase a lemon")
        }
        else{
            lemonsToPurchase += 1
            supplies.money -= prices.lemon
            supplies.lemons += 1
            updateMainView()
        }
    }
    
    @IBAction func unpurchaseLemonsButtonPressed(sender: AnyObject) {
        if lemonsToPurchase <= 0{
            showAlertWithText(message: "You don't have any lemons to return")
        }
        else{
            lemonsToPurchase -= 1
            supplies.money += prices.lemon
            supplies.lemons -= 1
            updateMainView()
        }
    }
    
    @IBAction func purchaseIceCubesButtonPressed(sender: AnyObject) {
        if supplies.money < prices.iceCube{
            showAlertWithText(message: "Not enough funds available to purchase an ice cube")
        }
        else{
            iceCubesToPurchase += 1
            supplies.money -= prices.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
    }
    
    @IBAction func unpurchaseIceCubesButtonPressed(sender: AnyObject) {
        if iceCubesToPurchase <= 0{
            showAlertWithText(message: "You don't have any ice cubes to return")
        }
        else{
            iceCubesToPurchase -= 1
            supplies.money += prices.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        }
    }
    
    // MARK: IBActions - Mixing
    
    @IBAction func addLemonsButtonPressed(sender: AnyObject) {
        if supplies.lemons <= 0{
            showAlertWithText(message: "You don't have any lemons, buy some first.")
        }
        else{
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        }
    }
    
    @IBAction func removeLemonsButtonPressed(sender: AnyObject) {
        if lemonsToMix <= 0{
            showAlertWithText(message: "You can't remove any lemons from the mixture")
        }
        else{
            lemonsToPurchase = 0
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        }
    }

    @IBAction func addIceCubesButtonPressed(sender: AnyObject) {
        if supplies.iceCubes <= 0{
            showAlertWithText(message: "You don't have any ice cubes, buy some first")
        }
        else{
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        }
    }
    
    @IBAction func removeIceCubesButtonPressed(sender: AnyObject) {
        if iceCubesToMix <= 0{
            showAlertWithText(message: "You can't remove any ice cubes from the mixture")
        }
        else{
            iceCubesToPurchase = 0
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        }
    }
    
    // MARK: IBActions - Helper Methods
    
    func updateMainView(){
        self.fundsLabel.text = "$ \(supplies.money)"
        self.lemonsLabel.text = "\(supplies.lemons) Lemons"
        self.iceCubesLabel.text = "\(supplies.iceCubes) Ice Cubes"
        
        self.lemonsToPurchaseLabel.text = "\(lemonsToPurchase)"
        self.iceCubesToPurchaseLabel.text = "\(iceCubesToPurchase)"
        
        self.addedLemonsLabel.text = "\(lemonsToMix)"
        self.addedIceCubesLabel.text = "\(iceCubesToMix)"
    }
    
    func showAlertWithText(header: String = "Warning", message: String){
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}





