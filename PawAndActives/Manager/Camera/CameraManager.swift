//
//  CameraManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import AVFoundation
import Vision

class CameraManager: NSObject, CameraService {
    
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var sessionQueue = DispatchQueue(label: "session queue")
    
    var visionService: VisionService
    var onTrackingPointsDetected: (([CGPoint]) -> Void)?
    var onTrackingPointsNotDetected: (() -> Void)?
    
    var workoutType: WorkoutType = .grabTheCircles

    init(visionService: VisionService = VisionManager()) {
        self.visionService = visionService
        super.init()
        setupSession()
    }
    
    private func setupSession() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .high
        
        guard let captureSession = captureSession else { return }
        
        guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            print("Error: \(error)")
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            print("Could not add video input to session")
            return
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: sessionQueue)
        if (captureSession.canAddOutput(videoOutput)) {
            captureSession.addOutput(videoOutput)
        } else {
            print("Could not add video output to session")
            return
        }
        
        sessionQueue.async {
            self.captureSession?.startRunning()
        }
    }
    
    func startSession(workoutType: WorkoutType) {
        self.workoutType = workoutType
        sessionQueue.async {
            self.captureSession?.startRunning()
        }
    }
    
    func stopSession() {
        sessionQueue.async {
            self.captureSession?.stopRunning()
        }
    }
    
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer? {
        if previewLayer == nil, let captureSession = captureSession {
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer?.videoGravity = .resizeAspectFill
        }
        return previewLayer
    }
}

extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        switch workoutType {
        case .avoidTheBlocks:
            visionService.performFaceTracking(on: pixelBuffer) { [weak self] points in
                guard let previewLayer = self?.getPreviewLayer() else { return }
                if !points.isEmpty {
                    let newPoints = points.map { point in
                        previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                    }
                    self?.onTrackingPointsDetected?(newPoints)

                } else {
                    self?.onTrackingPointsNotDetected?()
                }
            }
        case .grabTheCircles:
            visionService.performHandTracking(on: pixelBuffer) { [weak self] points in
                guard let previewLayer = self?.getPreviewLayer() else { return }
                if !points.isEmpty {
                    let newPoints = points.map { point in
                        previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                    }
                    self?.onTrackingPointsDetected?(newPoints)

                } else {
                    self?.onTrackingPointsNotDetected?()
                }
            }
        }
    }
}
