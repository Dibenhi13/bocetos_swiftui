//
//  menu_principal_series.swift
//  mvvm
//
//  Created by alumno on 3/21/25.
//

import SwiftUI

struct MenuPrincipalSeries: View {
    @Environment (VistaModeloBasico.self) var controlador
    var body: some View {
        ScrollView{
            VStack {
                ForEach(controlador.series_registradas){_ in
                    Image(systemName: "plus")
                }
            }
            .padding()
        }
        Spacer()
        
        Button("Agrega una serie de prueba"){
            controlador.cambiar_a_agregar_serie()
        }
    }
}

#Preview {
    MenuPrincipalSeries()
        .environment(VistaModeloBasico())
}
