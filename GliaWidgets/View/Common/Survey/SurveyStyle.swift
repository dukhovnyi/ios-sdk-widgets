import UIKit

// TODO: docs
public class SurveyStyle {
    public var title: Title
    public var dimmedBackgroundColor: UIColor
    public var backgroundColor: UIColor
    public var cornerRadius: CGFloat

    public init(
        dimmedBackgroundColor: UIColor,
        backgroundColor: UIColor,
        cornerRadius: CGFloat,
        title: Title
    ) {
        self.dimmedBackgroundColor = dimmedBackgroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.title = title
    }
}

extension SurveyStyle {
    public class Title {
        public var font: UIFont
        public var color: UIColor

        public init(
            font: UIFont,
            color: UIColor
        ) {
            self.font = font
            self.color = color
        }
    }
}
