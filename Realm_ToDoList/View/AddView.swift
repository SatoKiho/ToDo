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
            .navigationTitle(viewModel.updatingTodo == nil ? "ToDo作成" : "ToDoを編集")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        viewModel.clearTodo()
                        dismiss()
                    }, label: {
                        Text("キャンセル")
                    })
                }

                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        if !viewModel.title.isEmpty || !viewModel.desc.isEmpty {
                            //  もしnilなら新しいTodoを追加する操作
                            if (viewModel.updatingTodo == nil) {
                                viewModel.addTodo()
                            } else {
                                viewModel.updataTodo()
                            }
                            dismiss()
                        }
//                        viewModel.openNewPage = false
                    }, label: {
                        Text("追加")
                            .foregroundColor(viewModel.title.isEmpty && viewModel.desc.isEmpty ? .gray : .blue)
                    })
                }
                
            }
        }
        
        
    }
}

#Preview {
    AddView()
}
