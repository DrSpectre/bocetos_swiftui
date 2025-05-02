//
//  SecondContentView.swift
//  camara
//
//  Created by Jadzia Gallegos on 29/04/25.
//
import SwiftUI
import PhotosUI


struct SegundaPantalla: View {
    @State private var imagen_avatar: UIImage? = nil
    @State private var photo_selc: PhotosPickerItem? = nil
    
    var body: some View {
        PhotosPicker(selection: $photo_selc, matching: .images) {
            Image(uiImage: imagen_avatar ?? UIImage(resource: ._0Aa1A30BA5Ff40Ec9D424Bedd2A2005C))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(.circle)
        }.onChange(of: photo_selc){ _, _ in
            Task {
                if let photo_selc,
                   let datos = try? await photo_selc.loadTransferable(type: Data.self) {
                    if let imagen = UIImage(data: datos){
                        imagen_avatar = imagen
                    }
                    
                }
            }
            photo_selc = nil
        }
    }
}

#Preview {
    SegundaPantalla()
}

