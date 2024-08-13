//
//  CameraPreview.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 14/08/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var viewModel: GameViewModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        if let previewLayer = viewModel.getPreviewLayer() {
            previewLayer.frame = view.bounds
            view.layer.addSublayer(previewLayer)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let previewLayer = viewModel.getPreviewLayer() {
            DispatchQueue.main.async {
                previewLayer.frame = uiView.bounds
                previewLayer.connection?.videoRotationAngle = 180
            }
        }
    }
}
