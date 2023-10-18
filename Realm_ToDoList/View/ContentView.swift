import SwiftUI
import RealmSwift

//Realm取得


struct ContentView: View {
    @State var taskData = [(title: "aa", desc: "aa" , completed: false),
                           (title: "aa", desc: "aa" , completed: true)]
//    sheet(モーダル)用
    @StateObject var modelData = ContentViewModel()
    @ObservedObject var viewModel = ContentViewModel.shared
    
    
    var body: some View {
        VStack {
            NavigationView {
//                List(0..<taskData.count, id: \.self) { index in
//                    Button {
//                        taskData[index].completed.toggle()
//                    } label: {
//                        HStack(spacing: 12) {
//                            Image(systemName: taskData[index].completed ? "checkmark.circle.fill" : "circle")
//                                .foregroundColor(taskData[index].completed ? .green : .gray)
//                            VStack {
//                                Text(taskData[index].title)
//                                    .foregroundColor(.primary)
//                                Text(taskData[index].desc)
//                                    .foregroundStyle(.gray)
//                                    .font(.caption)
//                            }
//                        }
//                    }
//                    //  スワイプで操作系
//                    .swipeActions(edge: .trailing) {
//                        Button(action: {
////                            ToDoItem.deleteTodo(todo: ToDoItem)
//                        }, label: {
//                            Image(systemName: "trash")
//                        })
//                        .tint(.red)
//                    }
//                    .swipeActions(edge: .leading) {
//                        Button(action: {}, label: {
//                            Image(systemName: "checkmark.circle.fill")
//                        })
//                        .tint(.green)
//                    }
//                    
//                }
           
                    VStack {
                        List {
                            ForEach(modelData.cards) { card in
                                VStack {
                                    Text(card.title)
                                    Text(card.desc)
                                }
                                .frame(maxWidth: .infinity)
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
