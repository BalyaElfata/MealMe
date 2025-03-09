import Foundation

protocol FetchMenusUseCase {
    func execute() async throws -> [Menu]
}

class DefaultFetchMenusUseCase: FetchMenusUseCase {
    private let menuRepository: MenuRepository

    init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }

    func execute() async throws -> [Menu] {
        return try await menuRepository.fetchMenus()
    }
}
