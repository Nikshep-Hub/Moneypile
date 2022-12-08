//
//  ViewController.swift
//  Final_Nikshep
//
//  Created by Nikshep Bikkumalla on 7/17/22.
//

import UIKit

class ViewController: UIViewController {
    //variables to keep track of
    var money = 0
    var array = [-1, -1, -1, -1, -1, -1]
    var numberOfButtons = 0 //count number of buttons that have been selected
    
    //outlets
    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    //functions
    //function to generate random numbers
    func generateRandomNum()
    {
       
        //check for duplicate generated numbers
        let t = 6
        
        //check if any of the array elements are the same
        while array[0] == array[1] || array[0] == array[2] || array[0] == array[3] || array[0] == array[4] || array[0] == array[5] || array[1] == array[2] || array[1] == array[3] || array[1] == array[4] || array[1] == array[5] || array[2] == array[3] || array[2] == array[4] || array[2] == array[5] || array[3] == array[4] || array[3] == array[5] || array[4] == array[5]
        {
            //if they are change them all until you get it right
            array[0] = (Int(arc4random()) % t) * 1000
            array[1] = (Int(arc4random()) % t) * 1000
            array[2] = (Int(arc4random()) % t) * 1000
            array[3] = (Int(arc4random()) % t) * 1000
            array[4] = (Int(arc4random()) % t) * 1000
            array[5] = (Int(arc4random()) % t) * 1000
        }
    }
    
    //function to reset the game
    func resetBoard()
    {
        array = [-1, -1, -1, -1, -1, -1]
        generateRandomNum()
        button1.setBackgroundImage(UIImage(named: "moneypile.png"), for:
            UIControl.State.normal)
        button1.setTitle("", for: UIControl.State.normal)
        button2.setBackgroundImage(UIImage(named: "moneypile.png"), for:
            UIControl.State.normal)
        button2.setTitle("", for: UIControl.State.normal)
        button3.setBackgroundImage(UIImage(named: "moneypile.png"), for:
            UIControl.State.normal)
        button3.setTitle("", for: UIControl.State.normal)
        button4.setBackgroundImage(UIImage(named: "moneypile.png"), for:
            UIControl.State.normal)
        button4.setTitle("", for: UIControl.State.normal)
        button5.setBackgroundImage(UIImage(named: "moneypile.png"), for:
            UIControl.State.normal)
        button5.setTitle("", for: UIControl.State.normal)
        button6.setBackgroundImage(UIImage(named: "moneypile.png"), for:
            UIControl.State.normal)
        button6.setTitle("", for: UIControl.State.normal)
        numberOfButtons = 0
        money = 0
    }
    
    
    //function to stop and initaiate new alert after 2 buttons
    func buttonsIsTwo()
    {
        let alertController = UIAlertController(title: "Congratulations!",
                                                    message: "You've got \(money) dollars!",
                preferredStyle: UIAlertController.Style.alert)
            
            // configure buttons and add them into the alert object
        let exitAction = UIAlertAction(title: "Exit",
                                           style: UIAlertAction.Style.default,
                                           handler: {(alertAction: UIAlertAction!) in
                                            self.outputLbl.text = "You've got \(self.money) dollars!"})
        
        let playAgainAction = UIAlertAction(title: "Play Again",
                                                style: UIAlertAction.Style.default,
                                                handler: {(alertAction: UIAlertAction!) in
                                                    self.outputLbl.text = "You've got \(self.money) dollars!"})
        alertController.addAction(exitAction)
        alertController.addAction(playAgainAction)
            
            // display the alert window
        present(alertController, animated: true, completion: nil)
            

        if playAgainAction.isEnabled //see if playAgain was chosen
        {
            resetBoard() //reset board
        }
        else //if not exit was chosen
        {
            numberOfButtons = 0
            money = 0
            exit(0) //exit application
        }
    }

    //actions
    //help button
    @IBAction func doHelp(_ sender: UIButton) {
        //message in help button that will be displayed to user
        let alertController = UIAlertController(title: "How To Play",
                                                message: "Click any two moneypiles to earn money",
                                                preferredStyle: UIAlertController.Style.alert)
        
        //button for user to click when done with help button
        let defaultAction = UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil)
        alertController.addAction(defaultAction)
        
        //present the display to the user
        present(alertController, animated: true, completion: nil)
    }

    //for button1
    @IBAction func doButton1(_ sender: UIButton) {
        numberOfButtons = numberOfButtons + 1
        if numberOfButtons <= 3
        {
            button1.setBackgroundImage(nil, for: UIControl.State.normal)
            sender.setTitle("\(array[0])", for: UIControl.State.normal)
            money = money + array[0]
            outputLbl.text = "You've got \(money) dollars!"
            numberOfButtons = numberOfButtons + 1
        }
        
        if numberOfButtons > 3
        {
            buttonsIsTwo()
        }
    }
    
    //for button2
    @IBAction func doButton2(_ sender: UIButton) {
        numberOfButtons = numberOfButtons + 1
        if numberOfButtons <= 3
        {
            button2.setBackgroundImage(nil, for: UIControl.State.normal)
            sender.setTitle("\(array[1])", for: UIControl.State.normal)
            money = money + array[1]
            outputLbl.text = "You've got \(money) dollars!"
            numberOfButtons = numberOfButtons + 1
        }
        
        if numberOfButtons > 3
        {
            buttonsIsTwo()
        }
    }
    
    //for button3
    @IBAction func doButton3(_ sender: UIButton) {
        numberOfButtons = numberOfButtons + 1
        if numberOfButtons <= 3
        {
            button3.setBackgroundImage(nil, for: UIControl.State.normal)
            sender.setTitle("\(array[2])", for: UIControl.State.normal)
            money = money + array[2]
            outputLbl.text = "You've got \(money) dollars!"
            numberOfButtons = numberOfButtons + 1
        }

        if numberOfButtons > 3
        {
            buttonsIsTwo()
        }
    }
    
    //for button4
    @IBAction func doButton4(_ sender: UIButton) {
        numberOfButtons = numberOfButtons + 1
        if numberOfButtons <= 3
        {
            button4.setBackgroundImage(nil, for: UIControl.State.normal)
            sender.setTitle("\(array[3])", for: UIControl.State.normal)
            money = money + array[3]
            outputLbl.text = "You've got \(money) dollars!"
            numberOfButtons = numberOfButtons + 1
        }
        
        if numberOfButtons > 3
        {
            buttonsIsTwo()
        }
    }
    
    
    //for button 5
    @IBAction func doButton5(_ sender: UIButton) {
        numberOfButtons = numberOfButtons + 1
        if numberOfButtons <= 3
        {
            button5.setBackgroundImage(nil, for: UIControl.State.normal)
            sender.setTitle("\(array[4])", for: UIControl.State.normal)
            money = money + array[4]
            outputLbl.text = "You've got \(money) dollars!"
            numberOfButtons = numberOfButtons + 1
        }

        if numberOfButtons > 3
        {
            buttonsIsTwo()
        }
    }
    
    //for button 6
    @IBAction func doButton6(_ sender: UIButton) {
        numberOfButtons = numberOfButtons + 1
        if numberOfButtons <= 3
        {
            button6.setBackgroundImage(nil, for: UIControl.State.normal)
            sender.setTitle("\(array[5])", for: UIControl.State.normal)
            money = money + array[5]
            outputLbl.text = "You've got \(money) dollars!"
            numberOfButtons = numberOfButtons + 1
        }

        if numberOfButtons > 3
        {
            buttonsIsTwo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //defaults
        generateRandomNum()
    }
}
