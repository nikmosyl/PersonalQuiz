//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var userAnimalLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    var userAnswers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        let selectedAnimal = calculateResult(for: userAnswers)
        userAnimalLabel.text = "Вы - \(selectedAnimal.rawValue)"
        animalDescriptionLabel.text = selectedAnimal.definition
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculateResult(for answers: [Answer]) -> Animal {
        var result: Animal = Animal.turtle
        var responseRate: [Animal: Int] = [:]
        var maxCount = 0
        
        for answer in answers {
            responseRate[answer.animal, default: 0] += 1
            let quantity = responseRate[answer.animal]!
            if maxCount < quantity {
                result = answer.animal
                maxCount = quantity
            }
        }
        return result
    }
}
