//
//  HWHomeCell.swift
//  News
//
//  Created by 曹航玮 on 2017/2/27.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

import UIKit

class HWHomeCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HWHomeCell {
    
    func homeCellWith(cellModel : NewsModel) {
        
        title.text = cellModel.title
        sourceLabel.text = cellModel.source
        let voteC = String(cellModel.votecount)
        voteLabel.text = "\(voteC)人跟帖"
        
        if let imgUrl = URL(string: cellModel.imgsrc) {
            icon.sd_setImage(with: imgUrl)
        }
    
    }
    
    
}
