//start hidden here
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

    var myView = UIView()

    override public func loadView() {
        super.loadView()


        myView = UIView()
        myView.backgroundColor = UIColor(hex: 0x737779)
        //Creating the view
//        let view = UIView()
//        view.backgroundColor = UIColor(hex: 0x737779)
//        self.view = view


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
        UIView.animateKeyframes(withDuration: 15, delay: 1, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                //end hidden here
                //#-editable-code
                self.moveUp()
                //#-end-editable-code
                //#-hidden-code
                //self.view.alpha = 0.7
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.turnLeft()
                //self.view.alpha = 0.3
                //#-end-hidden-code
                //#-editable-code
                self.moveLeft()
                //#-end-editable-code
                //#-hidden-code
            })
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.25, animations: {
                self.turnUp()
                //#-end-hidden-code
                //#-editable-code
                self.moveUp()
                //#-end-editable-code
                ////#-hidden-code
                self.view.alpha = 0
            })
        }, completion: nil)

        self.playSound()
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewConstraints()
        self.view = myView
    }

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

//#-end-hidden-code

//: [Next](@next)

