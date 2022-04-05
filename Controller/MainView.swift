//
//  ViewController.swift
//  TicTacToe
//
//  Created by Noel H. Yusta on 7/3/22.
//

import UIKit

class MainView : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.startButton.layer.cornerRadius = 8

        
        
    }


    @IBOutlet weak var startButton: UIView!
    @IBOutlet weak var settingsButton: UIStackView!
}

