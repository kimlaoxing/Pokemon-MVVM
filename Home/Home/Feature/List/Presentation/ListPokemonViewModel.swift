import Foundation
import Components
import Router
import RxRelay

protocol ListPokemonViewModelOutput {
    func getListPokemon()
    func getDetail(with url: String)
    func viewDidLoad()
    func popUpError()
    func toDetail(with url: String)
}

protocol ListPokemonViewModelInput {
    var listPokemon: BehaviorRelay<[ListPokemonResult]> { get }
    var detailPokemon: BehaviorRelay<[DetailPokemonResult]> { get }
    var isLastPagePokemon: BehaviorRelay<Bool?> { get }
    var state: BehaviorRelay<BaseViewState> { get }
    var error: BehaviorRelay<String> { get }
}

protocol ListPokemonViewModel: ListPokemonViewModelInput, ListPokemonViewModelOutput { }

final class DefaultListPokemonViewModel: ListPokemonViewModel {
    
    let listPokemon: BehaviorRelay<[ListPokemonResult]> = BehaviorRelay.init(value: [])
    let detailPokemon: BehaviorRelay<[DetailPokemonResult]> = BehaviorRelay.init(value: [])
    let error: BehaviorRelay<String> = BehaviorRelay.init(value: "")
    let isLastPagePokemon: BehaviorRelay<Bool?> = BehaviorRelay.init(value: false)
    let state: BehaviorRelay<BaseViewState> = BehaviorRelay.init(value: .loading)
    var listDetail: [DetailPokemonResult] = []
    private let currentLimit = 20
    
    private let useCase: ListPokemonUseCaseProtocol
    private let router: Routes
    
    typealias Routes = HomeTabRoute
    
    init(router: Routes,
         useCase: ListPokemonUseCaseProtocol
    ) {
        self.useCase = useCase
        self.router = router
    }
    
    
    
    internal func viewDidLoad() {
        getListPokemon()
    }
    
    func popUpError() {
        self.router.popUpError(with: self.error.value)
    }
}

extension DefaultListPokemonViewModel {
    
    func toDetail(with url: String) {
        self.router.toDetail(with: url)
    }
    
    func getListPokemon() {
        self.state.accept(.loading)
        self.useCase.getListPokemon(with: self.currentLimit) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
                self.popUpError()
            case .success(let data):
                self.listPokemon.accept(data)
                for url in data {
                    self.getDetail(with: url.url)
                }
                self.state.accept(.normal)
            }
        }
    }
    
    func getDetail(with url: String) {
        self.state.accept(.loading)
        self.useCase.getDetailPokemon(with: url) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
                self.popUpError()
            case .success(let data):
                self.listDetail.append(data)
                self.detailPokemon.accept(self.listDetail.sorted(by: { $0.id < $1.id }))
                self.state.accept(.normal)
            }
        }
    }
}
