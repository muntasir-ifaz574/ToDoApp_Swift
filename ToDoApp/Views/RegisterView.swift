//
//  RegisterView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack{
            HeaderView(
                title: "Register",
                subtitle: "For never forget!",
                angel: -10,
                background: Color(hex: 0xFF7887C2).opacity(0.5)
            )
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
