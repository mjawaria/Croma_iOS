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
        
//        addHandler {
//            print("Task competed later")
//        }
//        
//        completionHandlers.first?()
//        
        // Auto Closures
        
      //  printMyMessage(message: "Hello world")
        
        //ARC
        arcExample()
        
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
    
    // ARC Example
    
    func arcExample() {
       // var person1: Person? = Person(name: "Om")
        
      //  person1 = nil // ARC automatically free memory here
        
        
        var john: Person? = Person(name: "John")
        
        var aprt: Apartment? = Apartment(number: 101)
        
        john?.apartment = aprt
        aprt?.tenant = john
        
        john = nil
        aprt = nil
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


// ARC  // Automatic Reference Counting

// Classes not with Struct and enums (value types)
// Strong // weak // Unowned


// > 0  count is == 0


class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is deallocated")
    }
}

// Strong Reference Cycles
// Problem with ARC
    
// Sometimes ARC cannot free memory if two objects keep strong references to each other.

class Apartment {
    let number: Int
    weak var tenant: Person?   // weak reference
    
    init(number: Int) {
        self.number = number
    }
    
    deinit {
        print("Apartment \(number) is deallocated")
    }
}

// weak -> Does not increase ARC count.(Optional)
// Unowned -> Does not increase ARC count. (Non- Optional), assumes the object always exists during usage

// ARC = automatic memory manageer in swift
// Tracks object usage (refrence count)
// Frees memory when count = 0
// Issues: Strong refrence cycles.
// Fix weak or unowned references



// Project Tempated
// They differ based on platform (iOS, macOS, watchOS, tvOS) and Purose (App, Game, Framework, AR etc)




// Apple HIG

//HIG :- Human Interface Guidelines
//(iOS, iPadOS, macOS, watchOS, tvOS, visionOS).
// Purpose of HIG
// Ensure consitency across apps.
// Make apps feel native and intuitive
// Follow Apples design language so users already knows how to use your app
// Help developers /desiners understand what works well on iPhone vs iPad Vs Mac etc.


// Key Principles of Apple HIG

// Clarity -> Text is leagile , icons are clar, colors have enough contrast
// Deference -> UI should focus on content, not on heavy decoration
// Depth -> Transitions , motion, and hierachy guide users naturally.


// iOS Guidelines
// Use SF Symbols (Apple's system icons)
// Buttons should be large enough to tap (44X44 pt minimum)
// Respect safe areas & margins (don't put buttons under the notch or home indicator).
// Use dynamic type -> Support large / small fonts for accessibility
// Prefer system colors & components (so they adapt to dark mode automatically)


// /// Mac OS Guidelines:
// Use meanus, toolbars, sudebars appropriately
// Windows should be resizable
//Support drag & drop and keyboard shartcuts.


// Watch OS Guidelines
// Show short, glanceable info
// Use digital crown for scrolling
// Keep UI minimal due to small screen size


