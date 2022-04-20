import SwiftUI
import SampleView

@main
struct SampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            AnyViewControllerRepresent(viewController: SampleViewController.build())
        }
    }
}

final class AnyViewControllerRepresent<ViewController: UIViewController>: UIViewControllerRepresentable {
    // MARK: - Property

    let viewController: ViewController

    // MARK: - Initializer

    init(viewController: ViewController) {
        self.viewController = viewController
    }

    // MARK: - Lifecycle

    func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
