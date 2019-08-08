//
//  ViewController.swift
//  Colors
//
//  Created by Eric Dolecki on 8/7/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var view_1:         UIView!
    var view_2:         UIView!
    var view_3:         UIView!
    var image_1:        UIImageView!
    var photoView_1:    UIView!
    var image_2:        UIImageView!
    var photoView_2:    UIView!
    var view_4:         UIView!
    var view_5:         UIView!
    var view_6:         UIView!
    var image_3:        UIImageView!
    var photoView_3:    UIView!
    var photoView_4:    UIView!
    var photoView_5:    UIView!
    var photoView_6:    UIView!
    var bigPhoto:       UIImageView!
    var bigView:        UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        // Seven boxes across.
        let bWidth: CGFloat = self.view.frame.width / 7
        
        view_1 = UIView(frame: CGRect(x: 0, y: 100, width: bWidth, height: bWidth))
        view_1.backgroundColor = UIColor.blue
        view_1.layer.cornerRadius = bWidth / 2
        
        view_2 = UIView(frame: CGRect(x: bWidth, y: 100, width: bWidth, height: bWidth))
        view_2.backgroundColor = UIColor.blue.mixLighter(amount: 0.3)
        view_2.layer.cornerRadius = bWidth / 2
        
        view_3 = UIView(frame: CGRect(x: bWidth * 2, y: 100, width: bWidth, height: bWidth))
        view_3.backgroundColor = UIColor.blue.mixLighter(amount: 0.3).mixLighter(amount: 0.3)
        view_3.layer.cornerRadius = bWidth / 2
        
        image_1 = UIImageView(frame: CGRect(x: bWidth * 3, y: 100, width: bWidth, height: bWidth))
        image_1.contentMode = .scaleAspectFill
        image_1.image = UIImage(named: "redhead")
        
        let redheadColors = image_1.image!.getColors(quality: .highest)
        photoView_1 = UIView(frame: CGRect(x: bWidth * 4, y: 100, width: bWidth, height: bWidth))
        photoView_1.backgroundColor = redheadColors?.background
        
        image_2 = UIImageView(frame: CGRect(x: bWidth * 5, y: 100, width: bWidth, height: bWidth))
        image_2.contentMode = .scaleAspectFill
        image_2.image = UIImage(named: "havana")
        
        let havanaColors = image_2.image!.getColors() //Default quality is high
        photoView_2 = UIView(frame: CGRect(x: bWidth * 6, y: 100, width: bWidth, height: bWidth))
        photoView_2.backgroundColor = havanaColors?.background

        view_4 = UIView(frame: CGRect(x: 0, y: bWidth + 100, width: bWidth, height: bWidth))
        view_4.backgroundColor = UIColor.gray
        view_4.layer.cornerRadius = bWidth / 2
        
        view_5 = UIView(frame: CGRect(x: bWidth, y: bWidth + 100, width: bWidth, height: bWidth))
        view_5.backgroundColor = UIColor.gray.mixDarker(amount: 0.3)
        view_5.layer.cornerRadius = bWidth / 2
        
        view_6 = UIView(frame: CGRect(x: bWidth * 2, y: bWidth + 100, width: bWidth, height: bWidth))
        view_6.backgroundColor = UIColor.gray.mixDarker(amount: 0.3).mixDarker(amount: 0.3)
        view_6.layer.cornerRadius = bWidth / 2
        
        let chill = UIImage(named: "chill")
        image_3 = UIImageView(frame: CGRect(x: bWidth * 3, y: bWidth + 100, width: bWidth, height: bWidth))
        image_3.image = chill
        
        photoView_3 = UIView(frame: CGRect(x: bWidth * 4, y: bWidth + 100, width: bWidth, height: bWidth))
        photoView_4 = UIView(frame: CGRect(x: bWidth * 5, y: bWidth + 100, width: bWidth, height: bWidth))
        photoView_5 = UIView(frame: CGRect(x: bWidth * 6, y: bWidth + 100, width: bWidth, height: bWidth))
        photoView_6 = UIView(frame: CGRect(x: 0, y: (bWidth * 2) + 100, width: bWidth, height: bWidth))

        // This is async. Takes a tiny bit of time.
        /*
        if let img = chill {
            img.getColors { colors in
                self.photoView_3.backgroundColor = colors?.background
            }
        }
        */
        
        // This is sync. It's quick.
        
        let myColors = chill!.getColors(quality: .highest)
        photoView_3.backgroundColor = myColors?.background  // Good for background color.
        photoView_4.backgroundColor = myColors?.primary     // Good for text color.
        photoView_5.backgroundColor = myColors?.secondary   // Good for text color too.
        photoView_6.backgroundColor = myColors?.detail      // Good for text color too.
        
        bigPhoto = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        bigPhoto.image = UIImage(named: "redhead")
        bigPhoto.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        let bigColors = bigPhoto.image!.getColors(quality: .highest)
        
        bigView = UILabel(frame: CGRect(x: bigPhoto.frame.origin.x, y: bigPhoto.frame.origin.y + bigPhoto.frame.height, width: 150, height: 25))
        bigView.font = UIFont.boldSystemFont(ofSize: 11.0)
        bigView.text = "ELVEN WARRIOR"
        bigView.textAlignment = .center
        bigView.textColor = bigColors?.primary
        bigView.backgroundColor = bigColors?.background
        
        self.view.addSubview(view_1)
        self.view.addSubview(view_2)
        self.view.addSubview(view_3)
        self.view.addSubview(image_1)
        self.view.addSubview(photoView_1)
        self.view.addSubview(image_2)
        self.view.addSubview(photoView_2)
        self.view.addSubview(view_4)
        self.view.addSubview(view_5)
        self.view.addSubview(view_6)
        self.view.addSubview(image_3)
        self.view.addSubview(photoView_3)
        self.view.addSubview(photoView_4)
        self.view.addSubview(photoView_5)
        self.view.addSubview(photoView_6)
        self.view.addSubview(bigPhoto)
        self.view.addSubview(bigView)
    }
}

extension UIColor {
    
    func mixLighter (amount: CGFloat = 0.25) -> UIColor {
        return mixWithColor(UIColor.white, amount:amount)
    }
    
    func mixDarker (amount: CGFloat = 0.25) -> UIColor {
        return mixWithColor(UIColor.black, amount:amount)
    }
    
    func mixWithColor(_ color: UIColor, amount: CGFloat = 0.25) -> UIColor {
        var r1     : CGFloat = 0
        var g1     : CGFloat = 0
        var b1     : CGFloat = 0
        var alpha1 : CGFloat = 0
        var r2     : CGFloat = 0
        var g2     : CGFloat = 0
        var b2     : CGFloat = 0
        var alpha2 : CGFloat = 0
        
        self.getRed (&r1, green: &g1, blue: &b1, alpha: &alpha1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
        return UIColor( red:r1*(1.0-amount)+r2*amount,
                        green:g1*(1.0-amount)+g2*amount,
                        blue:b1*(1.0-amount)+b2*amount,
                        alpha: alpha1 )
    }
}
