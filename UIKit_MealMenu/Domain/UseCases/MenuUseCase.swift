import Foundation

class MenuUseCase {
    private let menuRepository: MenuRepository

    init(menuRepository: MenuRepository = MenuRepository()) {
        self.menuRepository = menuRepository
    }

    func getAllMenus() async throws -> [Menu] {
        try await menuRepository.fetchAllMenus()
    }
    
    func getFormattedIngredients(from menu: Menu) -> [String] {
        return menu.ingredients.map { "\($0.measure) \($0.name)" }
    }
}
