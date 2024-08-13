//
//  VisionService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import Vision

protocol VisionService {
    func performFaceTracking(on pixelBuffer: CVPixelBuffer, completion: @escaping ([CGPoint]) -> Void)
    func performHandTracking(on pixelBuffer: CVPixelBuffer, completion: @escaping ([CGPoint]) -> Void)
}
