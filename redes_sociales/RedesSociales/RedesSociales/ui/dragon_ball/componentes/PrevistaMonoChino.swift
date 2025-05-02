//
//  PrevistaMonoChino.swift
//  RedesSociales
//
//  Created by Jadzia Gallegos on 28/04/25.
//

import SwiftUI

struct PrevistaMonoChino: View {
    var mono_chino: MonoChino
    
    var body: some View {
        Text("Este es de \(mono_chino.name)")
    }
}

