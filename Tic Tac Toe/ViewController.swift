//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by George Drag on 7/12/14.
//  Copyright (c) 2014 George Drag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Image1 : UIImageView = nil
    @IBOutlet var Image2 : UIImageView = nil
    @IBOutlet var Image3 : UIImageView = nil
    @IBOutlet var Image4 : UIImageView = nil
    @IBOutlet var Image5 : UIImageView = nil
    @IBOutlet var Image6 : UIImageView = nil
    @IBOutlet var Image7 : UIImageView = nil
    @IBOutlet var Image8 : UIImageView = nil
    @IBOutlet var Image9 : UIImageView = nil
    
    @IBOutlet var Button1 : UIButton = nil
    @IBOutlet var Button2 : UIButton = nil
    @IBOutlet var Button3 : UIButton = nil
    @IBOutlet var Button4 : UIButton = nil
    @IBOutlet var Button5 : UIButton = nil
    @IBOutlet var Button6 : UIButton = nil
    @IBOutlet var Button7 : UIButton = nil
    @IBOutlet var Button8 : UIButton = nil
    @IBOutlet var Button9 : UIButton = nil
    
    @IBOutlet var Reset : UIButton = nil
    
    @IBOutlet var Message : UILabel = nil
    
    var Board = [1:2,2:2,3:2,4:2,5:2,6:2,7:2,8:2,9:2]
    var turn = 1
    var done = false
    var aiDeciding = false
    
    
    @IBAction func ButtonClicked(sender:UIButton){
        Message.hidden = true
        
        if Board[sender.tag]==2 && !aiDeciding && !done {
            var player = (turn % 2)==0 ? 2 : 1
            Go(sender.tag, player: player)
            aiTurn(player)
        }
        
    }
    
    
    func Go(spot:Int, player:Int){
        var p = (turn % 2)==0 ? 2 : 1
        setImageForSpot(spot, player:p)
        
        if(p==1) {
            Board[spot]=3
        }
        else {
            Board[spot]=5
        }
        checkForWin()
        turn++
        
    }
    
    func setImageForSpot(spot:Int, player:Int){
        var playerMark = player == 1 ? "x" : "o"
        Board[spot] = player == 1 ? 3 : 5
        switch spot {
        case 1:
            Image1.image = UIImage(named: playerMark)
        case 2:
            Image2.image = UIImage(named: playerMark)
        case 3:
            Image3.image = UIImage(named: playerMark)
        case 4:
            Image4.image = UIImage(named: playerMark)
        case 5:
            Image5.image = UIImage(named: playerMark)
        case 6:
            Image6.image = UIImage(named: playerMark)
        case 7:
            Image7.image = UIImage(named: playerMark)
        case 8:
            Image8.image = UIImage(named: playerMark)
        default :
            Image9.image = UIImage(named: playerMark)
        }
        
    }
    
    func make2() -> Int{
        if (Board[5]==2){
            return 5
        }
        
        if (Board[2]==2){
            return 2
        }
        else if (Board[4]==2){
            return 4
        }
        else if (Board[6]==2){
            return 6
        }
        else if (Board[8]==2){
            return 8
        }
        return 0
    }
    
    
    func Posswin() -> Int{
        let b1 = Board[1]
        let b2 = Board[2]
        let b3 = Board[3]
        let b4 = Board[4]
        let b5 = Board[5]
        let b6 = Board[6]
        let b7 = Board[7]
        let b8 = Board[8]
        let b9 = Board[9]
        
        if(b1! * b2! * b3! == 18 || b1! * b2! * b3! == 50) {
            if(b1==2){
                return 1
            }
            if(b2==2){
                return 2
            }
            if(b3==2){
                return 3
            }
        }
        else if(b4! * b5! * b6! == 18 || b4! * b5! * b6! == 50) {
            if(b4==2){
                return 4
            }
            if(b5==2){
                return 5
            }
            if(b6==2){
                return 6
            }
        }
        else if(b7! * b8! * b9! == 18 || b7! * b8! * b9! == 50) {
            if(b7==2){
                return 7
            }
            if(b8==2){
                return 8
            }
            if(b9==2){
                return 9
            }
            
        }
            
        else if(b1! * b4! * b7! == 18 || b1! * b4! * b7! == 50) {
            if(b1==2){
                return 1
            }
            if(b4==2){
                return 4
            }
            if(b7==2){
                return 7
            }
        }
            
        else if(b2! * b5! * b8! == 18 || b2! * b5! * b8! == 50) {
            if(b2==2){
                return 2
            }
            if(b5==2){
                return 5
            }
            if(b8==2){
                return 8
            }
        }
        else if(b3! * b6! * b9! == 18 || b3! * b6! * b9! == 50) {
            if(b3==2){
                return 3
            }
            if(b6==2){
                return 6
            }
            if(b9==2){
                return 9
            }
        }
        else if(b1! * b5! * b9! == 18 || b1! * b5! * b9! == 50) {
            if(b1==2){
                return 1
            }
            if(b5==2){
                return 5
            }
            if(b9==2){
                return 9
            }
        }
        else if(b3! * b5! * b7! == 18 || b3! * b5! * b7! == 50) {
            if(b3==2){
                return 3
            }
            if(b5==2){
                return 5
            }
            if(b7==2){
                return 7
            }
        }
        
        
        return 0
    }
    
    func aiTurn(player:Int) {
        if done {
            return
        }
        aiDeciding = true
        
        
        if(turn==1) {
            Go(1, player: player)
        }
        else if(turn==2){
            if(Board[5]==2){
                Go(5, player: player)
            }
            else {
                Go(1, player: player)
            }
        }
        else if(turn==3){
            
            if(Board[9]==2){
                Go(9, player: player)
            }
            else {
                Go(3, player: player)
            }
        }
            
        else if(turn==4){
            if (Posswin() != 0) {
                Go(Posswin(), player: player)
            }
            else {
                Go(make2(), player: player)
            }
        }
        else if(turn==5){
            if (Posswin() != 0) {
                Go(Posswin(), player: player)
            }
            else if (Board[7]==2){
                Go(7, player: player)
            }
            else {
                Go(3, player: player)
            }
        }
        else if(turn==6){
            if (Posswin() != 0) {
                Go(Posswin(), player: player)
            }
            else {
                Go(make2(), player: player)
            }
        }
        else {
            if (Posswin() != 0) {
                Go(Posswin(), player: player)
            }
            else {
                for(var i=1; i<10; i++){
                    if(Board[i]==2) {
                        Go(i, player: player)
                    }
                }
            }
        }
        
        aiDeciding = false
    }
    
    func checkForWin(){
        var winner = ["You":3, "The computer":5]
        for(key, value) in winner {
            if((Board[1]==value && Board[2]==value && Board[3]==value) ||
                (Board[4]==value && Board[5]==value && Board[6]==value) ||
                (Board[7]==value && Board[8]==value && Board[9]==value) ||
                (Board[1]==value && Board[4]==value && Board[7]==value) ||
                (Board[2]==value && Board[5]==value && Board[8]==value) ||
                (Board[3]==value && Board[6]==value && Board[9]==value) ||
                (Board[1]==value && Board[5]==value && Board[9]==value) ||
                (Board[3]==value && Board[5]==value && Board[7]==value) ){
                    Message.hidden = false
                    Message.text = "\(key) won!"
                    Reset.hidden = false
                    done = true
            }
            else if (turn == 9){
                Message.hidden = false
                Message.text = "We tied!"
                Reset.hidden = false
                done = true
            }
            
        }
    }
    
    @IBAction func resetTouch(sender:UIButton){
    done = false
    Reset.hidden = true
    Message.hidden = true
        reset()
    }
    
    func reset (){
        Board = [1:2,2:2,3:2,4:2,5:2,6:2,7:2,8:2,9:2]
        Image1.image = nil
        Image2.image = nil
        Image3.image = nil
        Image4.image = nil
        Image5.image = nil
        Image6.image = nil
        Image7.image = nil
        Image8.image = nil
        Image9.image = nil
        turn = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

