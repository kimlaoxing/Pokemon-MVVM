import Foundation
import UIKit
import Home
import Router

extension SceneDelegate {
    func willConnectTo(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        let mainRouter = DefaultRouter(rootTransition: ModalTransition())
        let tabs = [
            mainRouter.makeHomeTab()
        ]
        let home = TabBar(vc: tabs)
        home.selectedIndex = 0
        self.window?.rootViewController = home
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}
