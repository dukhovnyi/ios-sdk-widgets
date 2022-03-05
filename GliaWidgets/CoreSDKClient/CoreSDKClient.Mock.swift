#if DEBUG
import Foundation

extension CoreSdkClient {
    static let mock = Self(
        pushNotifications: .mock,
        createAppDelegate: { .mock },
        clearSession: {},
        fetchVisitorInfo: { _ in },
        updateVisitorInfo: { _, _ in },
        sendSelectedOptionValue: { _, _ in },
        configureWithConfiguration: { _, _ in },
        configureWithInteractor: { _ in },
        queueForEngagement: { _, _, _, _, _, _ in },
        requestMediaUpgradeWithOffer: { _, _ in },
        sendMessagePreview: { _, _ in },
        sendMessageWithAttachment: { _, _, _ in },
        cancelQueueTicket: { _, _ in },
        endEngagement: { _ in },
        requestEngagedOperator: { _ in },
        uploadFileToEngagement: { _, _, _ in },
        fetchFile: { _, _, _ in },
        getCurrentEngagement: { return nil }
    )
}

extension CoreSdkClient.PushNotifications {
    static let mock = Self(applicationDidRegisterForRemoteNotificationsWithDeviceToken: { _, _ in })
}

extension CoreSdkClient.AppDelegate {
    static let mock = Self(
        applicationDidFinishLaunchingWithOptions: { _, _ in false },
        applicationDidBecomeActive: { _ in }
    )
}

extension CoreSdkClient.EngagementFile {
    static func mock(id: String = "") -> CoreSdkClient.EngagementFile {
        .init(id: id)
    }

    static func mock(url: URL = .mock) -> CoreSdkClient.EngagementFile {
        .init(url: url)
    }

    static func mock(
        name: String = "",
        url: URL = .mock
    ) -> CoreSdkClient.EngagementFile {
        .init(
            name: name,
            url: url
        )
    }
}

extension CoreSdkClient.Salemove.Configuration {
    // swiftlint:disable force_try
    static func mock() -> Self {
        try! .init(
            siteId: "mockSiteId",
            region: .us,
            authorizingMethod: .mock
        )
    }
    // swiftlint:enable force_try
}

extension CoreSdkClient.Salemove.AuthorizationMethod {
    static let mock = Self.siteApiKey(id: "mockSiteApiKeyId", secret: "mockSiteApiKeySecret")

}

extension CoreSdkClient.VisitorContext {
    static let mock = CoreSdkClient.VisitorContext(type: CoreSdkClient.ContextType.page, url: "mockUrl")
}

#endif
