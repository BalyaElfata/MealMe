import Foundation

class MenuViewModel: ObservableObject {
    private let useCase: MenuUseCase
    @Published var menu: Menu?
    @Published var isLoading = false
    @Published var error: Error?
    
    init(useCase: MenuUseCase) {
        self.useCase = useCase
    }
    
    @MainActor
    func loadMenu(id: String) async {
        isLoading = true
        error = nil
        
        do {
            menu = try await useCase.getMenu()
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
}
