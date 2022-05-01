//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// MARK: - FuelHomeAPIResponse
struct FuelHomeAPIResponse: Codable {
    let fecha: String
    let listaEESSPrecio: [ListaEESSPrecio]
    let nota: String
    let resultadoConsulta: String

    enum CodingKeys: String, CodingKey {
        case fecha = "Fecha"
        case listaEESSPrecio = "ListaEESSPrecio"
        case nota = "Nota"
        case resultadoConsulta = "ResultadoConsulta"
    }
}

// MARK: - ListaEESSPrecio
struct ListaEESSPrecio: Codable {
    let cp: String
    let dirección: String
    let horario: String
    let latitud: String
    let localidad: String
    let longitudX0020X0028WGS84X0029: String?
    let margen: String
    let municipio: String
    let precioX0020Biodiesel: String?
    let precioX0020Bioetanol: String?
    let precioX0020GasX0020NaturalX0020Comprimido: String?
    let precioX0020GasX0020NaturalX0020Licuado: String?
    let precioX0020GasesX0020LicuadosX0020DelX0020Petróleo: String?
    let precioX0020GasoleoX0020A: String?
    let precioX0020GasoleoX0020B: String?
    let precioX0020GasoleoX0020Premium: String?
    let precioX0020GasolinaX002095_X0020E10: String?
    let precioX0020GasolinaX002095_X0020E5: String?
    let precioX0020GasolinaX002095_X0020E5X0020Premium: String?
    let precioX0020GasolinaX002098_X0020E10: String?
    let precioX0020GasolinaX002098_X0020E5: String?
    let precioX0020Hidrogeno: String?
    let provincia: String
    let remisión: String
    let rótulo: String
    let tipoX0020Venta: String?
    let x0025X0020BioEtanol: String?
    let x0025X0020ÉsterX0020Metílico: String?
    let ideess: String
    let idMunicipio: String
    let idProvincia: String
    let idccaa: String

    enum CodingKeys: String, CodingKey {
        case cp = "C.P."
        case dirección = "Dirección"
        case horario = "Horario"
        case latitud = "Latitud"
        case localidad = "Localidad"
        case longitudX0020X0028WGS84X0029 = "Longitud_x0020__x0028_WGS84_x0029_"
        case margen = "Margen"
        case municipio = "Municipio"
        case precioX0020Biodiesel = "Precio_x0020_Biodiesel"
        case precioX0020Bioetanol = "Precio_x0020_Bioetanol"
        case precioX0020GasX0020NaturalX0020Comprimido = "Precio_x0020_Gas_x0020_Natural_x0020_Comprimido"
        case precioX0020GasX0020NaturalX0020Licuado = "Precio_x0020_Gas_x0020_Natural_x0020_Licuado"
        case precioX0020GasesX0020LicuadosX0020DelX0020Petróleo = "Precio_x0020_Gases_x0020_licuados_x0020_del_x0020_petróleo"
        case precioX0020GasoleoX0020A = "Precio_x0020_Gasoleo_x0020_A"
        case precioX0020GasoleoX0020B = "Precio_x0020_Gasoleo_x0020_B"
        case precioX0020GasoleoX0020Premium = "Precio_x0020_Gasoleo_x0020_Premium"
        case precioX0020GasolinaX002095_X0020E10 = "Precio_x0020_Gasolina_x0020_95_x0020_E10"
        case precioX0020GasolinaX002095_X0020E5 = "Precio_x0020_Gasolina_x0020_95_x0020_E5"
        case precioX0020GasolinaX002095_X0020E5X0020Premium = "Precio_x0020_Gasolina_x0020_95_x0020_E5_x0020_Premium"
        case precioX0020GasolinaX002098_X0020E10 = "Precio_x0020_Gasolina_x0020_98_x0020_E10"
        case precioX0020GasolinaX002098_X0020E5 = "Precio_x0020_Gasolina_x0020_98_x0020_E5"
        case precioX0020Hidrogeno = "Precio_x0020_Hidrogeno"
        case provincia = "Provincia"
        case remisión = "Remisión"
        case rótulo = "Rótulo"
        case tipoX0020Venta = "Tipo_x0020_Venta"
        case x0025X0020BioEtanol = "_x0025__x0020_BioEtanol"
        case x0025X0020ÉsterX0020Metílico = "_x0025__x0020_Éster_x0020_metílico"
        case ideess = "IDEESS"
        case idMunicipio = "IDMunicipio"
        case idProvincia = "IDProvincia"
        case idccaa = "IDCCAA"
    }
}
