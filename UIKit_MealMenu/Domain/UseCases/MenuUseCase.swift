import Foundation

class MenuUseCase {
    private let menuRepository: MenuRepository

    init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }

    func getMenu() async throws -> Menu {
        try await menuRepository.fetchMenu()
    }
}
