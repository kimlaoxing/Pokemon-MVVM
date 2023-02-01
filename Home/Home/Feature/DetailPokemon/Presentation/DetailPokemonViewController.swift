import Foundation
import Declayout
import RxSwift
import UIKit
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
    
    private lazy var header = DetailPokemonHeader()
    private lazy var status = DetailPokemonStatus()
    private lazy var ability = DetailPokemonAbility()
    private lazy var spirites = DetailPokemonSpiritesView()
    
    private lazy var abilityTableView = UITableView.make {
        $0.delegate = self
        $0.dataSource = self
        $0.register(DetailPokemonAbilityCell.self, forCellReuseIdentifier: "DetailPokemonAbilityCell")
        $0.allowsMultipleSelectionDuringEditing = false
        $0.isScrollEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        bind()
        subViews()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        abilityTableView.addObserver(self, forKeyPath: UITableView.contentSizeKeyPath, options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        abilityTableView.removeObserver(self, forKeyPath: UITableView.contentSizeKeyPath, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let newvalue = change?[.newKey], keyPath == UITableView.contentSizeKeyPath {
            let newsize  = newvalue as! CGSize
            self.scrollView.layoutIfNeeded()
            self.abilityTableViewHeight?.constant = newsize.height
        }
    }
    
    private func bind() {
        self.viewModel?.detailPokemon.subscribe(onNext: { [weak self] data in
            guard let self = self, let data = data else { return }
            self.header.setContent(with: data)
            self.status.setContent(with: data)
            self.abilityTableView.reloadData()
            self.spirites.setContent(with: data)
        }).disposed(by: bag)
        
        self.viewModel?.listAbility.subscribe(onNext: { [weak self] data in
            guard let self = self, let data = data else { return }
            self.abilityTableView.reloadData()
        }).disposed(by: bag)
       
    }
    
    private func subViews() {
        view.addSubviews([
            scrollView.addArrangedSubViews([
                header,
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
    }
}


extension DetailPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel?.detailPokemon.value?.abilities?.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPokemonAbilityCell",
                                                 for: indexPath) as! DetailPokemonAbilityCell
        cell.setContent(with: "empty",
                        title: self.viewModel?.detailPokemon.value?.abilities?[indexPath.row].ability?.name ?? "Empty Ability")
        return cell
    }
}
