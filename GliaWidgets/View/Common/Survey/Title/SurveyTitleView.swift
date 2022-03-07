import UIKit

final class SurveyTitleView: UIView {
    var title: String? {
        didSet {
            label.text = title
        }
    }

    private let style: SurveyStyle.Title
    private let label = UILabel()

    init(style: SurveyStyle.Title) {
        self.style = style

        super.init(frame: .zero)

        setup()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        label.numberOfLines = 0
        label.font = style.font
        label.textColor = style.color
        label.textAlignment = .center
    }

    private func layout() {
        addSubview(label)
        label.autoPinEdgesToSuperviewEdges(with: .uniform(24))
    }
}
