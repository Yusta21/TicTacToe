//
//  SettingsView.swift
//  TicTacToe
//
//  Created by Noel H. Yusta on 7/3/22.
//

import UIKit
import CoreData


var Dark = false

class SettingsView: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet var backGround: UIView!
    @IBOutlet weak var HardM: UISwitch!
    @IBOutlet weak var DarkM: UISwitch!
    @IBOutlet weak var letters: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.bool(forKey: "Dark") == true {
            backGround.backgroundColor = .black
            letters.textColor = .white
            label2.textColor = .white
            DarkM.isOn = true
            
        }
        if defaults.bool(forKey: "Hard") == true{
            HardM.isOn = true
        }
       
        // Do any additional setup after loading the view.
    }
    

    @IBAction func HardmodeSelect(_ sender: UISwitch) {
        //cambiar el hardmode a true
        if sender.isOn {
        defaults.set(true, forKey: "Hard")
    }
        else {
            defaults.set(false, forKey: "Hard")
        }
    }
    
    @IBAction func DarkmodeSelect(_ sender: UISwitch) {
       // cambiar el dark mode a true
        if sender.isOn {
            backGround.backgroundColor = .black
            letters.textColor = .white
            label2.textColor = .white
            defaults.set(true, forKey: "Dark")
        }
        else{
            backGround.backgroundColor = .white
            letters.textColor = .black
            label2.textColor = .black
            defaults.set(false, forKey: "Dark")
        }
       
    }
    
    
    
}
