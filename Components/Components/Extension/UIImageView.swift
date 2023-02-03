import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    public func makeRounded() {
         layer.borderWidth = 1
         layer.masksToBounds = false
         layer.borderColor = UIColor.white.cgColor
         layer.cornerRadius = self.frame.height / 2
         clipsToBounds = true
     }
    
    public func loadImage(url: String?, placeholder: UIImage? = nil) {
        guard let url = url, let urlImage = URL(string: url) else { return }
        self.sd_setImage(with: urlImage, placeholderImage: placeholder)
    }
}
