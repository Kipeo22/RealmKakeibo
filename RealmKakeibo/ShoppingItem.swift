import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    
//    CategoryクラスをShoppingItemクラスの中に入れる　入れ子
    @Persisted var category: Category?
}
