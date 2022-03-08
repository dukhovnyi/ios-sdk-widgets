import UIKit

final class SurveyQuestionsView: UIView {
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

    func addScaleQuestion() {

    }

    private func setup() {
        stackView.axis = .vertical
    }

    private func layout() {
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges(with: .uniform(24))
    }
}
