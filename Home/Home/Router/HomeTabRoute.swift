import Foundation
import UIKit
import Router

extension HomeTabRoute where Self: Router {
    public func makeHomeTab() -> UIViewController {
        let router = DefaultRouter(rootTransition: ModalTransition())
        let useCase = ListPokemonInjection.init().provideBase()
        let vc = ListPokemonViewController()
        let vm = DefaultListPokemonViewModel(router: router, useCase: useCase)
        vc.viewModel = vm
        vc.navigationItem.backButtonTitle = ""
        router.root = vc
        
        let navigation = UINavigationController(rootViewController: vc)
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemBlue
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigation.navigationBar.standardAppearance = navBarAppearance
        navigation.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigation.navigationBar.tintColor = .white
        navigation.tabBarItem.title = "Home"
        navigation.tabBarItem.image = UIImage(systemName: "house")
        navigation.navigationBar.prefersLargeTitles = false
        navigation.navigationBar.barStyle = .default
        navigation.navigationBar.backgroundColor = .gray
        return navigation
    }
    
    func toDetailPokemon(with transition: Transition, url: String) {
        let router = DefaultRouter(rootTransition: transition)
        let vc = DetailPokemonViewController()
        let useCase = DetailPokemonInjection.init().provideBase()
        let vm = DefaultDetailPokemonViewModel(useCase: useCase, router: router, url: url)
        vc.viewModel = vm
        vc.hidesBottomBarWhenPushed = true
        router.root = vc
        route(to: vc, as: transition)
    }
    
    func toPopUpError(with transisiton: Transition, errorMessage: String) {
        let router = DefaultRouter(rootTransition: transisiton)
        let vc = ErrorViewController()
        vc.error = errorMessage
        router.root = vc
        route(to: vc, as: transisiton)
    }
}

extension DefaultRouter: HomeTabRoute {
    public func toDetail(with url: String) {
        toDetailPokemon(with: PushTransition(), url: url)
    }
    
    public func popUpError(with errorMessage: String) {
        toPopUpError(with: ModalTransition(), errorMessage: errorMessage)
    }

}
