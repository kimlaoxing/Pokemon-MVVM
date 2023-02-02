import Declayout
import Components

final class DetailPokemonAbilityCell: UITableViewCell {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.edges(to: contentView, Padding.reguler)
        $0.backgroundColor = .white
    }
    
    private lazy var titleLabel = UILabel.make {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .systemBlue
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    
    private lazy var descriptionLabel = UILabel.make {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .systemGray2
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subViews()
        contentView.backgroundColor = .white
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subViews() {
        contentView.addSubviews([
            container.addArrangedSubviews([
                titleLabel,
                descriptionLabel
            ])
        ])
    }
    
    func setContent(with ability: String, title: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = ability
    }
}
