import UIKit
import SpreadsheetView

final public class SampleViewController: UIViewController {

    // MARK: - Builder

    public static func build() -> UIViewController {
        UIStoryboard(name: String(describing: self), bundle: .module).instantiateInitialViewController()!
    }

    // MARK: - Property

    private let colors: [UIColor] = [.systemBlue, .systemRed, .systemYellow, .systemPink, .systemOrange]

    @IBOutlet private weak var spreadsheetView: SpreadsheetView! {
        didSet {
            spreadsheetView.register(Cell.self, forCellWithReuseIdentifier: "SampleCell")
            spreadsheetView.dataSource = self
        }
    }
}

// MARK: - Property

extension SampleViewController: SpreadsheetViewDataSource {
    public func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: "SampleCell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row % 5]
        cell.backgroundView?.backgroundColor = colors[indexPath.row % 5]

        return cell
    }

    public func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        5
    }

    public func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        5
    }

    public func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow column: Int) -> CGFloat {
        view.bounds.height / 5.0
    }

    public func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
        view.bounds.width / 5.0
    }
}
