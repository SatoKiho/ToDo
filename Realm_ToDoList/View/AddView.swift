import SwiftUI
import RealmSwift

struct AddView: View {
    @ObservedObject var viewModel = ListViewModel()
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
            
            //  ↓titleと左右の機能
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
                //  入力されたら活性化する仕様いれる
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        
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
