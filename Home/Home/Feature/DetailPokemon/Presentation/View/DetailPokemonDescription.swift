import Declayout
import Components

final class DetailPokemonDescription: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.edges(to: self, Padding.reguler)
    }
    
    private lazy var descriptionPokemon = UILabel.make {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 0
        $0.textColor = .systemGray3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func subViews() {
        backgroundColor = .white
        addSubviews([
            container.addArrangedSubviews([
            descriptionPokemon
            ])
        ])
    }
    
    func setDescription(with data: DetailPokemonSpecies) {
        let text = data.flavorTextEntries?.first?.flavorText ?? ""
        let removedNumberOfLine = text.removingCharacters(from: .newlines)
        self.descriptionPokemon.text = removedNumberOfLine
    }
}
