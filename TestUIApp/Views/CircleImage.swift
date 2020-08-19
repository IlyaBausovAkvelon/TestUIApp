import SwiftUI

struct CircleImage: View {

    /// Image name to load.
    var imageName: String

    /// Custom width for Circle.
    var width: CGFloat?

    /// Custom height for Circle.
    var height: CGFloat?

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: width ?? 100, height: height ?? 100)
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 5)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "cabbage")
    }
}
