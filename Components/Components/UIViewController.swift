import Foundation
import UIKit
import Toast_Swift

extension UIViewController {
    public func manageLoadingActivity(isLoading: Bool) {
        if isLoading {
            showLoadingActivity()
        } else {
            hideLoadingActivity()
        }
    }
    
    public func showLoadingActivity() {
        self.view.makeToastActivity(.center)
    }
    
    public func hideLoadingActivity() {
        self.view.hideToastActivity()
    }
}
