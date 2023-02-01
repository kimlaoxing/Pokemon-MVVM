import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    public func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    public func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: "\(link)") else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    public func makeRounded() {
         layer.borderWidth = 1
         layer.masksToBounds = false
         layer.borderColor = UIColor.white.cgColor
         layer.cornerRadius = self.frame.height / 2
         clipsToBounds = true
     }
    
    public func loadImage(uri: String?, placeholder: UIImage? = nil) {
        guard let uri = uri, let uriImage = URL(string: uri) else { return }
        self.sd_setImage(with: uriImage, placeholderImage: placeholder)
    }
}
