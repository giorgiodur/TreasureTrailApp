//
//  CameraView.swift
//  Treasure Trail
//
//  Created by Giorgio Durante on 10/12/24.
//

import SwiftUI
import AVFoundation
import Vision

struct CameraView: UIViewControllerRepresentable {
    var onDetection: (String) -> Void // Callback per il monumento riconosciuto
    var onError: (Error) -> Void // Callback per errori

    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        controller.onDetection = onDetection
        controller.onError = onError
        return controller
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
}

class CameraViewController: UIViewController {
    var captureSession: AVCaptureSession?
    var videoOutput = AVCaptureVideoDataOutput()
    var onDetection: ((String) -> Void)?
    var onError: ((Error) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    func setupCamera() {
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else { return }
        
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .photo
        
        guard let videoDevice = AVCaptureDevice.default(for: .video) else {
            print("No video device available")
            return
        }
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
        } catch {
            print("Error setting up video input: \(error)")
            onError?(error)
            return
        }
        
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
        
        captureSession.commitConfiguration()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
}

extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        do {
            let model = try VNCoreMLModel(for: TreasureTrailMLModel(configuration: MLModelConfiguration()).model)
            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    print(topResult.identifier, topResult.confidence)
                    if topResult.confidence >= 0.98 {
                        DispatchQueue.main.async {
                            self.onDetection?(topResult.identifier)
                        }
                    }
                }
            }
            
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
            try handler.perform([request])
        } catch {
            print("Error performing CoreML request: \(error)")
            onError?(error)
        }
    }
}
