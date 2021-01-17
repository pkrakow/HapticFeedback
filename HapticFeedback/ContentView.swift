//
//  ContentView.swift
//  HapticFeedback
//
//  Created by Paul on 1/17/21.
//

import SwiftUI
import UIKit

let impact = UIImpactFeedbackGenerator() // 1

func onePressed(_ sender: Any) {
    impact.impactOccurred() // 2
}

let selection = UISelectionFeedbackGenerator()

func twoPressed(_ sender: Any) {
    selection.selectionChanged()
}

let notification = UINotificationFeedbackGenerator()

func successPressed(_ sender: Any) {
    notification.notificationOccurred(.success)
}

func warningPressed(_ sender: Any) {
    notification.notificationOccurred(.warning)
}

func errorPressed(_ sender: Any) {
    notification.notificationOccurred(.error)
}


struct ContentView: View {
    var body: some View {
        VStack {
            
            Button("impact") {
                onePressed(impact)
                playKeyPressedOne()
            } .padding()
            
            Button("selection") {
                twoPressed(selection)
                playSound(sound: "Bell-Tree", type: "mp3")
            } .padding()
            
            Button("success") {
                successPressed(notification)
                playKeyPressedOne()
            } .padding()
            
            Button("warning") {
                warningPressed(notification)
                playKeyPressedTwo()
            } .padding()
            
            Button("error") {
                errorPressed(notification)
                playKeyPressedThree()
            } .padding()
        }
    }
    
    func noOp() -> Void {
        return
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
