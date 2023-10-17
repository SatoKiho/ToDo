import SwiftUI
import RealmSwift

//Realm取得


struct ContentView: View {
    @State var taskData = [(title: "aa", completed: false),
                           (title: "aa", completed: true)]
//    sheet(モーダル)用
    @StateObject var modelData = ListViewModel()
    
    
    
    var body: some View {
        VStack {
            NavigationView {
                List(0..<taskData.count, id: \.self) { index in
                    Button {
                        taskData[index].completed.toggle()
                    } label: {
                        HStack(spacing: 12) {
                            //  三項演算子でif省略型へ
                            Image(systemName: taskData[index].completed ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(taskData[index].completed ? .green : .gray)
                            Text(taskData[index].title)
                                .foregroundColor(.primary)
                        }
                    }
                    //  スワイプで操作系
                    .swipeActions(edge: .trailing) {
                        Button(action: {}, label: {
                            Image(systemName: "trash")
                        })
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {}, label: {
                            Image(systemName: "checkmark.circle.fill")
                        })
                        .tint(.green)
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
