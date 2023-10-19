import SwiftUI
import RealmSwift

struct ContentView: View {
    //    sheet(モーダル)用
    @StateObject var modelData = ContentViewModel()
    @ObservedObject var viewModel = ContentViewModel.shared
    //    @State var taskData = [(title: viewModel.title, desc: viewModel.desc , completed: false)]
    
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(viewModel.todos) { todo in
                        VStack(alignment: .leading, spacing: 4) {
                            //  Button {
                            //                                    taskData[index].completed.toggle()
                            //                                } label: {
                            //                                    HStack(spacing: 12) {
                            //                                        Image(systemName: taskData[index].completed ? "checkmark.circle.fill" : "circle")
                            //                                            .foregroundColor(taskData[index].completed ? .green : .gray)
                            //                                        VStack {
                            //                                            Text(taskData[index].title)
                            //                                                .foregroundColor(.primary)
                            //                                            Text(taskData[index].desc)
                            //                                                .foregroundStyle(.gray)
                            //                                                .font(.caption)
                            //                                        }
                            //                                    }
                            //                                }
                            Text(todo.title)
                            Text(todo.desc)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
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
