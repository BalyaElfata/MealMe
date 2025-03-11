import Foundation

class MenuViewModel: ObservableObject {
    private let useCase: MenuUseCase
    @Published var menus: [Menu] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    init(useCase: MenuUseCase = MenuUseCase()) {
        self.useCase = useCase
    }
    
    @MainActor
    func loadMenu() async {
        isLoading = true
        error = nil
        
        do {
            menus = try await useCase.getAllMenus()
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
}
