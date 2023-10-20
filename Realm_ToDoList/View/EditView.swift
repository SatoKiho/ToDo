import SwiftUI
import RealmSwift

let editView = EditView()

struct EditView: View {
    @StateObject var modelData = ContentViewModel()
    @ObservedObject var viewModel = ContentViewModel.shared
    
    var body: some View {
        VStack {
            NavigationView {
                
                ForEach(viewModel.todos) { todo in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            
                            
                            
                            Text(todo.title)
                            Text(todo.desc)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                
                
                
            }
        }
    }
}

#Preview {
    EditView()
}
