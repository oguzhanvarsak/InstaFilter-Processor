//: Playground - noun: a place where people can play

import UIKit

enum Color {
    case red
    case green
    case blue
}

enum ManipulationType {
    case increase
    case decrease
}

struct Pixels {
    let reds: Int
    let greens: Int
    let blues: Int
}

struct Parameters {
    let type: ManipulationType
    let factor: Int
    let color: Color
}

let image = UIImage(named: "sample")

var myRGBA = RGBAImage(image: image!)

func getTotalPixels(from rgbaImage: RGBAImage) -> Pixels {
    var totalRed = 0
    var totalGreen = 0
    var totalBlue = 0
    
    for y in 0..<rgbaImage.height {
        for x in 0..<rgbaImage.width {
            let index = y * rgbaImage.width + x
            let pixel = rgbaImage.pixels[index]
    
            totalRed += Int(pixel.red)
            totalGreen += Int(pixel.green)
            totalBlue += Int(pixel.blue)
        }
    }
    
    let totalPixels = Pixels(reds: totalRed, greens: totalGreen, blues: totalBlue)
    
    return totalPixels
}

func getAverageColors(from pixels: Pixels, on rgbaImage: RGBAImage) -> Pixels {
    let count = rgbaImage.width * rgbaImage.height
    
    let avgRed = pixels.reds/count
    let avgGreen = pixels.greens/count
    let avgBlue = pixels.blues/count
    
    let averageColor = Pixels(reds: avgRed, greens: avgGreen, blues: avgBlue)
    
    return averageColor
}

func increaseReds() -> UIImage {
    return increaseColorIntensity(for: Color.red, times: 5, on: myRGBA!,
                           with: getAverageColors(from: getTotalPixels(from: myRGBA!), on: myRGBA!))
}

func increaseColorIntensity(for color: Color, times: Int, on rgbaImage: RGBAImage, with pixels: Pixels) -> UIImage {

    for y in 0..<rgbaImage.height {
        for x in 0..<rgbaImage.width {
            let index = y * rgbaImage.width + x
            var pixel = rgbaImage.pixels[index]
            
            switch color {
                case .red:
                    let difference = Int(pixel.red) - pixels.reds
                    
                    if difference > 0 {
                        pixel.red = UInt8(max(0, min(255, pixels.reds + difference * times)))
                        myRGBA!.pixels[index] = pixel
                    }
                case .green:
                    let difference = Int(pixel.green) - pixels.greens
                    
                    if difference > 0 {
                        pixel.green = UInt8(max(0, min(255, pixels.greens + difference * times)))
                        myRGBA!.pixels[index] = pixel
                    }
                case .blue:
                    let difference = Int(pixel.blue) - pixels.blues
                    
                    if difference > 0 {
                        pixel.blue = UInt8(max(0, min(255, pixels.blues + difference * times)))
                        myRGBA!.pixels[index] = pixel
                    }
            }
        }
    }

    let image = myRGBA?.toUIImage()
    
    return image!
}

func decraseColorIntensity(for color: Color, times: Int, on rgbaImage: RGBAImage, with pixels: Pixels) -> UIImage {

    for y in 0..<rgbaImage.height {
        for x in 0..<rgbaImage.width {
            let index = y * rgbaImage.width + x
            var pixel = rgbaImage.pixels[index]
            
            switch color {
                case .red:
                    let difference = Int(pixel.red) - pixels.reds
                    
                    if difference > 0 {
                        pixel.red = UInt8(max(0, min(255, pixels.reds + difference / times)))
                        myRGBA!.pixels[index] = pixel
                    }
                case .green:
                    let difference = Int(pixel.green) - pixels.greens
                    
                    if difference > 0 {
                        pixel.green = UInt8(max(0, min(255, pixels.greens + difference / times)))
                        myRGBA!.pixels[index] = pixel
                    }
                case .blue:
                    let difference = Int(pixel.blue) - pixels.blues
                    
                    if difference > 0 {
                        pixel.blue = UInt8(max(0, min(255, pixels.blues + difference / times)))
                        myRGBA!.pixels[index] = pixel
                    }
            }
        }
    }

    let image = myRGBA?.toUIImage()
    
    return image!
}

func changeColors(as parameters: [Parameters], on rgbaImage: RGBAImage) -> UIImage {
    
    var changedImage = rgbaImage.toUIImage()
    
    for i in 0 ..< parameters.count {
        let changedRGBA = RGBAImage(image: changedImage!)
        
        switch parameters[i].type {
            case .increase:
                changedImage = increaseColorIntensity(for: parameters[i].color,
                                                          times: parameters[i].factor,
                                                          on: changedRGBA!,
                                                          with: getAverageColors(from: getTotalPixels(from: changedRGBA!),
                                                                                 on: changedRGBA!))
            case .decrease:
                changedImage = decraseColorIntensity(for: parameters[i].color,
                                                        times: parameters[i].factor,
                                                        on: changedRGBA!,
                                                        with: getAverageColors(from: getTotalPixels(from: changedRGBA!),
                                                                               on: changedRGBA!))
        }
    }
    
    return changedImage!
}

//let changedImage = increaseColorIntensity(for: Color.blue,
//               times: 2,
//               on: myRGBA!,
//               with: getAverageColors(from: getTotalPixels(from: myRGBA!), on: myRGBA!))

//let changedImage2 = decraseColorIntensity(for: Color.green,
//                                        times: 2,
//                                        on: myRGBA!,
//                                        with: getAverageColors(from: getTotalPixels(from: myRGBA!), on: myRGBA!))

//let changedImage3 = increaseReds()

let parameter1 = Parameters(type: .increase, factor: 9, color: .blue)
let parameter2 = Parameters(type: .decrease, factor: 9, color: .green)
let parameter3 = Parameters(type: .increase, factor: 9, color: .red)

let parameters: [Parameters] = [parameter1, parameter2, parameter3]

let pipelinedImage = changeColors(as: parameters, on: myRGBA!)
