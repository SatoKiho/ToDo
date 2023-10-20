import SwiftUI
import RealmSwift


class ToDoItem: Object, Identifiable {
//    @objc dynamicのがいいのか確認
    @Persisted var title: String
    @Persisted var desc: String
//    override static func primaryKey() -> String? {
//        return "id"
//    }

//    convenience init(title: String, desc: String) {
//        self.init()
//        self.title = title
//        self.desc = desc
//    }
}

//↓realmを開く
let realm = try! Realm()
//Realmに対して、新規要素追加、既存要素のプロパティ変更、要素削除 の操作はいずれも ”書き込み”となる
//memo:読み取り削除だけで一旦いいかも？
extension ToDoItem {
    // 追加
    static func addTodo(title: String, desc: String) {
        let todo = ToDoItem()
        todo.title = title
        todo.desc = desc
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(todo)
        }
    }
    
    // 更新
    static func updateTodo(todo: ToDoItem, newTitle: String, newDesc: String) {
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            todo.title = newTitle
            todo.desc = newDesc
        }
    }
    
    // 取得
    static func fetchAllTodo() -> [ToDoItem]? {
        guard let localRealm = try? Realm() else { return nil }
        let todos = localRealm.objects(ToDoItem.self)
        return Array(todos)
    }
    
    // 削除
    static func deleteTodo(todo: ToDoItem) {
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.delete(todo)
        }
    }
}
