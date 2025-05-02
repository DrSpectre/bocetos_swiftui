//
//  ContentView.swift
//  camara
//
//  Created by Jadzia Gallegos on 29/04/25.
//

import SwiftUI
import PhotosUI

@MainActor
final class PhotoPickerModel: ObservableObject{
    @Published private(set) var imagen_seleccionada: UIImage? = nil
    @Published var imagen_escogida: PhotosPickerItem? = nil {
        didSet{
            establecer_iamgen(from: imagen_escogida)
        }
    }
    
    private func establecer_iamgen(from seleccion: PhotosPickerItem?){
        guard let seleccion else { return }
        
        Task {
            if let datos = try? await seleccion.loadTransferable(type: Data.self){
                if let uiImagen = UIImage(data: datos){
                    imagen_seleccionada = uiImagen
                    return
                }
            }
        }
    }
    
    
}

struct ContentView: View {
    @StateObject var modelo = PhotoPickerModel()
    
    var body: some View {
        VStack {
            if let imagen = modelo.imagen_seleccionada {
                Image(uiImage: imagen)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
            }
            
            PhotosPicker(selection: $modelo.imagen_escogida, label: { Text("<->")
                .foregroundColor(Color.gray)} )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
