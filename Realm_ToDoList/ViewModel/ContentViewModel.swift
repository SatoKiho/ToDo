import SwiftUI
import RealmSwift

class ContentViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var desc: String = ""
    @Published var updatingToDo: ToDoItem? = nil
    @Published var todos: [ToDoItem] = []
    @Published var cards : [ToDoItem] = []
    @Published var openNewPage = false

    
//    func fetchData() {
//        guard let dbRef = try! Realm() else { return }
//        let results = dbRef.objects(ToDoItem.self)
//        self.todoItem = results.compactMap({(ToDoItem) -> ToDoItem? in
//        return todoItem})
//    }
    
    init () {
        fetchTodos()
    }
    
    func fetchTodos() {
        self.todos = ToDoItem.fetchAllTodo()!
    }
    
    func addTodo() {
//        if title == "" || desc == "" { return }
        ToDoItem.addTodo(title: title, desc: desc)
        self.title = ""
        self.desc = ""
        fetchTodos()
        
//        presentation.wrappedValue.dismiss()
    }
    
    func updataTodo() {
        ToDoItem.updateTodo(todo: updatingToDo!, newTitle: self.title, newDesc: self.desc)
        self.title = ""
        self.desc = ""
        updatingToDo = nil
        fetchTodos()
    }
    
//    func updataTodo() {
//        guard let todoToUpdate = updatingToDo else {
//            // もしくは適切な処理を行う
//            print("Error: updatingToDo is nil")
//            return
//        }
//
//        ToDoItem.updateTodo(todo: todoToUpdate, newTitle: self.title, newDesc: self.desc)
//        self.title = ""
//        self.desc = ""
//        updatingToDo = nil
//        fetchTodos()
//    }

    
    func deleteTodo(todo: ToDoItem) {
        ToDoItem.deleteTodo(todo: todo)
        fetchTodos()
    }
    

//        guard let dbRef = try! Realm() else { return }
//        try? dbRef.write{
//            dbRef.add(todoItem)
//        }
    static let shared = ContentViewModel()
}


//入力欄がnilのやつ書く
//



