//
//  GlobalConst.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit

class ConstCommon {
    
    static let googleMapAPI = "AIzaSyASt3usz3n--V421w9jG6T8rmI41W2-Hg8"
    
    static let getTimeDataUrl = "https://us-central1-p0918-todo.cloudfunctions.net/getTimeData"
}

// 테마 색상 정의
class ThemeColor {
    
    static let tintColor = UIColor(displayP3Red: 0xEA/0xFF, green: 0x33/0xFF, blue: 0x46/0xFF, alpha: 1.0)  // EA3346
    static let barTintColor = UIColor.white
    
    // TableView Background Color
    static let tableViewBackgroundColor = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    
    // 테이블 뷰 셀 배경색
    static let tableViewCellBackgroundColor = UIColor.clear
    
    // 테이블 뷰 셀 제목글 폰트
    static let tableViewCellTitleFont = UIFont(name:"Helvetica", size: 14.0)
    
    // 테이블 뷰 셀 제목글 색상
    static let tableViewCellTitleColor = UIColor(displayP3Red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
    
    // 테이블 뷰 셀 내용글 폰트
    static let tableViewCellSubTitleFont = UIFont(name:"Helvetica", size: 12.0)
    
    // 테이블 뷰 셀 내용글 색상
    static let tableViewCellSubTitleColor = UIColor.darkGray
    
    // 전송 메시지 말풍선 배경 색상 91, 194, 54
    static let sendMessageBubbleColor = UIColor(displayP3Red: 64/255, green: 64/255, blue: 64/255, alpha: 1.0) //UIColor(displayP3Red: 231/255, green: 255/255, blue: 232/255, alpha: 1.0)
    
    // 전송 메시지 텍스트 색상
    static let sendMessageTextColor = UIColor.white
    
    // 수신 메시지 말풍선 배경 색상
    static let recvMessageBubbleColor = UIColor.white // UIColor(displayP3Red: 231/255, green: 254/255, blue: 255/255, alpha: 1.0)
    
    // 수신 메시지 텍스트 색상
    static let recvMessageTextColor = UIColor(displayP3Red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
    
    // 수신 메시지 폰트
    static let recvMessageNameFont = UIFont(name:"Helvetica", size: 12.0)
    
    // 수신 메시지 폰트
    static let recvMessageTextFont = UIFont(name:"Helvetica", size: 14.0)
    
    // 버튼 색
    static let buttonColor = UIColor(displayP3Red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
}
