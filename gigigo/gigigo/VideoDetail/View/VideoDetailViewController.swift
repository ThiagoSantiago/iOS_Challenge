//
//  VideoDetailViewController.swift
//  gigigo
//
//  Created by Thiago Alexandre Araújo Santiago on 05/11/2017.
//  Copyright © 2017 Thiago Alexandre Araújo Santiago. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class VideoDetailViewController: UIViewController {
    
    @IBOutlet weak var playlistTitle: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    
    var presenter: VideoDetailPresenterProtocol?
    var videoInfos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let snippet = presenter?.video?.snippet else { return }
        videoTitle.text = snippet.title
        playlistTitle.text = snippet.channelTitle
        videoDescription.text = snippet.description
        
        guard let url = URL(string: snippet.thumbnail?.standardThumbnail?.url ?? "") else { return }
        let placeholderImage = UIImage(named: "placeholder")
        
        videoImage.af_setImage(withURL: url, placeholderImage: placeholderImage)
        
        presenter?.viewDidLoad()
    }
}

extension VideoDetailViewController: VideoDetailViewProtocol {
    func showVideoDetails(videos: [Video]) {
        if !videoInfos.isEmpty {
            guard let snippet = videoInfos[0].snippet else { return }
            videoTitle.text = snippet.title
            playlistTitle.text = snippet.channelTitle
            videoDescription.text = snippet.description
            
            guard let url = URL(string: snippet.thumbnail?.standardThumbnail?.url ?? "") else { return }
            let placeholderImage = UIImage(named: "placeholder")
            
            videoImage.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
    }
    
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    func showError() {
        let alert = UIAlertController(title: "Erro", message: "Ops, parece que ocorreu um erro, por favor tente novamente!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
