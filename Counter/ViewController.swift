//
//  ViewController.swift
//  Counter
//
//  Created by Mishana on 16.05.2023.
//

import UIKit

private enum ButtonsType{
    case plus
    case minus
    case clear
}

final class ViewController: UIViewController {

    @IBOutlet private weak var countTextLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var reduceButton: UIButton!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    
    private var counter: Int = 0
    
    private var date = Date()
    private let dateFormatter = DateFormatter();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configureDate()-> String {
        return dateFormatter.string(from: date)
    }
    
    private func configure() {
        dateFormatter.dateFormat = "HH:mm:ss d MMM/yy"
        countTextLabel.text = "Значение счётчика: \(counter)"
        descriptionTextView.backgroundColor = .systemGray
        descriptionTextView.textColor = .white
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.text = "История изменений:\n"
        
        increaseButton.visible(title: "", bacground: .systemRed, image: "plus")
        reduceButton.visible(title: "", bacground: .systemBlue, image: "minus")
        clearButton.visible(title: "clear", bacground: .systemGray, image: "clear")
    }
    
    @IBAction func reduceCounter(_ sender: Any) {
        count(.minus)
    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        count(.plus)
    }
    
    @IBAction func clearButton(_ sender: Any) {
        count(.clear)
    }
    
    private func addText() {
        
    }
    
    private func count(_ type: ButtonsType){
        switch type {
        case .plus:
            counter += 1
            descriptionTextView.text = descriptionTextView.text + "\(configureDate()): значение изменено +1 \n"
        case .minus:
            if counter > 0{
                descriptionTextView.text = descriptionTextView.text + "\(configureDate()): значение изменено -1 \n"
                counter -= 1
            } else {
                descriptionTextView.text = descriptionTextView.text + "\(configureDate()): попытка уменьшить значение счётчика ниже 0 \n"
            }
        case .clear:
            descriptionTextView.text = descriptionTextView.text + "\(configureDate()): значение сброшено \n"
            counter = 0
            
        }
        countTextLabel.text = "Значение счётчика: \(counter)"
    }
}

