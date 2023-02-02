import Foundation
import Declayout
import RxSwift
import Components

final class DetailPokemonViewController: UIViewController {
    
    var viewModel: DetailPokemonViewModel?
    let bag = DisposeBag()
    
    private lazy var scrollView = ScrollViewContainer.make {
        $0.edges(to: view)
    }
    
    private var abilityTableViewHeight: NSLayoutConstraint? {
        didSet { abilityTableViewHeight?.activated() }
    }
    
    private var evolutionTableViewHeight: NSLayoutConstraint? {
        didSet { evolutionTableViewHeight?.activated() }
    }
    
    private lazy var header = DetailPokemonHeader()
    private lazy var descriptionPokemon = DetailPokemonDescription()
    private lazy var status = DetailPokemonStatus()
    private lazy var sectionButton = DetailPokemonChangeSectionView()
    private lazy var ability = DetailPokemonAbility()
    private lazy var spirites = DetailPokemonSpiritesView()
    
    private lazy var abilityTableView = UITableView.make {
        $0.delegate = self
        $0.dataSource = self
        $0.register(DetailPokemonAbilityCell.self, forCellReuseIdentifier: "DetailPokemonAbilityCell")
        $0.allowsMultipleSelectionDuringEditing = false
        $0.isScrollEnabled = false
    }
    
    private lazy var evolutionTableView = UITableView.make {
        $0.delegate = self
        $0.dataSource = self
        $0.register(DetailPokemonEvolutionCell.self, forCellReuseIdentifier: "DetailPokemonEvolutionCell")
        $0.allowsMultipleSelectionDuringEditing = false
        $0.isScrollEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        bind()
        subViews()
        configureTableView()
        configureButton()
        defaultSection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        abilityTableView.addObserver(self, forKeyPath: UITableView.contentSizeKeyPath, options: .new, context: nil)
        evolutionTableView.addObserver(self, forKeyPath: UITableView.contentSizeKeyPath, options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        abilityTableView.removeObserver(self, forKeyPath: UITableView.contentSizeKeyPath, context: nil)
        evolutionTableView.removeObserver(self, forKeyPath: UITableView.contentSizeKeyPath, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let newvalue = change?[.newKey], keyPath == UITableView.contentSizeKeyPath {
            let newsize  = newvalue as! CGSize
            self.scrollView.layoutIfNeeded()
            self.abilityTableViewHeight?.constant = newsize.height
            self.evolutionTableViewHeight?.constant = newsize.height
        }
    }
    
    private func bind() {
        self.viewModel?.detailPokemon.subscribe(onNext: { [weak self] data in
            guard let self = self, let data = data else { return }
            self.header.setContent(with: data)
            self.status.setContent(with: data)
            self.spirites.setContent(with: data)
        }).disposed(by: bag)
        
        self.viewModel?.listAbility.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.abilityTableView.reloadData()
        }).disposed(by: bag)
        
        self.viewModel?.state.subscribe(onNext: { [weak self] state in
            guard let self = self, let state = state else  { return }
            self.handleState(with: state)
        }).disposed(by: bag)
        
        self.viewModel?.listEvolution.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.evolutionTableView.reloadData()
        }).disposed(by: bag)
        
        self.viewModel?.detailPokemonSpecies.subscribe(onNext: { [weak self] data in
            guard let self = self, let data = data else { return }
            self.descriptionPokemon.setDescription(with: data)
        }).disposed(by: bag)
        
        self.viewModel?.imagesEvolution.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.evolutionTableView.reloadData()
        }).disposed(by: bag)
    }
    
    private func handleState(with state: BaseViewState) {
        switch state {
        case .loading:
            self.manageLoadingActivity(isLoading: true)
            self.scrollView.isHidden = true
        case .normal:
            self.manageLoadingActivity(isLoading: false)
            self.scrollView.isHidden = false
        case .empty:
            self.scrollView.isHidden = true
        }
    }
    
    private func subViews() {
        view.addSubviews([
            scrollView.addArrangedSubViews([
                header,
                descriptionPokemon,
                sectionButton,
                evolutionTableView,
                status,
                ability,
                abilityTableView,
                spirites
            ])
        ])
    }
    
    private func configureTableView() {
        abilityTableViewHeight = abilityTableView.heightAnchor.constraint(equalToConstant: 1)
        abilityTableViewHeight?.priority = UILayoutPriority.init(999)
        abilityTableViewHeight?.isActive = true
        
        evolutionTableViewHeight = evolutionTableView.heightAnchor.constraint(equalToConstant: 1)
        evolutionTableViewHeight?.priority = UILayoutPriority.init(999)
        evolutionTableViewHeight?.isActive = true
    }
    
    private func configureButton() {
        self.sectionButton.statLabelSelectCallBack = {
            self.statButtonDidTapped()
        }
        
        self.sectionButton.evolitionLabelSelectCallBack = {
            self.evolutionButtonDidTapped()
        }
    }
    
    private func statButtonDidTapped() {
        self.status.isHidden = false
        self.ability.isHidden = false
        self.abilityTableView.isHidden = false
        self.spirites.isHidden = false
        self.evolutionTableView.isHidden = true
    }
    
    private func evolutionButtonDidTapped() {
        self.status.isHidden = true
        self.ability.isHidden = true
        self.abilityTableView.isHidden = true
        self.spirites.isHidden = true
        
        self.evolutionTableView.isHidden = false
    }
    
    private func defaultSection() {
        self.evolutionTableView.isHidden = true
    }
}


extension DetailPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case abilityTableView:
            let count = self.viewModel?.listAbility.value.count ?? 0
            return count
        case evolutionTableView:
            if let firstEvo = self.viewModel?.listEvolution.value?.chain?.evolvesTo?.count, let secondEvo = self.viewModel?.listEvolution.value?.chain?.evolvesTo?[0].evolvesTo?.count {
                if secondEvo != 0 {
                    return 2
                } else if firstEvo != 0 {
                    return 1
                } else {
                    return 0
                }
            } else {
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case abilityTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPokemonAbilityCell",
                                                     for: indexPath) as! DetailPokemonAbilityCell
            cell.setContent(with: self.viewModel?.listAbility.value[indexPath.row].flavorTextEntries?.first?.flavorText ?? "-",
                            title: self.viewModel?.listAbility.value[indexPath.row].name ?? "Empty Ability")
            return cell
        case evolutionTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPokemonEvolutionCell",
                                                     for: indexPath) as! DetailPokemonEvolutionCell
            guard let data = self.viewModel?.listEvolution.value, let images = self.viewModel?.imagesEvolution.value  else { return UITableViewCell() }
            cell.setContent(with: data, indexPath: indexPath, image: images)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
