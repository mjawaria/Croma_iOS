//
//  SecondViewController.swift
//  FiveSep_Class
//
//  Created by Mukul on 05/09/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = ""
    
    var newName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Second View Controller"
        
        // Set UI component
        
        nameLabel.textAlignment = .center

        nameLabel.font = UIFont(name: "Rockwell", size: 50)
        
        nameLabel.adjustsFontSizeToFitWidth = true
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = name
        
//        let greet = { (name: String) -> String in
//            return "Hello, \(name)"
//        }
        
     //   print(greet("Heri"))
       
        //Non- Escaping Closures (default)
        
//        perfomAction {
//            print("Doning coding")
//        }
        
        // Escaping Closures   (@escaping)
        
        addHandler {
            print("Task competed later")
        }
        
        completionHandlers.first?()
        
        // Auto Closures
        
        printMyMessage(message: "Hello world")
        
    }
    // Closure
    
   //Non- Escaping Closures (default)
    
    func perfomAction(action: () -> Void) {
        print("Start")
        action()
        print("End")
    }
    
    // Escaping Closures   (@escaping)
    
    var completionHandlers: [() -> Void] = []
    
    func addHandler(handler: @escaping () -> Void)  {
        completionHandlers.append(handler)
    }

    
    // Auto Closures (@autoclosure)
    
    
    func printMyMessage(message: @autoclosure () -> String) {
        print("Message is : \( message())")
        
    }

}

// Closure



// A closure is a block of code that you can pass around in your program and its like function without a name and also it can capture variables formthe surrounding scope

// Non- Escaping Closures (default)
 //this is deault one
// THis means the closure must finish execution before the function that takes it as a parameter returns.



// Escaping Closures   (@escaping)
 // If a closure is called after the function returns it must be marked as @escaping.
// Commonly used in asynchronous operations (like network calls, completion handlers)






// Auto Closures (@autoclosure)


// An autoclosure automatically wraps an expression in a closure.
// Useful for delayed evaluation: the code inside isn't run until the closure is actually called
// Ofter used in assertions, guard statements and short- circuiting logic



// Non-excapint(default) -- > Synchronous

// Esaping(@escapint): Closure runs after the function returns (asynchronous, Stored)

//Autoclosure(#utoclouser)
