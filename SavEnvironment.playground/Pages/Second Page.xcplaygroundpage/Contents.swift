//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport
import CoreText

public class ViewController: UIViewController {
    // Instantiate UIImage and UIImageView of the background
    let afghanistanGreyImage = UIImage(named: "Afghanistan grey.png")
    let centralAfricanRepublicGreyImage = UIImage(named: "Central African Republic grey.png")
    let iranGreyImage = UIImage(named: "Iran grey.png")
    let syriaGreyImage = UIImage(named: "Syria grey.png")

    var afghanistanImageView = UIImageView()
    var centralAfricanRepublicImageView = UIImageView()
    var iranImageView = UIImageView()
    var syriaImageView = UIImageView()

    // In the following, I'll initialize the stacks needed to place correctly the UIImageViews
    var firstRowStack = UIStackView()
    var secondRowStack = UIStackView()

    // Defining the textField
    var statsTextView = UITextView()

    //Constant and variable fot the import of the Arabolic font
    let cfURL = Bundle.main.url(forResource: "Arabolic", withExtension: "ttf")
    var font: UIFont?

    public override func loadView() {
        super.loadView()

        //Creating the view
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0x737779)
        self.view = view

        // The following is needed to assign the right image to each ImageView

        //Images of the first row
        afghanistanImageView.image = afghanistanGreyImage
        centralAfricanRepublicImageView.image = centralAfricanRepublicGreyImage

        //Images of the second row
        iranImageView.image = iranGreyImage
        syriaImageView.image = syriaGreyImage

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

        // Instantiating the statsTextView
        statsTextView.frame = CGRect(x: 0.0, y: secondRowStack.frame.height * 2, width: self.view.frame.width, height: self.view.frame.height / 3)

        // Property of the statsTextView
        statsTextView.isEditable = false
        statsTextView.isSelectable = false
        statsTextView.isScrollEnabled = false
        view.addSubview(statsTextView)

        // Putting the constraints to the statsTextView
        statsTextView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        statsTextView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        statsTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        statsTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        statsTextView.topAnchor.constraint(equalTo: secondRowStack.bottomAnchor).isActive = true
        statsTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        // Setting the aspect of the statsTextView
        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        font = UIFont(name: "Arabolical", size:  23.0)
        statsTextView.textColor = .white
        statsTextView.backgroundColor = .black
        statsTextView.font = font
        statsTextView.sizeThatFits(self.view.frame.size)
    }

    public override func viewDidLoad() {
        //#-editable-code
        seeStats(nation: "Put your nation here")
        //#-end-editable-code
    }

    //Function to set the right definitions in the statsTextField
    func seeStats(nation: String) {
        if nation == "Central African Republic" {
            statsTextView.text = centralAfricanRepublicDefinition
            centralAfricanRepublicImageView.image = UIImage(named: "Central African Republic.png")
        } else if nation == "Afghanistan" {
            statsTextView.text = afghanistanDefinition
            afghanistanImageView.image = UIImage(named: "Afghanistan.png")
        } else if nation == "Iran" {
            statsTextView.text = iranDefinition
            iranImageView.image = UIImage(named: "Iran.png")
        } else if nation == "Syria" {
            statsTextView.text = syriaDefinition
            syriaImageView.image = UIImage(named: "Syria.png")
        } else {
            statsTextView.text = defaultDefinition
        }
    }
}

let viewController = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController
