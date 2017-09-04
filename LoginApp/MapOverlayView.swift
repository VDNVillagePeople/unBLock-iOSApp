//
//  MapOverlayView.swift
//  UnBlock
//
//  Created by Danny Franklin on 8/16/17.
//  Copyright © 2017 VDN. All rights reserved.
//

import UIKit

class MapOverlayView: UIView, UIGestureRecognizerDelegate {

    var blocks: [Block] = []
    var xScale = CGFloat(0.0)
    var yScale = CGFloat(0.0)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let screenSize: CGRect = UIScreen.main.bounds
        let image: UIImage = UIImage(named: "EastVillageMap")!
        let screenWidth = image.size.width/image.size.height*screenSize.height
        
        xScale = screenWidth/image.size.width
        yScale = screenSize.height/image.size.height
        
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(self.handleTap(_:)))
        recognizer.delegate = self as UIGestureRecognizerDelegate
        self.addGestureRecognizer(recognizer)
        
        BlockService.sharedInstance.getBlocks(completion: handleBlocks(blocks:))
    }
    
    private func handleBlocks(blocks: [Block]) {
        print("handled")
        for curBlock in blocks {
            generateBezierPaths(block: curBlock)
        }
        
        self.blocks = blocks
        
        DispatchQueue.main.async(execute: {
            self.setNeedsDisplay()
        })
    }
    
    private func generateBezierPaths(block: Block) {
        let path = UIBezierPath()
        let points = block.block.bounds.points
        path.move(to: CGPoint(x:CGFloat(points[0].x) * xScale, y:CGFloat(points[0].y) * yScale))
        for i in 1...(points.count-1) {
            path.addLine(to: CGPoint(x:CGFloat(points[i].x) * xScale, y:CGFloat(points[i].y) * yScale))
        }
        path.close()
        
        block.set(bezierPath: path)
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        for block in blocks {
            if (block.bezierPath?.contains(sender.location(in: self)))! {
                print("Pressed")
            }
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {        
        for curBlock in blocks {
            drawBlock(block: curBlock)
        }
    }
    
    func drawBlock(block: Block) {
        //If you want to stroke it with a red color
        block.color!.set()
        block.bezierPath!.stroke()
        //If you want to fill it as well
        block.bezierPath!.fill(with:CGBlendMode.normal, alpha:0.3)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = block.bezierPath!.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = block.color!.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        layer.addSublayer(shapeLayer)
    }
    

}
