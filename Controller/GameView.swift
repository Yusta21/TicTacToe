//
//  GameView.swift
//  TicTacToe
//
//  Created by Noel H. Yusta on 7/3/22.
//

import UIKit
import SwiftUI

class GameView: UIViewController {

    var buttonArray: [CustomButton] = []
    var X = "X"
    var O = "O"
    var turn = 1
    
    
    
    enum playss {
    case A1, A2, A3, B1, B2, B3, C1, C2, C3
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonArray.append(A1)
        buttonArray.append(A2)
        buttonArray.append(A3)
        buttonArray.append(B1)
        buttonArray.append(B2)
        buttonArray.append(B3)
        buttonArray.append(C1)
        buttonArray.append(C2)
        buttonArray.append(C3)
        
      
     //   startIA()
     
    }
    // MARK: alerts functions
    
    func showAlert1(){
        let Alert = UIAlertController(title: "Winner is...", message: "X", preferredStyle: .alert)
        Alert.addAction(UIAlertAction(title: "Restart ", style: .cancel,handler: {action in
            self.resetTable()
        }))
        present(Alert, animated: true)
    }

        func showAlert2(){
            let Alert2 = UIAlertController(title: "Winner is...", message: "O", preferredStyle: .alert)
            Alert2.addAction(UIAlertAction(title: "Restart ", style: .cancel,handler: {action in
                self.resetTable()
            }))
            present(Alert2, animated: true)
        }

    func showAlert3(){
        let Alert3 = UIAlertController(title: "Winner is...", message: "TIE!!", preferredStyle: .alert)
        Alert3.addAction(UIAlertAction(title: "Restart ", style: .cancel,handler: {action in
            self.resetTable()
        }))
        present(Alert3, animated: true)
    }
        
    

    @IBOutlet weak var A1: CustomButton!
    @IBOutlet weak var A2: CustomButton!
    @IBOutlet weak var A3: CustomButton!
    @IBOutlet weak var B1: CustomButton!
    @IBOutlet weak var B2: CustomButton!
    @IBOutlet weak var B3: CustomButton!
    @IBOutlet weak var C1: CustomButton!
    @IBOutlet weak var C2: CustomButton!
    @IBOutlet weak var C3: CustomButton!
    
    @IBAction func ButtonPressed(_ sender: CustomButton) {
        
        if sender.checked == false {
            
            sender.setTitle(X, for: .normal)
            sender.Player = X
            sender.checked = true
            turn = 2
            checkforwinnerO()
            checkWinnerX()
            checkFullBoard()
            AIHard(sender: sender)
           
            
        }
        else {
            print("Already used")
        }
       
    }
   
    
    //MARK: Functions
    
    
    func resetTable() {
        for button in buttonArray {
            if button.checked == true {
            button.setTitle("", for: .normal)
                button.checked = false
                button.Player = ""
           //startIA()
        }
            
        }
     
    }
    
    
    func checkFullBoard() {
        
        var numberChecked = 0
        
        for button in buttonArray {
            if button.checked == true  {
                numberChecked += 1
            }
        }
        if numberChecked == 9 {
            print("board full, tie")
            showAlert3()
            turn = 1
            
        }
    }
    
    func AITurn() {
    
        while turn == 2 {
            let number = Int.random(in: 0...8)
            if buttonArray[number].checked == false {
                buttonArray[number].checked = true
                buttonArray[number].Player = O
                buttonArray[number].setTitle(O, for: .normal)
                turn = 1
                checkFullBoard()
            }
            else {
                turn = 2
            }
        }
    }
    
    
    // MARK: function for checking winner
    
    func checkWinnerX () {
        if A1.Player == X && B1.Player == X && C1.Player == X{
print("winner X")
            showAlert1()
            //add win to player
    }
        if A2.Player == X && B2.Player == X && C2.Player == X{
print("winner X")
            showAlert1()
            //add win to player
    }
        if A3.Player == X && B3.Player == X && C3.Player == X{
print("winner X")
            showAlert1()
            //add win to player
    }
        if A1.Player == X && A2.Player == X && A3.Player == X{
print("winner X")
            showAlert1()
            
            //add win to player
    }
        if B1.Player == X && B2.Player == X && B3.Player == X{
print("winner X")
            showAlert1()
            //add win to player
    }
        if C1.Player == X && C2.Player == X && C3.Player == X{
print("winner X")
            showAlert1()
            //add win to player
    }
        if A3.Player == X && B2.Player == X && C1.Player == X{
print("winner X")
            showAlert1()
            //add win to player
    }
        if A1.Player == X && B2.Player == X && C3.Player == X{
print("winner X")
            showAlert1()
            //add win to player
           
    }

        
      
    }
    
    // MARK: func to check AI win
    
    func checkforwinnerO(){
        if A1.Player == O && A3.Player == O && A2.Player == O{
print("winner O")
            //add win to AI
            showAlert2()    }
        if B1.Player == O && B3.Player == O && B2.Player == O{
print("winner O")
            showAlert2()    }
        if C1.Player == O && C3.Player == O && C2.Player == O{
print("winner O")
            showAlert2()    }
        if A1.Player == O && B2.Player == O && C3.Player == O{
print("winner O")
            showAlert2()    }
        if A3.Player == O && B2.Player == O && C1.Player == O{
print("winner O")
            showAlert2()    }
        if B1.Player == O && C1.Player == O && A1.Player == O{
print("winner O")
            showAlert2()    }
        if B2.Player == O && A2.Player == O && C2.Player == O{
        print("winner O")
            showAlert2()            }
        if B3.Player == O && C3.Player == O && A3.Player == O{
print("winner O")
            showAlert2()    }
        

}
    
    // MARK: AI medium
    
    func AIHard(sender: CustomButton) {
       
        if sender == A1 {
           var playz  = [A2,B1]
            while turn == 2 {
                if playz.count <= 0 {
                    AITurn()            }
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()               }
                    
                }
            }
            
        }
        if sender == A2 {
           var playz  = [A1,A3,B2]
            while turn == 2 {
                if playz.count <= 0 {
                    AITurn()            }
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()                }
                    
                }
                
            }
            
        }
        
        if sender == A3 {
           var playz  = [A2,B3]
            while turn == 2 {
                if playz.count <= 0 {
                    AITurn()            }
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()       }
                    
                }
            }
            
        }
        if sender == B1 {
           var playz  = [A1,B2,C1]
            while turn == 2 {
                if playz.count <= 0 {
                    AITurn()            }
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()               }
                    
                }
            }
            
        }
        if sender == B2 {
           var playz  = [A1,C3,C1,C3]
            while turn == 2 {
                if playz.count <= 0 {
                    AITurn()            }
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()            }
                    
                }
            }
            
        }
        if sender == B3 {
           var playz  = [A3,B2,C3]
            while turn == 2 {
                if playz.count <= 0 {
                    AITurn()      }
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                    print(playz.count)
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()      }
                    
                }
            }
            
        }
        if sender == C1 {
           var playz  = [C2,B1]
            while turn == 2 {
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()    }            }
            }
            
        }
        if sender == C2 {
           var playz  = [C1,B2,C3]
            while turn == 2 {
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()}
                        
                    }
                }
            }
            
        
        if sender == C3 {
           var playz  = [C2,B3]
            while turn == 2 {
                let range = playz.count
                let number = Int.random(in: 0...range-1)
                if playz[number]!.checked == false {
                    playz[number]!.checked = true
                    playz[number]!.Player = O
                    playz[number]!.setTitle(O, for: .normal)
                    turn = 1
                }
                else {
                    playz.remove(at: number)
                    if playz.count <= 0 {
                        AITurn()    }            }
            }
            
        }
        checkFullBoard()
        }
    func startIA() {
        B2.checked = true
        B2.Player = O
        B2.setTitle(O, for: .normal)
    }
   
    
    
    
}
        
            
