import Declayout
import Components
import RxSwift
import RxCocoa

final class ListPokemonViewController: UIViewController {
    
    var viewModel: ListPokemonViewModel?
    private let bag = DisposeBag()
    
    private lazy var emptyView = EmptyDataView.make {
        $0.center(to: view)
        $0.title.text = "List is Empty."
        $0.title.font = .systemFont(ofSize: 12, weight: .bold)
        $0.title.numberOfLines = 0
        $0.button.isHidden = true
        $0.image.image = UIImage(systemName: "nosign")
        $0.image.width(100)
        $0.image.tintColor = .black
    }
    
    private lazy var tableView = UITableView.make {
        $0.edges(to: view)
        $0.delegate = self
        $0.dataSource = self
        $0.register(ListPokemonTableViewCell.self, forCellReuseIdentifier: "ListPokemonTableViewCell")
        $0.allowsMultipleSelectionDuringEditing = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subViews()
        bind()
        viewModel?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func subViews() {
        title = "Pokemon List"
        view.addSubviews([tableView])
        view.addSubviews([emptyView])
    }
    
    private func bind() {
        viewModel?.listPokemon.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.tableView.reloadData()
            if data.count == 0 {
                self.emptyView.isHidden = false
            }
        }).disposed(by: bag)
        
        viewModel?.detailPokemon.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            self.tableView.reloadData()
        }).disposed(by: bag)

        viewModel?.state.subscribe(onNext: { [weak self] state in
            guard let self = self else { return }
            self.handleState(with: state)
        }).disposed(by: bag)
    }
    
    private func handleState(with state: BaseViewState) {
        switch state {
        case .loading:
            self.tableView.isHidden = true
            self.emptyView.isHidden = true
        case .normal:
            self.tableView.isHidden = false
            self.emptyView.isHidden = true
        case .empty:
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
        }
    }
}

extension ListPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.detailPokemon.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPokemonTableViewCell",
                                                 for: indexPath) as! ListPokemonTableViewCell
        if let data = viewModel?.detailPokemon.value[indexPath.row] {
            cell.setContent(with: data)
        }
        
//        viewModel?.loadNextPage(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = viewModel?.listPokemon.value[indexPath.row].url {
            viewModel?.toDetail(with: url)
        } else {
            self.viewModel?.popUpError()
        }
    }
}
