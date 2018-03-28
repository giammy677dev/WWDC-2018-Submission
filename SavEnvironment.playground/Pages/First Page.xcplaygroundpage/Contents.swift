import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class ViewController: UIViewController {

    // Defining UIImage and UIImageView of the background
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

    // Defining UIImage and UIImageView of the car
    let nuhImage = UIImage(named: "Nuh.png")
    var nuhImageView = UIImageView()

    // In the following, I'll initialize the stacks needed to place correctly the UIImageViews
    var firstRowStack = UIStackView()
    var secondRowStack = UIStackView()
    var thirdRowStack = UIStackView()

    override public func loadView() {
        super.loadView()

        // Creating the view
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0x737779)
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

        // Image of Nuh, the child of our story
        nuhImageView = UIImageView(image: nuhImage)

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
        firstRowStack.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 3)
        secondRowStack.translatesAutoresizingMaskIntoConstraints = false
        secondRowStack.frame = CGRect(x: 0, y: firstRowStack.frame.maxY + view.frame.size.height / 3, width: view.frame.size.width, height: view.frame.size.height / 3)
        thirdRowStack.translatesAutoresizingMaskIntoConstraints = false
        thirdRowStack.frame = CGRect(x: 0, y: secondRowStack.frame.maxY + view.frame.size.height / 3, width: view.frame.size.width, height: view.frame.size.height / 3)

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

        //Third UIStackView
        thirdRowStack.axis = .horizontal
        thirdRowStack.distribution = .fillEqually
        thirdRowStack.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        thirdRowStack.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 3).isActive = true
        thirdRowStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        thirdRowStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        thirdRowStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        thirdRowStack.topAnchor.constraint(equalTo: secondRowStack.bottomAnchor).isActive = true

        // Correctly positioning the nuhImageView
        nuhImageView.frame = CGRect(x: thirdRowStack.frame.width - thirdRowStack.frame.width / 6 - self.nuhImageView.frame.width / 3, y: thirdRowStack.frame.height / 2, width: self.view.frame.width / 8, height: self.view.frame.height / 8)
        thirdRowStack.addSubview(nuhImageView)

        //Sequence of the animations
        UIView.animateKeyframes(withDuration: 18, delay: 1, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                //#-editable-code
                self.moveUp()
                //#-end-editable-code
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.25, animations: {
                self.downRightImageView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.downImageView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.25, animations: {
                self.turnLeft()
                self.downLeftImageView.alpha = 0
                //#-editable-code
                self.moveLeft()
                //#-end-editable-code
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.25, animations: {
                self.centerRightImageView.alpha = 0
                self.upRightImageView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.centerImageView.alpha = 0
                self.upImageView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.25, animations: {
                self.turnUp()
                //#-editable-code
                self.moveUp()
                //#-end-editable-code
            })
            UIView.addKeyframe(withRelativeStartTime: 0.61, relativeDuration: 0.25, animations: {
                self.centerLeftImageView.alpha = 0
                self.upLeftImageView.alpha = 0
                self.nuhImageView.alpha = 0
                self.view.backgroundColor = .black
            })
        }, completion: nil)

        //Start a background sound
        self.playSound()
    }

    //Functions for the movements of Nuh
    func moveRight() {
        self.nuhImageView.center.x = self.view.frame.width - self.view.frame.width / 3 + self.nuhImageView.frame.width / 2
    }

    func moveLeft() {
        self.nuhImageView.center.x = self.view.frame.width / 3 - self.nuhImageView.frame.width / 2
    }

    func moveDown() {
        self.nuhImageView.center.y += self.view.frame.height / 3 - self.nuhImageView.frame.height / 3
    }

    func moveUp() {
        self.nuhImageView.center.y -= self.view.frame.height / 3 + self.nuhImageView.frame.height / 3
    }

    func turnLeft() {
        self.nuhImageView.transform = self.nuhImageView.transform.rotated(by: -1)
    }

    func turnUp() {
        self.nuhImageView.transform = self.nuhImageView.transform.rotated(by: 1)
    }

    //Function for the sounds of background
    var player: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "War", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

let viewController = ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = viewController

//: [Next](@next)

