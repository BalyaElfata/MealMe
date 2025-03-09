//import Foundation
//
//protocol MenuRepository {
//    func fetchMenus() async throws -> [Menu]
//}
//
//class DefaultMenuRepository: MenuRepository {
//    private let networkService: NetworkService
//
//    init(networkService: NetworkService) {
//        self.networkService = networkService
//    }
//
//    func fetchMenus() async throws -> [Menu] {
//        let menuData = try await networkService.getMenus()
//        return menuData.meals.map { menuDTO in
//            Menu(
//                name: menuDTO.name,
//                label: menuDTO.label,
//                image: menuDTO.image,
//                instructions: menuDTO.instructions,
//                youtubeLink: menuDTO.youtubeLink,
//                ingredients: [
//                    menuDTO.ingredient1, menuDTO.ingredient2, menuDTO.ingredient3,
//                    menuDTO.ingredient4, menuDTO.ingredient5, menuDTO.ingredient6,
//                    menuDTO.ingredient7, menuDTO.ingredient8, menuDTO.ingredient9,
//                    menuDTO.ingredient10, menuDTO.ingredient11, menuDTO.ingredient12,
//                    menuDTO.ingredient13, menuDTO.ingredient14, menuDTO.ingredient15,
//                    menuDTO.ingredient16, menuDTO.ingredient17, menuDTO.ingredient18,
//                    menuDTO.ingredient19, menuDTO.ingredient20
//                ].compactMap { $0 },
//                measures: [
//                    menuDTO.measure1, menuDTO.measure2, menuDTO.measure3,
//                    menuDTO.measure4, menuDTO.measure5, menuDTO.measure6,
//                    menuDTO.measure7, menuDTO.measure8, menuDTO.measure9,
//                    menuDTO.measure10, menuDTO.measure11, menuDTO.measure12,
//                    menuDTO.measure13, menuDTO.measure14, menuDTO.measure15,
//                    menuDTO.measure16, menuDTO.measure17, menuDTO.measure18,
//                    menuDTO.measure19, menuDTO.measure20
//                ].compactMap { $0 }
//            )
//        }
//    }
//}
