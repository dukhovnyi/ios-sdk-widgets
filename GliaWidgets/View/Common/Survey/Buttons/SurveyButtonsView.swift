import UIKit

final class SurveyButtonsView: UIView {
    var onCancel: (() -> Void)?
    var onSubmit: (() -> Void)?

    private lazy var cancelButton: ActionButton = {
        ActionButton(with: style.cancel)
    }()

    private lazy var submitButton: ActionButton = {
        ActionButton(with: style.submit)
    }()

    private let stackView = UIStackView()
    private let style: SurveyStyle.ButtonsStyle

    init(style: SurveyStyle.ButtonsStyle) {
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
        stackView.distribution = .fillEqually
        stackView.spacing = 16

        cancelButton.addTarget(
            self,
            action: #selector(cancelButtonTapped),
            for: .touchUpInside
        )
        submitButton.addTarget(
            self,
            action: #selector(submitButtonTapped),
            for: .touchUpInside
        )
    }

    private func layout() {
        addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges(with: .uniform(24))
        stackView.addArrangedSubviews([
            cancelButton,
            submitButton
        ])
    }

    @objc
    private func cancelButtonTapped() {
        onCancel?()
    }

    @objc
    private func submitButtonTapped() {
        onSubmit?()
    }
}
