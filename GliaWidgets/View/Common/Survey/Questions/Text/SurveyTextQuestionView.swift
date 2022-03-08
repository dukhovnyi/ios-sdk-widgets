import UIKit
import PureLayout

final class SurveyTextQuestionView: UIView {
    private let textView = UITextView()
    private let stackView = UIStackView()

    init() {
        super.init(frame: .zero)

        setup()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        stackView.axis = .vertical
    }

    private func layout() {
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges()

        stackView.addArrangedSubview(textView)
        textView.autoSetDimension(.height, toSize: 96)
    }
}
