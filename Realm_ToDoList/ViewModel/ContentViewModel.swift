import SwiftUI
import RealmSwift

class ContentViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var desc: String = ""
//  ↓初期値はnil、updatingToDoが初期状態で値を持たないことを表す
    @Published var updatingTodo: ToDoItem? = nil
    @Published var todos: [ToDoItem] = []
    @Published var cards : [ToDoItem] = []
    @Published var openNewPage = false
    
    init () {
        fetchTodos()
    }
    
    func fetchTodos() {
        self.todos = ToDoItem.fetchAllTodo()!
    }
    // 追加
    func addTodo() {
//        if title == "" || desc == "" { return }
        ToDoItem.addTodo(title: title, desc: desc)
        self.title = ""
        self.desc = ""
        fetchTodos()
    }
    // 更新
    func updataTodo() {
        ToDoItem.updateTodo(todo: updatingTodo!, newTitle: self.title, newDesc: self.desc)
        self.title = ""
        self.desc = ""
        updatingTodo = nil
        fetchTodos()
    }
    //  削除
    func deleteTodo(todo: ToDoItem) {
        ToDoItem.deleteTodo(todo: todo)
        fetchTodos()
    }
    //  クリア（既リストキャンセル→新規作成時に空状態）
    func clearTodo() {
        self.title = ""
        self.desc = ""
    }
    
    static let shared = ContentViewModel()
}




