import UIKit

class ChatFileContentView: UIView {
    enum Content {
        case localFile(LocalFile)
        case download(FileDownload)
    }

    private let style: ChatFileContentStyle
    private let content: Content
    private let tap: () -> Void
    private let accessibilityProperties: ChatFileContentView.AccessibilityProperties

    init(
        with style: ChatFileContentStyle,
        content: Content,
        accessibilityProperties: ChatFileContentView.AccessibilityProperties,
        tap: @escaping () -> Void
    ) {
        self.style = style
        self.content = content
        self.tap = tap
        self.accessibilityProperties = accessibilityProperties
        super.init(frame: .zero)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with file: LocalFile) {}
    func update(with download: FileDownload) {}

    func setup() {
        let fileValue: String?

        switch content {
        case .localFile(let file):
            fileValue = file.accessibilityProperties.value
            update(with: file)
        case .download(let download):
            fileValue = download.accessibilityProperties.value
            update(with: download)
            download.state.addObserver(self) { [weak self] _, _ in
                self?.update(with: download)
            }
        }

        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(tapped))
        addGestureRecognizer(tapRecognizer)

        let owner: String

        switch accessibilityProperties.from {
        case let .operator(operatorName):
            owner = operatorName
        case .visitor:
            owner = "You"
        }
        isAccessibilityElement = true
        accessibilityElements = []
        accessibilityLabel = "Attachment from \(owner)"
        accessibilityValue = fileValue
    }

    func layout() {}

    @objc private func tapped() {
        tap()
    }
}

extension ChatFileContentView {
    struct AccessibilityProperties {
        var from: From
    }
}

extension ChatFileContentView.AccessibilityProperties {
    enum From {
        case `operator`(String)
        case visitor
    }
}
