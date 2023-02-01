import Foundation
import RxRelay
import Router
import Components

protocol DetailPokemonViewModelInput {
    func getDetail(with url: String)
}

protocol DetailPokemonViewModelOutput {
    var detailPokemon: BehaviorRelay<DetailPokemonResponse?> { get }
    var state: BehaviorRelay<BaseViewState?> { get }
    var error: BehaviorRelay<String> { get }
}

protocol DetailPokemonViewModel: DetailPokemonViewModelInput, DetailPokemonViewModelOutput {}

final class DefaultDetailPokemonViewModel: DetailPokemonViewModel {
   
    let detailPokemon: BehaviorRelay<DetailPokemonResponse?> = BehaviorRelay.init(value: nil)
    let state: BehaviorRelay<BaseViewState?> = BehaviorRelay.init(value: .loading)
    let error: BehaviorRelay<String> = BehaviorRelay.init(value: "")
    private let useCase: DetailPokemonUseCaseProtocol
    private let router: Routes
    
    typealias Routes = HomeTabRoute
    
    init(
        useCase: DetailPokemonUseCaseProtocol,
        router: Routes,
        url: String
    ) {
        self.router = router
        self.useCase = useCase
        self.getDetail(with: url)
    }
}

extension DefaultDetailPokemonViewModel {
    func getDetail(with url: String) {
        self.state.accept(.loading)
        self.useCase.getDetailPokemon(with: url) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
            case .success(let data):
                self.detailPokemon.accept(data)
            }
        }
    }
}
