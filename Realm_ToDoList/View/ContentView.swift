import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel.shared
  
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(viewModel.todos) { todo in
                        Button(action: {
                            viewModel.updatingTodo = todo
                            viewModel.title = todo.title
                            viewModel.desc = todo.desc
                            viewModel.openNewPage.toggle()
//                            viewModel.openNewPage ? viewModel.addTodo() : viewModel.updataTodo()
                            //  ↑ここに追加とほぼ同じ処理かける→入力された内容が反映させるようにする
                        }, label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {                  Text(todo.title)
                                        .foregroundColor(.black)
                                    Text(todo.desc)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        })
                                                
                        //  スワイプで操作系
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                viewModel.deleteTodo(todo: todo)
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
                    }
                }
                
                
                //  Navi＆Toolbar
                .navigationTitle("ToDo List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {viewModel.openNewPage.toggle()}){
                            HStack(spacing: 2) {
                                Image(systemName: "plus")
                                Text("新規作成")
                            }
                        }
                        .sheet(isPresented: $viewModel.openNewPage) {
                            AddView()
                        }
                    }
                }
            }
            
        }
        
    }
}



#Preview {
    ContentView()
}
