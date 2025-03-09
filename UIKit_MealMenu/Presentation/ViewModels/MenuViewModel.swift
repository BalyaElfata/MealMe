//import Foundation
//
//class MenuViewModel: ObservableObject {
//    @Published var menus: [Menu] = []
//    private let fetchMenusUseCase: FetchMenusUseCase
//
//    init(fetchMenusUseCase: FetchMenusUseCase) {
//        self.fetchMenusUseCase = fetchMenusUseCase
//    }
//
//    func fetchMenus() async {
//        do {
//            let menus = try await fetchMenusUseCase.execute()
//            DispatchQueue.main.async {
//                self.menus = menus
//            }
//        } catch {
//            print("Failed to fetch menus: \(error)")
//        }
//    }
//}
