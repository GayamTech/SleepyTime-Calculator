//
//  ViewController.swift
//  SleepyTime Calculator
//
//  Created by Anu Gayam on 3/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var HourToRise: UITextField!
    
    @IBOutlet weak var MinuteToRise: UITextField!
    
    @IBOutlet weak var TimePeriod: UITextField!
    
    @IBOutlet weak var Time1: UILabel!
    
    
    @IBOutlet weak var Time2: UILabel!
    
    
    @IBOutlet weak var Time3: UILabel!
    
    
    @IBOutlet weak var Time4: UILabel!
    
    
    @IBOutlet weak var Time5: UILabel!
    
    
    @IBOutlet weak var Time6: UILabel!
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Clear()
    {
        self.HourToRise.text = ""
        self.MinuteToRise.text = ""
        self.Time1.text = ""
        self.Time2.text = ""
        self.Time3.text = ""
        self.Time4.text = ""
        self.Time5.text = ""
        self.Time6.text = ""
    }
    
    @IBAction func Calculate(_ sender: Any)
    {
        let hour = Int(self.HourToRise.text ?? "") ?? 0
        let minutes = Int(self.MinuteToRise.text ?? "") ?? 0
        let TimePeriod = String(self.TimePeriod.text ?? "")
        
        var NewTimePeriod = " "
        
        func end(){
            self.Time1.text = "Error Incorrect Time Input"
        }
        
        
    
        func changeTime()
        {
            if (NewTimePeriod == "AM")
            {
                NewTimePeriod = "PM"
            }
            else
            {
                NewTimePeriod = "AM"
            }
        }
        
        
   
    
        func CalculateTime()
        {
            var newHour = hour
            var newMinute = minutes
            for index in 1...6
            {
                newHour = newHour+1
                newMinute = newMinute+40
                if newMinute>=60
                {
                    newHour=newHour+1
                    newMinute=newMinute-60
                }
                if newHour>12
                {
                changeTime()
                newHour=newHour-12
                }
                
                var newMinutes = "\(newMinute)"
                
                if (newMinutes == "0")
                {
                    newMinutes = "00"
                }
            
                switch index
                {
                    case 1:
                        self.Time1.text=" \(newHour):\(newMinutes) \(NewTimePeriod)"
                    case 2:
                        self.Time2.text=" \(newHour):\(newMinutes) \(NewTimePeriod)"
                    case 3:
                        self.Time3.text=" \(newHour):\(newMinutes) \(NewTimePeriod)"
                    case 4:
                        self.Time4.text=" \(newHour):\(newMinutes) \(NewTimePeriod)"
                    case 5:
                        self.Time5.text=" \(newHour):\(newMinutes) \(NewTimePeriod)"
                    case 6:
                        self.Time6.text=" \(newHour):\(newMinutes) \(NewTimePeriod)"
                    default:
                        self.Time1.text = " "
                }
            }
        }
        
        if ((hour<0) || (hour>12) || (minutes<0) || (minutes>60))
        {
            end()
        }
        else if ((TimePeriod == "am") || (TimePeriod == "aM") || (TimePeriod == "Am") || (TimePeriod == "AM"))
        {
         NewTimePeriod = "AM"
            CalculateTime()
        }
        else if ((TimePeriod == "pm") || (TimePeriod == "pM") || (TimePeriod == "Pm") || (TimePeriod == "PM"))
        {
         NewTimePeriod = "PM"
            CalculateTime()
        }
        else
        {
            self.Time1.text = "Error Incorrect Time Input"
        }
    }
    
    
    
    @IBAction func Clear(_ sender: Any)
    {
       Clear()
    }
    
    
}

