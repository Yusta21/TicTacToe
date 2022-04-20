//
//  ViewController.swift
//  TicTacToe
//
//  Created by Noel H. Yusta on 7/3/22.
//

import UIKit



class MainView : UIViewController {

    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var botview: UIView!
    @IBOutlet weak var Logo: UIImageView!
    
    var DarkMode = false
    let defaults = UserDefaults.standard
    
    
    override func viewWillAppear(_ animated: Bool) {
        DarkMode = defaults.bool(forKey: "Dark")
        // Do any additional setup after loading the view.
        if DarkMode == true {
            print("dark on")
            topview.backgroundColor = .black
            botview.backgroundColor = .black
            Logo.image = UIImage.init(named: "logo terminado")
            
        }
        
        else{
            print("dark off")
            topview.backgroundColor = .white
            botview.backgroundColor = .white
            Logo.image = UIImage.init(named: "logoGris")
        }
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DarkMode = defaults.bool(forKey: "Dark")
        // Do any additional setup after loading the view.
        if DarkMode == true {
            print("dark on")
            topview.backgroundColor = .black
            botview.backgroundColor = .black
            
        }
        
        else{
            print("dark off")
            topview.backgroundColor = .white
            botview.backgroundColor = .white
        }
    
    }
}

