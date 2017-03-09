//: Playground - noun: a place where people can play

import UIKit

var str = "Swift Daily Coding : 20170309"

// draw a required triangle given one side
class Triangle : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let graphicContext = UIGraphicsGetCurrentContext() else {
            return
        }
        
        graphicContext.beginPath()
        graphicContext.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        graphicContext.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
        graphicContext.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        graphicContext.closePath()
        
        graphicContext.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
        graphicContext.fillPath()
    }
}

let triangleFrame = CGRect(x: 10, y: 20, width: 25 , height: 30)
let triangle = Triangle(frame: triangleFrame)
triangle.backgroundColor = .white