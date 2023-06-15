//
//  HeaderView.swift
//  ToDoApp
//
//  Created by Muntasir Efaz on 6/15/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color(hex: 0xFFC6EAE9))
                .rotationEffect(Angle(degrees: 10))
                .frame(height: 300)
            
            VStack(spacing: 10) {
                Text("To Do")
                    .foregroundColor(Color(hex: 0xFF102048))
                    .font(.system(size: 40, weight: .bold))
                Text("Never Forget")
                    .font(.system(size: 20))
                    .foregroundColor(Color(hex: 0xFF102048))
            }
            .padding(.top, 40)
        }
        .padding(.top, 80)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
