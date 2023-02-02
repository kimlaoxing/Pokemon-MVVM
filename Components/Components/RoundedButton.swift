import Declayout
import UIKit

public class RoundedButton: UIView {
    
    private lazy var container = UIView.make {
        $0.height(Padding.NORMAL_CONTENT_INSET * 0.7)
        $0.layer.cornerRadius = 15
        $0.edges(to: self)
        $0.backgroundColor = .systemBlue
    }
    
    private lazy var label = UILabel.make {
        $0.verticalPadding(to: container)
        $0.horizontalPadding(to: container, Padding.reguler)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textAlignment = .center
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
            container.addSubviews([
                label
            ])
        ])
    }
    
    public func setContent(with title: String) {
        label.text = title
    }
    
    public func setContentWhenTapped() {
        label.textColor = .white
        self.container.backgroundColor = .systemBlue
    }
    
    public func setContentWhenDidTapped() {
        label.textColor = .systemBlue
        self.container.backgroundColor = .white
    }
}
