//
//  ViewController.swift
//  Logistics
//
//  Created by ksy on 15/2/2.
//  Copyright (c) 2015年 ksy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var diaplay: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
   //        displayLabel.addConstraints(<#constraints: [AnyObject]#>)()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        println("digit = \(digit)")
        displayLabel.text = digit
        self.addLetAddVarValue()
        self.dictionaryTest()
        self.optionalTest()
        self.enumTest()
//        self.largestNumber(interestingNumbers)
         println(self.largestNumber(interestingNumbers))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLetAddVarValue()
    {
        let xxx:Double = 70
        var xxxa:Int
        let avalue = 70
        let bvalue = 70
        let cvalue = avalue + bvalue
        let dvalue = "cube"
        let evalue = String(cvalue) + bvalue.description + "\(xxx)"
        println(evalue)

    }
    
    func arrayTest()
    {
        var emptyArray = [Int]()
        var emptyArray1 = []
        emptyArray.append(22)
        let nubmer = [22,"dd","ee","rr","tt"]
        var varNubmer = nubmer
        varNubmer.append("aa")
        let nubmer1 = nubmer[1]
        varNubmer .removeAll(keepCapacity: true)
        
    }
    
    func dictionaryTest()
    {
        var emptyDic = [String:Float]()
        var emptyDic1 = [:]
        var letDic = ["sss":22,"xx":44]
        let aa = letDic.indexForKey("xx")
        let ca = letDic.indexForKey("sssss")
        let ss = letDic.values
        letDic["jas"] = 33
        let qq = letDic["sss"]
    }
    
    func optionalTest()
    {
        var optionalString:String? = "hello"
        optionalString == nil
        
        var optionalName:String? = "John Appleseed"
        var greeting = "Hello!"
        if let name = optionalName{
            greeting = "Hello, \(name)"
        }
        println(greeting)
        println(self.perimeter)
    }
    
    func switchTest()
    {
        
        
        
        let vegetable = "red pepper"
        var red:String
        switch vegetable{
            case "red pepper","xxxx":
            red = vegetable
            case "pepper":
            red = vegetable
        default:
            red = "xxxx"
        }
    }
    
    var interestingNumbers = [
        ["prime" : [1,3,4,45,5]],
        ["primeq" : [1,33,444,435,5]],
        ["primed" : [1,3,4344,445,33]],
    ]

    func largestNumber(transform: Array<Dictionary<String, Array<Int>>>) ->Int
    {
        var lagesss = 0
//        interestingNumbers.removeLast()
        for ww in transform{
            
            for (kind ,numbers) in ww{
                for number in numbers{
                    if number > lagesss{
                        lagesss = number
                    }
                    
                }
            }
//            let valueArray = aa["sss"]
//            valueArray
        }
            
            
        return lagesss
    }
    
    func aaaaaa(){
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
        ]
        var largest = 0
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
    }
    
    
    func calculateStatistics(scores: [Int] , sss : Int,zzz : Float) -> (xxx: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    
    func  ssss(){
        let statistics = calculateStatistics([5, 3, 100, 3, 9],sss: 20,zzz: 30)
        statistics.xxx
        statistics.2
    }
    
    
    class Shape {
        var numbersOfSides:Int
        var name: String
        func simpleDescription( shapeWidth : Float , shapeHeigh : Float) -> String {
            self.numbersOfSides = 20
            return "A shape with \(shapeWidth) and \(shapeHeigh)) sides"
        }
        init(name1 : String) {
            numbersOfSides = 20
            name = name1
        }
        
        deinit{
            
        }
        
    
        
    }
    
    class sonShape: Shape {
    
//        override init(name1: String) {
//            super.init(name1: name1)
//        }
//        override init(name1: String) {
//            super.init(name1: name1)
//        }
        init(name1: String ,aass : String) {
            super.init(name1: name1)
        }
    }
    
    func getAshape(){
      
        var shape = Shape(name1:"sss")
//        var shapea = sonShape(name1: "sss")
    
        println(shape.simpleDescription(20,shapeHeigh: 30))
        

    }
    
    
    class TriangleAndSquare​1 {
//        let asd = Shape)
        
        var zsssss = Shape(name1: "333")
        var zzzzz : String = ""  {
            willSet {
                
            }
            
            didSet {
                
            }
        }
        
    }
    
    
    var perimeter :String{
        get{
            return "sas"
        }
        set{
      
        }
    }
    
    
    enum Rank: Int {
        case Ace = 1
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        func simplessDescription() -> String {
            switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    func enumTest(){
        let ace = Rank.Ace.simplessDescription()
//        let aceRawValue = ace.rawValue
        
        println(ace)
//        println(aceRawValue)
        let aas =  self .anyCommonElements(ace, rhs: ace)

    }
    
    
    func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
    }
    

    
//    var largest = 0
    
    


}

