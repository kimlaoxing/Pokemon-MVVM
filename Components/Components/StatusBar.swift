import Declayout

public final class StatusBar: UIView {
    
    private lazy var container = UIStackView.make {
        $0.axis = .horizontal
        $0.spacing = Padding.double
        $0.edges(to: self)
    }
    
    private lazy var labelStack = UIStackView.make {
        $0.axis = .horizontal
        $0.spacing = Padding.reguler
        $0.distribution = .equalCentering
    }
    
    private lazy var nameStat = UILabel.make {
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .left
    }
    
    private lazy var numberStat = UILabel.make {
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .left
    }
    
    private lazy var statusBarBackground = UIView.make {
        $0.backgroundColor = .systemGray4
        $0.layer.cornerRadius = 5
        $0.width(200)
    }
    
    private lazy var statuBarFilled = UIView.make {
        $0.backgroundColor = .systemBlue
        $0.verticalPadding(to: statusBarBackground, 0)
        $0.layer.cornerRadius = 5
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
                labelStack.addArrangedSubviews([
                    nameStat,
                    numberStat,
                ]),
                statusBarBackground.addSubviews([
                    statuBarFilled
                ])
            ])
        ])
    }
    
    public func setContent(with nameStat: String, numberStat: String, statusBar: Int) {
        self.nameStat.text = nameStat
        self.numberStat.text = numberStat
        self.statuBarFilled.leading(to: statusBarBackground, 0)
        self.statuBarFilled.trailing(to: statusBarBackground, CGFloat(200 - statusBar * 2))
    }
}
