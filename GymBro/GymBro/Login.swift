import SwiftUI

struct Login: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Login")
                    .font(.title)
                    .padding()

                Spacer()

                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .overlay { RoundedRectangle(cornerRadius: 10).stroke(Color.primary) }
                    .border(Color.red, width: CGFloat(wrongUsername)).cornerRadius(10)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .overlay { RoundedRectangle(cornerRadius: 10).stroke(Color.primary) }
                    .border(Color.red, width: CGFloat(wrongPassword)).cornerRadius(10)
                    .autocapitalization(.none)

                Button {
                    authenticateUser(username: username, password: password)
                } label: {
                    Text("Login")
                    .foregroundColor(Color.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }

                NavigationLink(destination: SignUp()) {
                    Text("Sign Up")
                        .foregroundColor(Color.blue)
                        .padding()
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $isLoggedIn) {
            ContentView(username: username)
        }
    }
    
    

    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "test" {
            wrongUsername = 0
            if password.lowercased() == "password" {
                wrongPassword = 0
                isLoggedIn = true
            } else {
                wrongPassword = 4
            }
        } else {
            wrongPassword = 4
            wrongUsername = 4
        }
    }
}

#Preview {
    Login()
}
