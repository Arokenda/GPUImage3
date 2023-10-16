//
//  ViewController.swift
//  SwiftGPUImage3
//
//  Created by Arokenda on 2023/10/12.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    var renderView: RenderView!

    var picture:PictureInput!
    var filter:LuminanceThreshold!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderView = RenderView(frame: self.view.bounds)
        self.view.addSubview(renderView)
        showFiler()
        
//        let view = UIView(frame: self.view.bounds)
//        view.backgroundColor = .red
//        self.view.addSubview(view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func showFiler() -> Void {
        // Filtering image for saving
        let testImage = UIImage(named:"xx.jpeg")!
        let monochromeFilter = MonochromeFilter()
        let filteredImage = testImage.filterWithOperation(monochromeFilter)
        
        let pngImage = filteredImage.pngData()!
        do {
            let documentsDir = try FileManager.default.url(for:.documentDirectory, in:.userDomainMask, appropriateFor:nil, create:true)
            let fileURL = URL(string:"test.png", relativeTo:documentsDir)!
            try pngImage.write(to:fileURL, options:.atomic)
        } catch {
            print("Couldn't write to file with error: \(error)")
        }
        
        // Filtering image for display
        picture = PictureInput(image:UIImage(named:"xx.jpeg")!)
        filter = LuminanceThreshold()
        picture --> filter --> renderView
        picture.processImage()
    }
}
