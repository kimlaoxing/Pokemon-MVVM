import UIKit

public protocol HomeTabRoute {
    func makeHomeTab() -> UIViewController
    func popUpError(with errorMessage: String)
    func toDetail(with url: String)
}
