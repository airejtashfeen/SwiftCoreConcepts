import UIKit

struct ColorPalette: Decodable{
   
    struct PaletteColors: Decodable{
        let description: String
        let red: Int
        let green: Int
        let blue: Int
        let alpha: Double
    }
    
    let palette_name: String
    let palette_info: String
    let palette_colors:[PaletteColors]
}

guard let sourcesURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else{
    fatalError("Could not load find FlatColors.json")
}

guard let colorData = try? Data(contentsOf: sourcesURL) else{
    fatalError("Could not convert data")
}

let decoder = JSONDecoder()

guard let flatColors = try? decoder.decode(ColorPalette.self, from: colorData) else{
    fatalError("Could not decode JSON Data")
}

print(flatColors.palette_name)

for color in flatColors.palette_colors{
    print(color)
}