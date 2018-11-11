//
//  ProfileHomeViewController.swift
//  WorldSportsBuddies
//
//  Created by DCMac01 on 10/11/17.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit


protocol StarRatingDelegate {
    func ay_starRateChange(rate: CGFloat) -> Void;
}


class StarRatingView: UIView {
    
    private var totalStarNumber: Int!
    private var foregroundView: UIView!
    private var delegate: StarRatingDelegate?
    
    var rate: CGFloat! = 0{
        didSet{
            var rect = foregroundView.frame
            rect.size.width = self.frame.width * rate
            foregroundView.frame = rect
        }
    }
    
    var isChange: Bool!
    

    init(frame: CGRect, totalStarts: Int = 5, delegate: StarRatingDelegate? = nil) {
        super.init(frame: frame)
        totalStarNumber = totalStarts
        self.delegate = delegate
        self.addSubview(self.ay_creatStartView("starEmpty"))
        foregroundView = self.ay_creatStartView("starFull")
        self.addSubview(foregroundView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func ay_creatStartView(_ imageName: String) -> UIView {
        let starView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        starView.clipsToBounds = true
        starView.backgroundColor = UIColor.clear
        starView.isUserInteractionEnabled = false
        let imgViewWidth = (self.frame.width - CGFloat(totalStarNumber - 1) * 3) / CGFloat(totalStarNumber)
        
        for i in 0 ..< totalStarNumber {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = CGRect(x: CGFloat(i) * (imgViewWidth + 3), y: 0, width: imgViewWidth, height: self.frame.height)
            imageView.contentMode = .scaleAspectFit
            starView.addSubview(imageView)
        }
        return starView
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isChange == true {
            let touch = touches.first
            let point = touch?.location(in: self)
            if (point?.x)! >= CGFloat(0) && (point?.x)! <= self.frame.width {
                rate = (point?.x)! / self.frame.width
                delegate?.ay_starRateChange(rate: rate)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isChange == true {
            let touch = touches.first
            let point = touch?.location(in: self)
            rate = (point?.x)! / self.frame.width
            delegate?.ay_starRateChange(rate: rate)
        }
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    
}
