import UIKit
import SwiftUI

final class HeroRouter {
    var rootViewController: UINavigationController?
    
    func showDetails(for id: Int) {
        let detailVC = makeDetailViewController(id: id)
        rootViewController?.pushViewController(detailVC, animated: true)
    }

    private func makeDetailViewController(id: Int) -> UIViewController {
        let service = HeroServiceImpl()
        
        let detailView = HeroDetailView(heroId: id, service: service)
        
        return UIHostingController(rootView: detailView)
    }
}
