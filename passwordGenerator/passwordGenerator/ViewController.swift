//
//  ViewController.swift
//  passwordGenerator
//
//  Created by Sharlet Varghese on 14/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uppercaseSwitch: UISwitch!
    @IBOutlet var lowercaseSwitch: UISwitch!
    @IBOutlet var numbersSwitch: UISwitch!
    @IBOutlet var symbolsSwitch: UISwitch!
    @IBOutlet var sliderLength: UISlider!
    @IBOutlet var sliderLengthDisplay: UILabel!
    @IBOutlet var passwordDisplay: UITextField!
    @IBOutlet var generateButton: UIButton!
    
    var uppercaseAlphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var lowercaseAlphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var numbers = ["0", "1", "2" , "3", "4", "5", "6", "7", "8", "9"]
    var symbols = ["~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", ":", ";", "<", ">", "?"]
    
    
    @IBAction func switchValueCheck(_ sender: UISwitch) {
        if !lowercaseSwitch.isOn && !uppercaseSwitch.isOn && !numbersSwitch.isOn && !symbolsSwitch.isOn {
            generateButton.isEnabled = false
        } else {
            generateButton.isEnabled = true
        }
    }
    
    
    @IBAction func generateButtonPressed(_ sender: UIButton) {
        
        var passwordCharSet = [String]()
        passwordDisplay.text = ""
        if lowercaseSwitch.isOn {
            passwordCharSet += lowercaseAlphabets
        }
        if uppercaseSwitch.isOn {
            passwordCharSet += uppercaseAlphabets
        }
        if numbersSwitch.isOn {
            passwordCharSet += numbers
        }
        if symbolsSwitch.isOn {
            passwordCharSet += symbols
        }
        for length in 1...Int(sliderLength.value) {
            passwordDisplay.text! += String(passwordCharSet.randomElement()!)
        }
    }
   
    @IBAction func updatesSliderLength(_ sender: UISlider) {
        sliderLengthDisplay.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func copyPassword(_ sender: UIButton) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = passwordDisplay.text
    }
    
}
