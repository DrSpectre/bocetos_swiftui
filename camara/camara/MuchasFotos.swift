//
//  MuchasFotos.swift
//  camara
//
//  Created by Jadzia Gallegos on 29/04/25.
//
import SwiftUI
import PhotosUI

struct segunda_pantitlan: View {
    @State private var imagen_avatar: [UIImage] = []
    @State private var photo_selc: [PhotosPickerItem] = []
    
    var body: some View {
        VStack{
            PhotosPicker("Selecciona fotos del caso", selection: $photo_selc, maxSelectionCount: 5, selectionBehavior: .ordered, matching: .images)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<imagen_avatar.count, id: \.self){ indicie in
                        Image(uiImage: imagen_avatar[indicie])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                    }
                }
            }
        }
        .onChange(of: photo_selc){ _, _ in
            Task {
                for foto in photo_selc{
                    if let datos = try? await foto.loadTransferable(type: Data.self) {
                        if let imagen = UIImage(data: datos){
                            imagen_avatar.append(imagen)
                        }
                        
                    }
                }
                photo_selc.removeAll()
            }

        }
    }
}


#Preview {
    segunda_pantitlan()
}
