class EndScreenShareAlertProperties: AlertProperties {
    var items: [AlertItem] {
        [
           .title(configuration.title ?? L10n.Alert.ScreenSharing.Stop.title),
           .message(configuration.message ?? L10n.Alert.ScreenSharing.Stop.message),
           .actions([noAction, yesAction])
        ]
    }

    let showsCloseButton: Bool = false

    var noAction: AlertAction
    var yesAction: AlertAction

    private let configuration: ConfirmationAlertConfiguration

    init(configuration: ConfirmationAlertConfiguration) {
        self.configuration = configuration

        self.noAction = AlertAction(
            title: configuration.negativeTitle ?? L10n.Alert.Action.no,
            style: .regular
        )

        self.yesAction = AlertAction(
            title: configuration.positiveTitle ?? L10n.Alert.Action.yes,
            style: .destructive
        )
    }
}
