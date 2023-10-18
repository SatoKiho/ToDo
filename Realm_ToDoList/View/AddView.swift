import SwiftUI
import RealmSwift

struct AddView: View {
//    @ObservedObject var viewModel = ContentViewModel()
    @ObservedObject var viewModel = ContentViewModel.shared

    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                    Section {
                        TextField("", text: $viewModel.title, axis: .vertical)
                            .lineLimit(1...5)
                            .onSubmit {
                                print("入力された値: \($viewModel.title)")
                            }
                    } header: {
                        Text("タイトル")
                    }
                
                Section {
                    TextField("", text: $viewModel.desc, axis: .vertical)
                } header: {
                    Text("メモ")
                }
                
            }
            .listStyle(GroupedListStyle())
            
            //  ↓titleとキャンセル
            .navigationTitle("新規作成")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("キャンセル")
                    })
                }
                
                //  追加
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
//                        viewModel.addTodo()
                        if ($viewModel.updatingTodo == nil) {
                            viewModel.addTodo()
                        } else {
                            viewModel.updatingToDo
                        }
                    }, label: {
                        Text("追加")
                    })
                }
            }
        }
        
        
    }
}

#Preview {
    AddView()
}
