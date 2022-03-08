//
//  GameView.swift
//  TicTacToe
//
//  Created by Noel H. Yusta on 7/3/22.
//

import UIKit
import SwiftUI

class GameView: UIViewController {

    var buttonArray: [UIButton] = []
    var Player :String = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Text(Player).font(.system(size: 55))
        
        buttonArray.append(A1)
        buttonArray.append(A2)
        buttonArray.append(A3)
        buttonArray.append(B1)
        buttonArray.append(B2)
        buttonArray.append(B3)
        buttonArray.append(C1)
        buttonArray.append(C2)
        buttonArray.append(C3)

    }
    
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var C1: UIButton!
    @IBOutlet weak var C2: UIButton!
    @IBOutlet weak var C3: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.title(for: .normal) == nil {
            sender.setTitle("X", for: .normal)
            Text(Player).font(.system(size: 55)).bold()
           
        }
    }
    
    
}
