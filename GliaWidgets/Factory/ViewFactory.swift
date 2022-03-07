import UIKit

class ViewFactory {
    let theme: Theme
    let environment: Environment

    init(
        with theme: Theme,
        environment: Environment
    ) {
        self.theme = theme
        self.environment = environment
    }

    func makeChatView() -> ChatView {
        ChatView(
            with: theme.chat,
            environment: .init(
                data: environment.data,
                uuid: environment.uuid,
                gcd: environment.gcd
            )
        )
    }

    func makeCallView() -> CallView {
        CallView(
            with: theme.call,
            environment: .init(
                data: environment.data,
                uuid: environment.uuid,
                gcd: environment.gcd
            )
        )
    }

    func makeAlertView() -> AlertView {
        AlertView(with: theme.alert)
    }

    func makeBubbleView() -> BubbleView {
        BubbleView(
            with: theme.minimizedBubble,
            environment: .init(
                data: environment.data,
                uuid: environment.uuid,
                gcd: environment.gcd
            )
        )
    }

    func makeSurveyView() -> SurveyView {
        SurveyView(style: theme.survey)
    }
}

extension ViewFactory {
    struct Environment {
        var data: FoundationBased.Data
        var uuid: () -> UUID
        var gcd: GCD
    }
}
