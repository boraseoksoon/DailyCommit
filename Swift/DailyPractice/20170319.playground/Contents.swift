//: Playground - noun: a place where people can play

import UIKit

var str = "20170320 : Drawing Circle"

class CircleView : UIView {
    
    override func draw(_ rect: CGRect) {
        // imperative style drawing of traditional way
        let path = UIBezierPath()
        
        // x^2 + y^2 = r^2
        
        // cos(0) = x / r ==> x = r * cos(0)
        // sin(0) = y / r ==> y = r * sin(0)
        
        let radius =  Double(rect.width) / 2
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        path.move(to:CGPoint(x: center.x + CGFloat(radius), y: center.y))

        for i in stride(from:0, to:361.0, by:1) {
            
            /*
             radian = degree * Math.PI / 180
             degree = radian * 180 / Math.PI
             */
            
            let radians = i * Double.pi / 180
            
            print("i : \(i)")
            print("radians : \(radians)")
            print("center : \(center.x)")
            print("radius : \(radius)")
            
            let x = Double(center.x) + radius * cos(radians)
            let y = Double(center.y) + radius * sin(radians)
            
            path.addLine(to:CGPoint(x:x, y:y))
            // print(x,y)
        }

        path.lineWidth = 5
        path.stroke()
    }
}

let view = CircleView(frame:CGRect(x:0, y: 0, width: 300, height: 300))
view.backgroundColor = .blue


