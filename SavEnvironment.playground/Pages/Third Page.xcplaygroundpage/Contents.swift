//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

public class ViewController: UIViewController {
    // Instantiate UIImage and UIImageView of the background
    let afghanistanImage = UIImage(named: "Afghanistan.png")
    let centralAfricanRepublicImage = UIImage(named: "Central African Republic.png")
    let iranImage = UIImage(named: "Iran.png")
    let syriaImage = UIImage(named: "Syria.png")

    var afghanistanImageView = UIImageView()
    var centralAfricanRepublicImageView = UIImageView()
    var iranImageView = UIImageView()
    var syriaImageView = UIImageView()

    // In the following, I'll initialize the stacks needed to place correctly the UIImageViews
    var firstRowStack = UIStackView()
    var secondRowStack = UIStackView()

    // Defining the textField
    var statsTextField = UITextView()

    // Defining the texts for the statsTextField
    let syriaDefinition = "Despite a law that prohibits the use of child soldiers, in Syria there are no age verification procedures so, still today, there have been allegations of children being recruited to fight for the Syrian government against rebel forces in support and combatant roles.\nDuring last year, over 10.000 civilians died during war."

    public override func loadView() {
        super.loadView()

        //Creating the view
        let view = UIView()
        view.backgroundColor = .black
        self.view = view

        // The following is needed to assign the right image to each ImageView

        //Images of the first row
        afghanistanImageView.image = afghanistanImage
        centralAfricanRepublicImageView.image = centralAfricanRepublicImage

        //Images of the second row
        iranImageView.image = iranImage
        syriaImageView.image = syriaImage

        // In the following, I'll create all the arrays for each row that will compose my view and, for each UIStackView creating before, I'll assign the correct array as arrangedSubview
        let firstRowArray = [afghanistanImageView, centralAfricanRepublicImageView]
        firstRowStack = UIStackView(arrangedSubviews: firstRowArray)
        let secondRowArray = [iranImageView, syriaImageView]
        secondRowStack = UIStackView(arrangedSubviews: secondRowArray)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        view.addSubview(firstRowStack)
        view.addSubview(secondRowStack)

        // Correctly sizing all the UIStackViews
        firstRowStack.translatesAutoresizingMaskIntoConstraints = false
        firstRowStack.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 3)
        secondRowStack.translatesAutoresizingMaskIntoConstraints = false
        secondRowStack.frame = CGRect(x: 0, y: firstRowStack.frame.maxY + view.frame.size.height / 3, width: view.frame.size.width, height: view.frame.size.height / 3)

        //First UIStackView
        firstRowStack.axis = .horizontal
        firstRowStack.distribution = .fillEqually
        firstRowStack.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        firstRowStack.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        firstRowStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        firstRowStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        firstRowStack.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true

        //Second UIStackView
        secondRowStack.axis = .horizontal
        secondRowStack.distribution = .fillEqually
        secondRowStack.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        secondRowStack.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        secondRowStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        secondRowStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        secondRowStack.topAnchor.constraint(equalTo: firstRowStack.bottomAnchor).isActive = true

        // Instantiating the textField
        statsTextField.frame = CGRect(x: 0.0, y: secondRowStack.frame.height * 2, width: self.view.frame.width, height: self.view.frame.height / 3)
        view.addSubview(statsTextField)

        // Putting the constraints to the statsTextField

        statsTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        statsTextField.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        statsTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        statsTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        statsTextField.topAnchor.constraint(equalTo: secondRowStack.bottomAnchor).isActive = true
        statsTextField.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        statsTextField.textColor = .white
        statsTextField.backgroundColor = .black
    }

    public override func viewDidLoad() {
        seeStats(nation: "Put your nation here")
    }

    func seeStats(nation: String) {
        if nation == "Syria" {
            //Mettere immagine grigia ed illuminarla qui
            statsTextField.text = syriaDefinition
        } else {
            statsTextField.text = "ciao"
        }
    }
}


let viewController = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController
