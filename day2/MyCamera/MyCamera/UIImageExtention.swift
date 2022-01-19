//
//  UIImageExtention.swift
//  MyCamera
//
//  Created by 大塚友章 on 2022/01/19.
//

import Foundation
import UIKit

extension UIImage {
    func resize() -> UIImage? {
        let beforeImageSize:Int = NSData(data: self.jpegData(compressionQuality: 1)!).count
        
        print("before size:", beforeImageSize)
        let rate = 1024.0 / self.size.width
        let rect = CGRect(x: 0, y: 0, width: self.size.width * rate, height: self.size.height * rate)
        
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let afterImageSize:Int = NSData(data: image!.jpegData(compressionQuality: 1)!).count
        print("after size:", afterImageSize)
        return image
    }
}
