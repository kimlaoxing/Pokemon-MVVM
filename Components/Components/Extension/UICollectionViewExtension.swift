import Foundation
import UIKit

extension UICollectionView {
    
    public func reloads() {
        DispatchQueue.main.async {
            self.reloadData()
            self.invalidateIntrinsicContentSize()
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    private var defaultCollectionViewHeight: CGFloat {
        guard let refresh = refreshControl?.bounds else { return 0 }
        return refresh.height + 50
    }
    
    public var layoutContentSizeHeight: CGFloat {
        let height = collectionViewLayout.collectionViewContentSize.height
        return height != 0 ? height : defaultCollectionViewHeight
    }
}

