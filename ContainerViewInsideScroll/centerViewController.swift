//
//  centerViewController.swift
//  ContainerViewInsideScroll
//
//  Created by swift on 11.05.2017.
//  Copyright © 2017 developer. All rights reserved.
//


import UIKit

open class centerViewController: UIViewController {
    fileprivate weak var viewController : UIViewController!
    fileprivate var containerViewObjects = Dictionary<String,UIViewController>()
    
    open var currentViewController : UIViewController{
        get {
            return self.viewController
            
        }
    }
    
    
    fileprivate var segueIdentifier : String!
    
    @IBInspectable internal var startUp : String!
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    open override func viewDidAppear(_ animated: Bool) {
        if let identifier = startUp{
            segueIdentifierReceivedFromParent(identifier)
        }
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func segueIdentifierReceivedFromParent(_ identifier: String){
        
        self.segueIdentifier = identifier
        self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
        
    }
    
    
    
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier{
            
            if viewController != nil{
                
                
                viewController.view.removeFromSuperview()
                viewController = nil
                
            }
            if ((self.containerViewObjects[self.segueIdentifier] == nil)){
                viewController = segue.destination
                self.containerViewObjects[self.segueIdentifier] = viewController
                
            }else{
                for (key, value) in self.containerViewObjects{
                    
                    if key == self.segueIdentifier{
                        
                        viewController = value
                        
                        
                    }
                    
                }
                
                
            }
            
            self.addChildViewController(viewController)
            viewController.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(viewController.view)
            viewController.didMove(toParentViewController: self)
            
            
        }
        
    }
    
    
}
