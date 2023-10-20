import SwiftUI
import RealmSwift

struct ContentView: View {
    //    sheet(モーダル)用
    @StateObject var modelData = ContentViewModel()
    @ObservedObject var viewModel = ContentViewModel.shared
    //    @State var taskData = [(title: viewModel.title, desc: viewModel.desc , completed: false)]
    //  edit用の真偽値
//    @State var isshowingSheet = false
  
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(viewModel.todos) { todo in
                        Button(action: {
//                            modelData.openNewPage.toggle()
                            modelData.openNewPage.toggle()
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
                        .swipeActions(edge: .leading) {
                            Button {
                                viewModel.title = todo.title
                                viewModel.desc = todo.desc
                                
                            } label: {
                                Image(systemName: "pencil")
                            }
                            .tint(.green)
                        }
                    }
                }
                
                
                //  Navi＆Toolbar
                .navigationTitle("ToDo List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {modelData.openNewPage.toggle()}){
                            HStack(spacing: 2) {
                                Image(systemName: "plus")
                                Text("追加")
                            }
                        }
                        .sheet(isPresented: $modelData.openNewPage) {
                            AddView()
                                .environmentObject(modelData)
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
