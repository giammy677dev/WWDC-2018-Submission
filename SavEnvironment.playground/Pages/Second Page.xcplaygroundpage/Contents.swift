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
    //let width = UIScreen.main.bounds.width / 3

    convenience init() {
        self.init(frame: backgroundImageRect)
    }
}

let carImage = UIImageView(image: car)
carImage.frame.size = CGSize(width: 90, height: 90)

let backgroundImageUp = backgroundImage()
let backgroundImageUpLeft = backgroundImage()

backgroundImageUp.image = upImage
backgroundImageUp.contentMode = .scaleToFill
backgroundImageUpLeft.image = upLeftImage
backgroundImageUpLeft.contentMode = .scaleToFill

view.insertSubview(backgroundImageUpLeft, at: 0)
view.insertSubview(backgroundImageUp, at: 0)
view.addSubview(carImage)

//backgroundImageUpLeft.translatesAutoresizingMaskIntoConstraints = false
backgroundImageUp.translatesAutoresizingMaskIntoConstraints = false

backgroundImageUp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
backgroundImageUp.leadingAnchor.constraint(equalTo: backgroundImageUpLeft.trailingAnchor).isActive = true
backgroundImageUp.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

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

boostingAnimation()

PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

//: [Next](@next)
