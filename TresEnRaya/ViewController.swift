//
//  ViewController.swift
//  TresEnRaya
//
//  Created by Alexis Araujo on 6/15/16.
//  Copyright © 2016 Alexis Araujo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1 are noughts and 2 cross
    var activePlayer = 1
    var gameState = [Int](count:9, repeatedValue: 0)
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameActive = true
    var empate = 1
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        activePlayer = 1
        gameActive = true
        gameState = [Int](count:9, repeatedValue: 0)
        empate = 1
        
        for i in 0 ..< 9 {
            var button: UIButton
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        hideGameOver()
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        empate += 1
        var image = UIImage()
        if gameState[sender.tag] == 0 && gameActive == true{

            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1{
                image = UIImage(named: "nought.png")!
                activePlayer = 2
            }
            else {
                image = UIImage(named: "cross.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations{
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{

                gameActive = false
                if gameState[sender.tag] == 1 {
                    gameOverLabel.text = "¡Los circulos ganan!"
                    }
                    else {
                        gameOverLabel.text = "¡Las cruces ganan!"
                    }
                gameOverLabel.hidden = false
                playAgainButton.hidden = false
                UIView.animateWithDuration(0.5, animations: {
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                })
                }
            }
       }
        //Solucionar la solucion al empate sin ganador
        if empate == 10 {
            playAgainButton.hidden = false
            UIView.animateWithDuration(0.5, animations: {
                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
            })

        }
    }
    

    
    func hideGameOver(){
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideGameOver()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

