//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var factScoreLabel: UILabel!
    @IBOutlet weak var steveJobsButton: UIButton!
    @IBOutlet weak var billGatesButton: UIButton!
    var billAndSteveFacts: [String : [String]] = [:]
    var currentScore = 0
    var billFacts: [String] = []
    var steveFacts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
        // Have to remember to call your functions in the viewDidLoad! I wasn't calling createFacts() or showFact() and the app wasn't functioning correctly.
        
    }
    
    func createFacts() {
        
         billFacts = [
                          "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31."                                                                                                          ,
                          "He scored 1590 (out of 1600) on his SATs."                                                                                                                                                           ,
                          "His foundation spends more on global health each year than the United Nation's World Health Organization."                                                                                           ,
                          "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game."                                             ,
                          "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."                              ]
    
         steveFacts = [
                          "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font."                                                                      ,
                          "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                          "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo."                                                               ,
                          "He was a pescetarian, meaning he ate no meat except for fish."                                                                                                                                       ]

        billAndSteveFacts["Bill Gates"] = billFacts
        billAndSteveFacts["Steve Jobs"] = steveFacts

    }
    
    func getRandomFact() -> (person: String, fact: String)? {
        
        let person = randomPerson()
        var randomFact = ""
        
        if let person = billAndSteveFacts[person] {
            let randomFactSelected = randomNumberFromZeroTo(person.count)
            randomFact = person[randomFactSelected]
        }
        
        return (person, randomFact)
    }
    
    func showFact() {
      let randomFact = getRandomFact()
        factLabel.text = randomFact?.fact
    }
    
    @IBAction func steveJobsButtonTapped(sender: AnyObject) {
        // All three of the if statements below are unwrapping the optional [String] & String from the dictionary. First if statement pulls out the array of String associated with the "Steve Jobs" key, then unwrapped the factLabel.Text  & referred back to the array (factsOfSteve) to see if it contained the same string that was displayed on the factLabel.
        
        if let factsOfSteve = billAndSteveFacts["Steve Jobs"] {
            if let possibleSteveFact = factLabel.text {
                if factsOfSteve.contains(possibleSteveFact) {
                    currentScore += 1
                    factScoreLabel.text = String(currentScore)
                    showFact()
                } else {
                    showFact()
                    // Without this else statement, the factLabel wasn't updating if the user selected the wrong answer.
                }
            }
        }
    }
    
    @IBAction func billGatesButtonTapped(sender: AnyObject) {
        
        if let factsOfBill = billAndSteveFacts["Bill Gates"] {
            if let possibleBillFact = factLabel.text {
                if factsOfBill.contains(possibleBillFact) {
                    currentScore += 1
                    factScoreLabel.text = String(currentScore)
                    showFact()
                } else {
                    showFact()
                }
            }
        }
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
}
