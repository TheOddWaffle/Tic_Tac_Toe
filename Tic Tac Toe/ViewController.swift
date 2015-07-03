//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Kenny on 7/2/15.
//  Copyright © 2015 EGGROLLS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var backGroundView: UIImageView!
    @IBOutlet var button1: UILabel!
    @IBOutlet var button2: UILabel!
    @IBOutlet var button3: UILabel!
    @IBOutlet var button4: UILabel!
    @IBOutlet var button5: UILabel!
    @IBOutlet var button6: UILabel!
    @IBOutlet var button7: UILabel!
    @IBOutlet var button8: UILabel!
    @IBOutlet var button9: UILabel!
    
    var labelArray : [UILabel]!
    var turnCounter = 0
    var resetCounter = 1
    
    @IBAction func buttonTapped(sender: UITapGestureRecognizer) {
        print("screen tapped")
        
        for button in labelArray{
            if CGRectContainsPoint(button.frame, sender.locationInView(backGroundView)){
                button.hidden = false
                if turnCounter % 2 == 0 && turnCounter < 8{
                    button.text = "X"
                    turnCounter = turnCounter + 1
                    winCheck()
                }
                    
                else if  turnCounter % 2 == 1 && turnCounter < 8{
                    button.text = "O"
                    turnCounter = turnCounter + 1
                    winCheck()
                }
                    
                else {
                    print("tie game")
                    let message = "Play Again?"
                    let alert = UIAlertController(title:  "Tie Game", message: message, preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
                    self.presentViewController(alert,animated: true, completion: nil)
                    resetGame()
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelArray = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
    }
    func winCheck () {
        if button1.text! == button2.text! && button2.text! == button3.text! {
            print("win")
            winMessage(button1.text!)
        }
        else if button4.text! == button5.text! && button5.text! == button6.text! && button4.text! != ""{
            print("win")
            winMessage(button4.text!)
        }
        else if button7.text! == button8.text! && button8.text! == button9.text! && button7.text! != ""{
            print("win")
            winMessage(button7.text!)
        }
        else if button1.text! == button4.text! && button7.text! == button4.text! && button1.text! != ""{
            print("win")
            winMessage(button1.text!)
        }
        else if button2.text! == button5.text! && button5.text! == button8.text! && button2.text! != ""{
            print("win")
            winMessage(button2.text!)
        }
        else if button3.text! == button6.text! && button6.text! == button9.text! && button3.text! != ""{
            print("win")
            winMessage(button3.text!)
        }
        else if button1.text! == button5.text! && button5.text! == button9.text! && button1.text! != ""{
            print("win")
            winMessage(button1.text!)
        }
        else if button7.text! == button5.text! && button5.text! == button3.text! && button7.text! != ""{
            print("win")
            winMessage(button7.text!)
        }
    }
    func winMessage(winner : String) {
        
        let message = "Play Again?"
        let alert = UIAlertController(title:  "\(winner) Wins", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: nil))
        self.presentViewController(alert,animated: true, completion: nil)
        resetGame()
    }
    
    func resetGame() {
        turnCounter = 0
        for button in labelArray{
            button.text = String(resetCounter)
            print(resetCounter)
            resetCounter = resetCounter + 1
            
            print(button.text)
            button.hidden = true
        }
    }

}

