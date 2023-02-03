import Declayout

public final class BreedingAndCaptureComponents: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .vertical
        $0.edges(to: self)
        $0.spacing = Padding.reguler
    }
    
    private lazy var descriptionStack = UIStackView.make {
        $0.axis = .vertical
        $0.spacing = Padding.half
    }
    
    private lazy var titleLabel = UILabel.make {
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private lazy var descriptionTopLabel = UILabel.make {
        $0.textColor = .systemGray3
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private lazy var descriptionLowLabel = UILabel.make {
        $0.textColor = .systemGray3
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        subViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func subViews() {
        addSubviews([
            container.addArrangedSubviews([
                titleLabel,
                descriptionStack.addArrangedSubviews([
                    descriptionTopLabel,
                    descriptionLowLabel
                ])
            ])
        ])
    }
    
    public func setContent(with title: String, descriptionTop: String, descriptionLow: String) {
        self.titleLabel.text = title
        self.descriptionTopLabel.text = descriptionTop
        self.descriptionLowLabel.text = descriptionLow
    }
}
