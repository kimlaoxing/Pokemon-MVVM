import Foundation
import Declayout
import Components

final class DetailPokemonChangeSectionView: UIView {
    
    var statLabelSelectCallBack: (() -> Void)?
    var evolitionLabelSelectCallBack: (() -> Void)?
    
    private lazy var container = UIStackView.make {
        $0.axis = .horizontal
        $0.horizontalPadding(to: self, Padding.double * 2)
        $0.verticalPadding(to: self, Padding.double)
        $0.distribution = .equalSpacing
    }
    
    private lazy var statsLabel = RoundedButton.make {
        $0.setContent(with: "STATS")
        $0.width(100)
        $0.isUserInteractionEnabled = true
    }
    
    private lazy var evolutionLabel = RoundedButton.make {
        $0.setContent(with: "EVOLUTION")
        $0.width(100)
        $0.isUserInteractionEnabled = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        subViews()
        configureButton()
        self.evolutionLabel.setContentWhenDidTapped()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func subViews() {
        addSubviews([
            container.addArrangedSubviews([
                statsLabel,
                evolutionLabel
            ])
        ])
    }
    
    private func configureButton() {
        let gestureStatLabel = UITapGestureRecognizer(target: self, action: #selector(stateLabelDidTapped))
        let gestureEvolutionLabel = UITapGestureRecognizer(target: self, action: #selector(evolutionLabelDidTapped))
        self.statsLabel.addGestureRecognizer(gestureStatLabel)
        self.evolutionLabel.addGestureRecognizer(gestureEvolutionLabel)
    }
    
    @objc private func stateLabelDidTapped() {
        self.statLabelSelectCallBack?()
        self.statsLabel.setContentWhenTapped()
        self.evolutionLabel.setContentWhenDidTapped()
    }
    
    @objc private func evolutionLabelDidTapped() {
        self.evolitionLabelSelectCallBack?()
        self.evolutionLabel.setContentWhenTapped()
        self.statsLabel.setContentWhenDidTapped()
    }
}


