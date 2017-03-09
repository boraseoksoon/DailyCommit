//: Playground - noun: a place where people can play

import UIKit


var str = "Swift Daily Coding : 20170309"

// function base
func drawRectangle(rectangleFrame: CGRect, backgroundColor: UIColor) -> UIView {
    let rectangle = UIView(frame:rectangleFrame)
    rectangle.backgroundColor = backgroundColor
    
    return rectangle
}

let simpleRectangle = drawRectangle(rectangleFrame:CGRect(x:0, y:0, width: 200, height: 200),
                                    backgroundColor: UIColor.red)

func drawCircle(circleFrame: CGRect, backgroundColor: UIColor) -> UIView {
    let circle = UIView(frame:circleFrame)
    circle.backgroundColor = backgroundColor
    
    circle.layer.masksToBounds = true
    circle.layer.cornerRadius = 25
    
    return circle
}

let simpleCircle = drawCircle(circleFrame: CGRect(x: 0, y: 0, width: 50, height: 50),
                              backgroundColor: UIColor.yellow)


class CrossButton: UIButton {
    var fillColor: UIColor = UIColor.blue
    var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //set up the width and height variables
        //for the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x:bounds.width/2 - plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x:bounds.width/2 + plusWidth/2 + 0.5,
            y:bounds.height/2 + 0.5))
        
        //Vertical Line
        if isAddButton {
            //move to the start of the vertical stroke
            plusPath.move(to: CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 - plusWidth/2 + 0.5))
            
            //add the end point to the vertical stroke
            plusPath.addLine(to: CGPoint(
                x:bounds.width/2 + 0.5,
                y:bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        //set the stroke color
        UIColor.white.setStroke()
        
        //draw the stroke
        plusPath.stroke()
        
    }
}

let customButton = CrossButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

// draw a required triangle given one side using CoreGraphics on Class
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



