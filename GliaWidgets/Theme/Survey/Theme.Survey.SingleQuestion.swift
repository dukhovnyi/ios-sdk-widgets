import Foundation

public extension Theme.SurveyStyle {
    struct SingleQuestion {
        public var title: Theme.Text
        public var optionText: Theme.Text

        static func `default`(
            color: ThemeColor,
            font: ThemeFont
        ) -> Self {
            .init(
                title: .init(
                    color: color.baseDark.hex,
                    fontSize: font.bodyText.pointSize,
                    fontWeight: 0.4
                ),
                optionText: .init(
                    color: color.baseDark.hex,
                    fontSize: font.bodyText.pointSize,
                    fontWeight: 0.1
                )
            )
        }
    }
}
