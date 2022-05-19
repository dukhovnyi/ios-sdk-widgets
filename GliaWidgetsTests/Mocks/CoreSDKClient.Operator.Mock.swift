import Foundation
import SalemoveSDK
@testable import GliaWidgets

extension CoreSdkClient.Operator {
    static var mock: CoreSdkClient.Operator {
        .init(
            id: "",
            name: "",
            picture: nil,
            availableMedia: nil
        )
    }
}
