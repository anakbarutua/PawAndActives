//
//  CameraService.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import AVFoundation

protocol CameraService {
    func startSession()
    func stopSession()
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer?
}
