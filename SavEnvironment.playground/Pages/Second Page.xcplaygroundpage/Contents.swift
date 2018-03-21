//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

let frameRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
let view = UIView(frame: frameRect)
let backgroundImageRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 3)
let car = UIImage(named: "racing.png")
let upImage = UIImage(named: "tree.jpg")
let upLeftImage = UIImage(named: "Street.jpeg")

class backgroundImage: UIImageView {
    var dimension: CGRect = backgroundImageRect

    //SE SERVE POSSO DIVIDERMELE IN PIù PROPRIETà
    //let width = UIScreen.main.bounds.width / 3

    convenience init() {
        self.init(frame: backgroundImageRect)
    }
}


let backgroundImageUp = backgroundImage()
let backgroundImageUpLeft = backgroundImage()

let carImage = UIImageView(image: car)
carImage.frame.size = CGSize(width: 90, height: 90)
carImage.frame.origin.x = backgroundImageUpLeft.frame.midX - carImage.frame.width / 2
carImage.frame.origin.y = backgroundImageUpLeft.frame.midY - carImage.frame.height / 2

backgroundImageUp.image = upImage
backgroundImageUp.contentMode = .scaleAspectFit
backgroundImageUpLeft.image = upLeftImage
backgroundImageUpLeft.contentMode = .scaleAspectFit

view.insertSubview(backgroundImageUpLeft, at: 0)
view.insertSubview(backgroundImageUp, at: 0)
view.addSubview(carImage)

//backgroundImageUpLeft.translatesAutoresizingMaskIntoConstraints = false
backgroundImageUp.translatesAutoresizingMaskIntoConstraints = false

backgroundImageUp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
backgroundImageUp.leadingAnchor.constraint(equalTo: backgroundImageUpLeft.trailingAnchor).isActive = true
backgroundImageUp.topAnchor.constraint(equalTo: view.topAnchor).isActive = true


//SE NON FUNZIONANO LE CONSTRAINTS IN NESSUN MODO
//backgroundImageUp.frame = CGRect(x: backgroundImageUpLeft.frame.maxX, y: 0, width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 3)

func boostingAnimation() {
    UIImageView.animate(withDuration: 2, animations: {
        carImage.transform = carImage.transform.rotated(by: -0.3)
    }) { (true) in
        UIImageView.animate(withDuration: 2){
            carImage.transform = carImage.transform.rotated(by: 0.3)
        }
    }
}

func moveRight() {

    UIImageView.animate(withDuration: 2, animations: {
        carImage.frame.origin.x += backgroundImageRect.width
    }) { (true) in
boostingAnimation()
    }
}

func moveLeft() {

    UIImageView.animate(withDuration: 2, animations: {
        carImage.frame.origin.x -= backgroundImageRect.width
    }) { (true) in
        boostingAnimation()
    }
}

func moveUp() {

    UIImageView.animate(withDuration: 2, animations: {
        carImage.frame.origin.y -= backgroundImageRect.height
    }) { (true) in
        boostingAnimation()
    }
}

func moveDown() {

    UIImageView.animate(withDuration: 2, animations: {
        carImage.frame.origin.y += backgroundImageRect.height
    }) { (true) in
        boostingAnimation()
    }
}

//COME CAZZO LE SINCRONIZZO ORA?
moveRight()
//moveDown()
//moveUp()
//moveLeft()


view.translatesAutoresizingMaskIntoConstraints = false
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = view


//: [Next](@next)
