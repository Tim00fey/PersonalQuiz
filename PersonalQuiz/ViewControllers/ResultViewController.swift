//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var chosenAnswers: [Answer]?
    
    var resultAnimal: Animal {
        identifyTheMostCommon(in: chosenAnswers ?? [])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        resultLabel.text = "Вы - \(resultAnimal.rawValue)"
        definitionLabel.text = resultAnimal.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
}


private extension ResultViewController {
    
    func identifyTheMostCommon(in answers: [Answer]) -> Animal {
        var countDog = 0
        var countCat = 0
        var countTurtle = 0
        var countRabbit = 0
        
        for answer in answers {
            switch answer.animal {
            case .dog:
                countDog += 1
            case .cat:
                countCat += 1
            case .turtle:
                countTurtle += 1
            case .rabbit:
                countRabbit += 1
            }
        }
        
        if countDog >= countCat && countDog >= countTurtle && countDog >= countRabbit {
            return .dog
        } else if countCat >= countTurtle && countCat >= countRabbit {
            return .cat
        } else if countTurtle >= countRabbit {
            return .turtle
        } else {
            return .rabbit
        }
        
    }
}
