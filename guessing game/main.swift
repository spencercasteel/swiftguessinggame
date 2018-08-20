//
//  main.swift
//  guessing game
//
//  Created by Spencer Casteel on 8/16/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

var playAgain = false

// game repeat
repeat {
    
    let randomNumber = Int(arc4random_uniform(99)) + 1
    
    var numberOfTries = 5
    
    var guessedNumber: Int? = nil
    
    print("Guess a random number between 1 and 100")
    // val repeat
    repeat {
        //guess repeat
        repeat {
            
            let input = readLine()!
            
            if input == "cheat" {
                print(randomNumber)
            }
            
            if let number = Int(input) {
                if number >= 1 && number <= 100 {
                    guessedNumber = number
                } else {
                    print("please enter a valid number between 1 and 100.")
                    guessedNumber = nil
                }
            } else{
                print("please enter a number")
                guessedNumber = nil
            }
            
        } while guessedNumber == nil
        
        guard let guessedNumber = guessedNumber else {
            fatalError()
        }
        if numberOfTries == 1{
            print("you lose 🤬")
            print("\(randomNumber) was the correct number")
            break
        }
        if guessedNumber == randomNumber {
            print("you won! 🤪")
            break
        }else if guessedNumber > randomNumber && numberOfTries >= 1 {
            numberOfTries -= 1
            print("try a lower number ⬇️")
        } else if guessedNumber < randomNumber && numberOfTries >= 1 {
            numberOfTries -= 1
            print("try a higher number ⬆️")
        }
        if numberOfTries > 0 {
            print("you have \(numberOfTries) tries left")
        }
        
        
    } while numberOfTries > 0
    print("try again? y or n")
    let input = readLine()!
    
    if  input.lowercased() == "y" {
        playAgain = true
    } else { playAgain = false
    }
} while playAgain
