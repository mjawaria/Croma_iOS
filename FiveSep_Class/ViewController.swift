//
//  ViewController.swift
//  FiveSep_Class
//
//  Created by Mukul on 05/09/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.protocolPrectice()
        //self.extentionFunction()
        //self.precticeOfCircleAnddescription()
        
        // self.genericsFunction()
        //
        self.genericTypeSecond()
    }

    
    @IBAction func nextButtonAction(_ sender: Any) {
       
        print("Get Call on next button")
        
        if textField.text?.count ?? 0 > 3 {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let secondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            
            secondViewController.name = self.textField.text ?? ""
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
          //  self.navigationController?.present(secondViewController, animated: true)
        } else {
            let alertController = UIAlertController(title: "", message: "Please write your name", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                print("Ok button tapped")
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
                    print("Cancel Button tapped")
                
                self.textField.text = ""
            }
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
      
        }
    }
    
    // Prorocol function
    
    func protocolPrectice() {
        let myCar = Car()
        myCar.speed = 80
        myCar.drive()
        
        let myName: String = "Mukul"
    }
    
    // Extention Function
    
    func extentionFunction() {
        print("level".isPalindrom())
        print("world".isPalindrom())
    }
    
    // About Area value
    func precticeOfCircleAnddescription () {
        
        let circle  = Circle(radius: 8)
        circle.description()
    }
    
    // Circle
    func swipeVlaues<T>(_ a: inout T, _ b: inout T)  {
        let temp = a
        a = b
        b = temp
    }
    
    // Extention
    
    func genericsFunction() {
        
        var myName = 5
        var mySurname = 10
        
        swipeVlaues(&myName, &mySurname)
        
        print(myName, mySurname) // 10,5
    }
    
    func genericTypeSecond() {
        var intStack = Stack<Int>()
        intStack.push(1)
        intStack.push(2)
        
        print(intStack.pop()) // 2
        
        // String
        
        var stringStack = Stack<String>()
        
        stringStack.push("Swift")
        stringStack.push("Generics")
        print(stringStack.pop()) // Generics
        
        
    }
    
    
}

//- How you pass the data from one controller to another controller
//- Use of alert Controller
//- Present and push controller



// 8 Sep Class
//1) protocol and extention

// A protocol defines a blueprint of methods and properties that conforming types must implement
// Swift is protocol oriented language

// Example
protocol Vehicle {
    var speed: Int {get set}
    func drive()
}

class Car: Vehicle {
    var speed: Int = 0
    
    func drive() {
        print("Car is driving at \(speed) km/h")
    }
   
}

// Extention
// Extention let you add new functionality (methods,initializers) to existing types (classes, structs, enums, or even protocols) without modifying the original code.

extension String {
    func isPalindrom() -> Bool {
        
        let reversed = String(self.reversed())
        
        return self == reversed
    }
}

// level // MOM // Cow

protocol Shape {
    func area() -> Double
}

extension Shape {
    func description() {
        print("I am a shape with area \(area())")
    }
}

struct Circle : Shape {
    var radius: Double
    func area() -> Double {
        return 3.14 * radius * radius
    }
}

//Gnerics

// Generics allow you to flexible and resuable funtion or types that work with any type

struct Stack<T> {
    private var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
}

// Tuples
// Functions
