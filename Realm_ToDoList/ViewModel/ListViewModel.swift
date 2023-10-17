import SwiftUI
import RealmSwift

class ListViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var desc: String = ""
    
    @Published var openNewPage = false
    
    @Published var cards : [ToDoItem] = []
    
    func addData() {
        let todoItem = ToDoItem()
        todoItem.title = title
        todoItem.desc = desc
        
                
                
    }

}


//入力欄がnilのやつ書く
//



