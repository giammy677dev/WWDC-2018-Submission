//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

public class ViewController: UIViewController {

    // Instantiate UIImage and UIImageView of the background
    let upLeftImage = UIImage(named: "upLeft.png")
    let upImage = UIImage(named: "up.png")
    let upRightImage = UIImage(named: "upRight.png")
    let centerLeftImage = UIImage(named: "centerLeft.png")
    let centerImage = UIImage(named: "center.png")
    let centerRightImage = UIImage(named: "centerRight.png")
    let downLeftImage = UIImage(named: "downLeft.png")
    let downImage = UIImage(named: "down.png")
    let downRightImage = UIImage(named: "downRight.png")

    var upLeftImageView = UIImageView()
    var upImageView = UIImageView()
    var upRightImageView = UIImageView()
    var centerLeftImageView = UIImageView()
    var centerImageView = UIImageView()
    var centerRightImageView = UIImageView()
    var downLeftImageView = UIImageView()
    var downImageView = UIImageView()
    var downRightImageView = UIImageView()

    // Instantiate UIImage and UIImageView of the car
    let carImage = UIImage(named: "racing.png")
    var carImageView = UIImageView()

    // In the following, I'll initialize the stacks needed to create correctly place the UIImageViews
    var firstRowStack = UIStackView()
    var secondRowStack = UIStackView()
    var thirdRowStack = UIStackView()

    override public func loadView() {

        //Creating the view
        let view = UIView()
        view.backgroundColor = .white
        self.view = view

        // The following is needed to assign the right image to each ImageView

        //Images of the first row
        upLeftImageView.image = upLeftImage
        upImageView.image = upImage
        upRightImageView.image = upRightImage

        //Images of the second row
        centerLeftImageView.image = centerLeftImage
        centerImageView.image = centerImage
        centerRightImageView.image = centerRightImage

        //Images of the third row
        downLeftImageView.image = downLeftImage
        downImageView.image = downImage
        downRightImageView.image = downRightImage

        // Image of the car
        carImageView = UIImageView(image: carImage)

        // In the following, I'll create all the arrays for each row that will compose my view and, for each UIStackView creating before, I'll assign the correct array as arrangedSubview
        let firstRowArray = [upLeftImageView, upImageView, upRightImageView]
        firstRowStack = UIStackView(arrangedSubviews: firstRowArray)
        let secondRowArray = [centerLeftImageView, centerImageView, centerRightImageView]
        secondRowStack = UIStackView(arrangedSubviews: secondRowArray)
        let thirdRowArray = [downLeftImageView, downImageView, downRightImageView]
        thirdRowStack = UIStackView(arrangedSubviews: thirdRowArray)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        view.addSubview(firstRowStack)
        view.addSubview(secondRowStack)
        view.addSubview(thirdRowStack)

        // Correctly sizing all the UIStackViews
        firstRowStack.translatesAutoresizingMaskIntoConstraints = false
        firstRowStack.frame = CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
        secondRowStack.translatesAutoresizingMaskIntoConstraints = false
        secondRowStack.frame = CGRect(x: 0, y: firstRowStack.frame.maxY + view.frame.size.height / 3, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
        thirdRowStack.translatesAutoresizingMaskIntoConstraints = false
        thirdRowStack.frame = CGRect(x: 0, y: secondRowStack.frame.maxY + view.frame.size.height / 3, width: view.frame.size.width / 3, height: view.frame.size.height / 3)

        //First UIStackView
        firstRowStack.axis = .horizontal
        firstRowStack.distribution = .fillEqually
        firstRowStack.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 3).isActive = true
        firstRowStack.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        firstRowStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        firstRowStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        firstRowStack.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true

        //Second UIStackView
        secondRowStack.axis = .horizontal
        secondRowStack.distribution = .fillEqually
        secondRowStack.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 3).isActive = true
        secondRowStack.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        secondRowStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        secondRowStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        //secondRowStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        //Third UIStackView
        thirdRowStack.axis = .horizontal
        thirdRowStack.distribution = .fillEqually
        thirdRowStack.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 3).isActive = true
        thirdRowStack.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        thirdRowStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        thirdRowStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        thirdRowStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        thirdRowStack.topAnchor.constraint(equalTo: secondRowStack.bottomAnchor).isActive = true

        // Correctly positioning the carImageView
        carImageView.frame.origin.x = downRightImageView.frame.midX //Setting the initial x of the carImageView
        carImageView.frame.origin.y = downRightImageView.frame.midY + carImageView.frame.height / 2 //Setting the initial y of the carImageView
        downRightImageView.addSubview(carImageView)
    }
}

//ARRIVATO QUI
//
//func boostingAnimation() {
//    UIImageView.animate(withDuration: 2, animations: {
//        carImage.transform = carImage.transform.rotated(by: -0.3)
//    }) { (true) in
//        UIImageView.animate(withDuration: 2){
//            carImage.transform = carImage.transform.rotated(by: 0.3)
//        }
//    }
//}
//
//func moveRight() {
//
//    UIImageView.animate(withDuration: 2, animations: {
//        carImage.frame.origin.x += backgroundImageRect.width
//    }) { (true) in
//boostingAnimation()
//    }
//}
//
//func moveLeft() {
//
//    UIImageView.animate(withDuration: 2, animations: {
//        carImage.frame.origin.x -= backgroundImageRect.width
//    }) { (true) in
//        boostingAnimation()
//    }
//}
//
//func moveUp() {
//
//    UIImageView.animate(withDuration: 2, animations: {
//        carImage.frame.origin.y -= backgroundImageRect.height
//    }) { (true) in
//        boostingAnimation()
//    }
//}
//
//func moveDown() {
//
//    UIImageView.animate(withDuration: 2, animations: {
//        carImage.frame.origin.y += backgroundImageRect.height
//    }) { (true) in
//        boostingAnimation()
//    }
//}
//
//func provaAnimate(){
//UIView.animate(withDuration: 1.0, animations: {
//    // Animation 1
//    boostingAnimation()
////    var scaleTransform = CGAffineTransform(scaleX: 4, y: 4)
////    star.transform = scaleTransform
////    starEmpty.transform = scaleTransform
////    star.alpha = 1
//
//}) { (_) in
//
//    // Animation 2
//    UIView.animate(withDuration: 2.0, animations: { () -> Void in
//        carImage.frame.origin.y += backgroundImageRect.height
//    })
////    { (_) in
////
////        // Clean up
////        containerView.willRemoveSubview(starEmpty)
////    }
//}
//}
//
////COME CAZZO LE SINCRONIZZO ORA?
////provaAnimate()
//moveDown()
////moveUp()
////moveLeft()
//
//


let viewController = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController


//: [Next](@next)
