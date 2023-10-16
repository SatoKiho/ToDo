import SwiftUI
import RealmSwift

struct AddView: View {
    @State var title = ""
    @ObservedObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("タイトル", text: $viewModel.title)
                        .onSubmit {
                            print("入力された値: \(title)")
                        }
                }
                
                Section {
                    TextField("メモ", text: $viewModel.desc)
                }
            }
            
            //  ↓titleの時のサイズの書き方後で調べる
            .navigationTitle("新規作成")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("キャンセル", action: {
                    })
                }
                //  入力されたら活性化する仕様いれる
                ToolbarItem(placement: .primaryAction) {
                    Button("追加", action: {})
                }
            }
        }
        
        
    }
}

#Preview {
    AddView()
}
