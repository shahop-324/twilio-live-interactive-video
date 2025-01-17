//
//  Copyright (C) 2021 Twilio, Inc.
//

import SwiftUI

struct EnterUserIdentityView: View {
    @State private var userIdentity = ""
    @State private var isShowingPasscodeView = false

    var body: some View {
        NavigationView {
            FormStack {
                Image("RedTwilioLogo")
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome to:")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.textWeak)
                    
                    // Had to force a new line because it was wrapping too early. It looked like it was trying to
                    // make both lines similar width which is not what UX design was going for.
                    Text("Twilio Live Video\nEvents")
                        .modifier(TitleStyle())
                }
                
                Text("What's your name?")
                    .modifier(TipStyle())

                TextField("Full name", text: $userIdentity)
                    .textFieldStyle(FormTextFieldStyle())
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                
                Button("Continue") {
                    isShowingPasscodeView = true
                }
                .buttonStyle(PrimaryButtonStyle(isEnabled: !userIdentity.isEmpty))
                .disabled(userIdentity.isEmpty)
                .background(
                    /// Set the `NavigationLink` as background with 0 opacity so it is completely invisible and doesn't alter spacing
                    NavigationLink(
                        destination: EnterPasscodeView(userIdentity: userIdentity),
                        isActive: $isShowingPasscodeView
                    ) {
                        EmptyView()
                    }
                        .opacity(0)
                )
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EnterUserIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        EnterUserIdentityView()
    }
}
