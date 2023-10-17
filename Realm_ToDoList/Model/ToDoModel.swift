import SwiftUI
import RealmSwift


class ToDoItem: Object, Identifiable {
//    @objc dynamicのがいいのか確認
//    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var title: String
    @Persisted var desc: String
//    override static func primaryKey() -> String? {
//        return "id"
//    }
}

//Realmに対して、新規要素追加、既存要素のプロパティ変更、要素削除 の操作はいずれも ”書き込み”となる
//func let updataData =

//新規の書く
//変更の書く
//削除の書く
