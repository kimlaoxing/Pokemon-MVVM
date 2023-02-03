import UIKit
import Foundation

typealias UITableViewDataSourceDelegate = UITableViewDataSource & UITableViewDelegate
typealias UICollectionViewDataSourceDelegate = UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension UITableView {
    public static let contentSizeKeyPath = "contentSize"
    
    public func reloads() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
