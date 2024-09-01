//
//  CameraManager.swift
//  PawAndActives
//
//  Created by Anjar Harimurti on 13/08/24.
//

import Foundation
import AVFoundation
import Vision
import UIKit

class CameraManager: NSObject, CameraService {
    
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var sessionQueue = DispatchQueue(label: "session queue")
    private var capturedFrame: UIImage?
    
    var visionService: VisionService
    var onTrackingPointsDetected: ((TrackingPoint) -> Void)?
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
            guard let session = self.captureSession else { return }
            if session.isRunning {
                session.stopRunning()
            }
            
            // Remove the preview layer if needed
            self.previewLayer?.removeFromSuperlayer()
            self.previewLayer = nil
            self.captureSession = nil
        }
    }
    
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer? {
        if previewLayer == nil, let captureSession = captureSession {
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer?.videoGravity = .resizeAspectFill
        }
        return previewLayer
    }
    
    func captureCurrentFrame() -> UIImage? {
        return capturedFrame
    }
}

extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        capturedFrame = pixelBufferToUIImage(pixelBuffer)
        
        switch workoutType {
        case .avoidTheBlocks:
            visionService.performFaceTracking(on: pixelBuffer) { [weak self] trackedPoints in
                guard let previewLayer = self?.getPreviewLayer() else { return }
                guard let headPoint = trackedPoints.head else { return }
                if !headPoint.isEmpty {
                    let newPoints = headPoint.map { point in
                        previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                    }
                    
                    var fixPoint = trackedPoints
                    fixPoint.head = newPoints
                    self?.onTrackingPointsDetected?(fixPoint)

                } else {
                    self?.onTrackingPointsNotDetected?()
                }
            }
        case .grabTheCircles:
            visionService.performHandTracking(on: pixelBuffer) { [weak self] trackedPoints in
                guard let previewLayer = self?.getPreviewLayer() else { return }
                guard let leftHandPoint = trackedPoints.leftHand, let rightHandPoint = trackedPoints.rightHand else { return }
                if !leftHandPoint.isEmpty || !rightHandPoint.isEmpty {
                    let newLeftPoints = leftHandPoint.map { point in
                        previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                    }
                    
                    let newRightPoints = rightHandPoint.map { point in
                        previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                    }
                    
                    var fixPoint = trackedPoints
                    fixPoint.leftHand = newLeftPoints
                    fixPoint.rightHand = newRightPoints
                    self?.onTrackingPointsDetected?(fixPoint)

                } else {
                    self?.onTrackingPointsNotDetected?()
                }
            }
        }
    }
    
    private func pixelBufferToUIImage(_ pixelBuffer: CVPixelBuffer) -> UIImage? {
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        let context = CIContext(options: nil)
        
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            return nil
        }
        
        let orientation = UIImage.Orientation.downMirrored
        
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: orientation)
    }
}
