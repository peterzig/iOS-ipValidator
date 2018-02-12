//
//  ViewController.swift
//  ipValidator
//
//  Created by Peter Zaporowski on 12.02.2018.
//  Copyright © 2018 Peter Zaporowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLbl: UITextField!
    @IBOutlet weak var textLbl2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func isValidIP(ipAddr: String?) -> Bool {
        guard let ipAddr = ipAddr else {
            return false
        }
        let octets = ipAddr.characters.split { $0 == "."}.map{String($0)}
        guard octets.count == 4 else {
            return false
        }
        for octet in octets {
            guard validOctet(octet: octet) else {
                return false
            }
        }
        return true
    }
    
    func validOctet(octet: String) -> Bool {
        guard let num = Int(String(octet)), num>=0 && num<256 else{
            return false
        }
        return true
    }
   
    @IBAction func validateBtn(_ sender: UIButton) {
        var result = isValidIP(ipAddr: textLbl.text)
        
        if result == true {
            textLbl2.text = "IP is valid 😀"
        } else {
            textLbl2.text = "IP is invalid 😞"
        }
        
    }

}

