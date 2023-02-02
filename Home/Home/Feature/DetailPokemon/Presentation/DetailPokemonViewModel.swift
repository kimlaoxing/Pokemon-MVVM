import Foundation
import RxRelay
import Router
import Components

protocol DetailPokemonViewModelInput {
    func getDetail(with url: String)
    func getListAbility(with url: String)
    func getListEvolution(with url: String)
    func getDetailPokemonSpecies(with id: Int)
    func getEvolutionImage(with name: String)
}

protocol DetailPokemonViewModelOutput {
    var detailPokemon: BehaviorRelay<DetailPokemonResponse?> { get }
    var listAbility: BehaviorRelay<[AbilityResponse]> { get }
    var listEvolution: BehaviorRelay<EvolutionChainsResponse?> { get }
    var detailPokemonSpecies: BehaviorRelay<DetailPokemonSpecies?> { get }
    var state: BehaviorRelay<BaseViewState?> { get }
    var error: BehaviorRelay<String> { get }
    var imagesEvolution: BehaviorRelay<[String]> { get }
}

protocol DetailPokemonViewModel: DetailPokemonViewModelInput, DetailPokemonViewModelOutput {}

final class DefaultDetailPokemonViewModel: DetailPokemonViewModel {
    
    let imagesEvolution: BehaviorRelay<[String]> = BehaviorRelay.init(value: [])
    let listEvolution: BehaviorRelay<EvolutionChainsResponse?> = BehaviorRelay.init(value: nil)
    let detailPokemon: BehaviorRelay<DetailPokemonResponse?> = BehaviorRelay.init(value: nil)
    let listAbility: BehaviorRelay<[AbilityResponse]> = BehaviorRelay.init(value: [])
    let detailPokemonSpecies: BehaviorRelay<DetailPokemonSpecies?> = BehaviorRelay.init(value: nil)
    let state: BehaviorRelay<BaseViewState?> = BehaviorRelay.init(value: .loading)
    let error: BehaviorRelay<String> = BehaviorRelay.init(value: "")
    
    var abilities: [AbilityResponse] = []
    var imageEvolution: [String] = []
    
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
                self.state.accept(.normal)
                self.detailPokemon.accept(data)
                if let abilities = data.abilities, let id = data.id {
                    self.getDetailPokemonSpecies(with: id)
                    for url in abilities {
                        self.getListAbility(with: url.ability?.url ?? "")
                    }
                }
            }
        }
    }
    
    func getListAbility(with url: String) {
        self.state.accept(.loading)
        self.useCase.getListAbility(with: url) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
            case .success(let data):
                self.state.accept(.normal)
                self.abilities.append(data)
                self.listAbility.accept(self.abilities)
            }
        }
    }
    
    func getListEvolution(with url: String) {
        self.state.accept(.loading)
        self.useCase.getListEvolutionChain(with: url) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
            case .success(let data):
                self.state.accept(.normal)
                self.listEvolution.accept(data)
                self.getEvolutionImage(with: data.chain?.species?.name ?? "")
                
                if let firstEvo = data.chain?.evolvesTo?.first?.species?.name {
                    self.getEvolutionImage(with: firstEvo)
                }
                
                if let secondEvo = data.chain?.evolvesTo?[0].evolvesTo?.first?.species?.name {
                    self.getEvolutionImage(with: secondEvo)
                }
            }
        }
    }
    
    func getDetailPokemonSpecies(with id: Int) {
        self.state.accept(.loading)
        self.useCase.getDetailPokemonSpecies(with: id) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
            case .success(let data):
                self.state.accept(.normal)
                self.detailPokemonSpecies.accept(data)
                self.getListEvolution(with: data.evolutionChain?.url ?? "")
            }
        }
    }
    
    func getEvolutionImage(with name: String) {
        self.state.accept(.loading)
        self.useCase.getDetailPokemonWithName(with: name) { data in
            switch data {
            case .failure(let error):
                self.error.accept("\(error)")
            case .success(let data):
                self.state.accept(.normal)
                if let image = data.sprites?.other?.officialArtwork?.frontDefault {
                    self.imageEvolution.append(image)
                    self.imagesEvolution.accept(self.imageEvolution)
                }
            }
        }
    }
}
