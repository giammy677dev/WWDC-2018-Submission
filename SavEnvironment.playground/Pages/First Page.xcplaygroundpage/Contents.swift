//: Playground - noun: a place where people can play

//#-hidden-code
import UIKit
import PlaygroundSupport

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

let frameRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
let view = UIView(frame: frameRect)
let frameLabel = CGRect(x: 0, y: 0, width: 300, height: 50)

let sliderLabel = UILabel(frame: frameLabel)
sliderLabel.center.x = view.center.x

view.addSubview(sliderLabel)
view.backgroundColor = UIColor(hex: 0x55990B)

var timeLabel = UILabel(frame: frameLabel)
timeLabel.text = "Ciao"
timeLabel.center = view.center

var km: Int = 0
sliderLabel.text = "\(km)"

func modifyLabelValue(kilometers: Int) {
    km = kilometers
    sliderLabel.text = "\(km)"
}

view.addSubview(timeLabel)

PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
//#-editable-code
modifyLabelValue(kilometers: 90)
//#-end-editable-code

//#-hidden-code
if km >= 50 {
    timeLabel.text = "Con la macchina impieghi 30 minuti"
} else {
    timeLabel.text = "A piedi impieghi 5 minuti"
}
//#-end-hidden-code

//: [Next](@next)
