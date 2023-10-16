import SwiftUI
import RealmSwift


class ToDoItem: Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var title: String
    @Persisted var desc: String
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}


