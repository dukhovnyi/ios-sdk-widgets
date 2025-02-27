import UIKit

/// Style of a view showing user image.
public struct UserImageStyle {
    /// Placeholder image. It is shown if the user's image is not set or not available.
    public var placeholderImage: UIImage?

    /// Color of the placeholder image.
    public var placeholderColor: UIColor

    /// Color of the placeholder background.
    public var placeholderBackgroundColor: UIColor

    /// Background color of the image (in case it has transparency).
    public var imageBackgroundColor: UIColor

    /// 
    /// - Parameters:
    ///   - placeholderImage: Placeholder image.
    ///   - placeholderColor: Color of the placeholder image.
    ///   - placeholderBackgroundColor: Color of the placeholder background.
    ///   - imageBackgroundColor: Background color of the image (in case it has transparency).
    public init(
        placeholderImage: UIImage?,
        placeholderColor: UIColor,
        placeholderBackgroundColor: UIColor,
        imageBackgroundColor: UIColor
    ) {
        self.placeholderImage = placeholderImage
        self.placeholderColor = placeholderColor
        self.placeholderBackgroundColor = placeholderBackgroundColor
        self.imageBackgroundColor = imageBackgroundColor
    }
}
