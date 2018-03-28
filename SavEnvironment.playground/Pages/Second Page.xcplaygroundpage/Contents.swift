//: [Previous](@previous)
//#-hidden-code
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
    var statsTextField = UITextView()

    // Defining the texts for the statsTextField
    let afghanistanDefinition = "Afghan militias recruited thousands of child soldiers during the Afghan civil war over three decades. Many are still fighting now, for the Taliban. Some of those taken from Islamic religious schools are used as suicide bombers and gunmen.\nDuring the fighting between the army and ISIS, over 3,500 civilians died. A third of them are children."
    let centralAfricanRepublicDefinition = "Between 2012 and 2015 as many as 10,000 children were used by armed groups in the nationwide armed conflict and as of 2016 children were still being used. Some are as young as eight. The recruitment of children for military purposes increased by approximately 50% during last year."
    let iranDefinition = "The state conscripts for the regular army at age 19 while accepting volunteers at age 16. During the Iran-Iraq War, the total number of all Iranian casualties is estimated by independent sources to be about 200,000–600,000. Half of them were civilians and about 3% were under the age of 14. Some critics wrote that children were sent to the front as waves of human shields."
    let syriaDefinition = "Despite a law that prohibits the use of child soldiers, in Syria there are no age verification procedures so, still today, there have been allegations of children being recruited to fight for the Syrian government against rebel forces in support and combatant roles.\nDuring last year, over 10.000 civilians died during war."
    let defaultDefinition = "Children are easy targets for military recruitment due to their greater susceptibility to influence compared to adults. Some children are recruited by force while others choose to join up, often to escape poverty or because they expect military life to offer a rite of passage to maturity.\nBoth children soldiers and civilians are often the main victims of the war, hunger and poverty..."

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

        // Instantiating the statsTextField
        statsTextField.frame = CGRect(x: 0.0, y: secondRowStack.frame.height * 2, width: self.view.frame.width, height: self.view.frame.height / 3)

        // Property of the statsTextField
        statsTextField.isEditable = false
        statsTextField.isSelectable = false
        statsTextField.isScrollEnabled = false
        view.addSubview(statsTextField)

        // Putting the constraints to the statsTextField

        statsTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        statsTextField.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        statsTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        statsTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        statsTextField.topAnchor.constraint(equalTo: secondRowStack.bottomAnchor).isActive = true
        statsTextField.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        CTFontManagerRegisterFontsForURL(cfURL! as CFURL, CTFontManagerScope.process, nil)
        //#-end-hidden-code

        font = UIFont(name: "Arabolical", size:  23.0)

        statsTextField.textColor = .white
        statsTextField.backgroundColor = .black
        statsTextField.font = font
    }

    public override func viewDidLoad() {
        //#-editable-code
        seeStats(nation: "Put your nation here")
        //#-end-editable-code
    }

    func seeStats(nation: String) {
        if nation == "Central African Republic" {
            statsTextField.text = centralAfricanRepublicDefinition
            centralAfricanRepublicImageView.image = UIImage(named: "Central African Republic.png")
        } else if nation == "Afghanistan" {
            statsTextField.text = afghanistanDefinition
            afghanistanImageView.image = UIImage(named: "Afghanistan.png")
        } else if nation == "Iran" {
            statsTextField.text = iranDefinition
            iranImageView.image = UIImage(named: "Iran.png")
        } else if nation == "Syria" {
            statsTextField.text = syriaDefinition
            syriaImageView.image = UIImage(named: "Syria.png")
        } else {
            statsTextField.text = defaultDefinition
        }
    }
}

extension UIColor {
    convenience init(hex: UInt) {
        let components = (
            r: CGFloat((hex >> 16) & 0xff) / 255,
            g: CGFloat((hex >> 08) & 0xff) / 255,
            b: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.r, green: components.g, blue: components.b, alpha: 1)
    }
}

let viewController = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController
