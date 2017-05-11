//
//  ViewController.swift
//  ContainerViewInsideScroll
//
//  Created by swift on 11.05.2017.
//  Copyright © 2017 developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var center : centerViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "center"{
            
            center = segue.destination as! centerViewController
            
            
        }
        
        
    }
    
    
    
    
    @IBAction func goOne(_ sender: UIButton) {
        
        if center != nil {
            center!.segueIdentifierReceivedFromParent("one")
        }
    }
    
    
    
    
    @IBAction func goTwo(_ sender: UIButton) {
        
        if center != nil {
            center!.segueIdentifierReceivedFromParent("two")
        }
    }
    


}

