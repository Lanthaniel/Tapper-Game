//
//  ViewController.swift
//  tapper-game
//
//  Created by Nate on 4/25/16.
//  Copyright © 2016 Karabensh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //main menu outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt:UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    //game outlets
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            //hide the main menu
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            //load the game screen
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            //set up game counter
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            //display number of taps
            updateTapsLbl()
        }
    }

    
    @IBAction func onCoinTapped(sender: UIButton!) {
        //increase current taps
        currentTaps += 1
        
        //display number of taps
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }

}

