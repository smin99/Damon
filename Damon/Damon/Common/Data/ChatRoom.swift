//
//  ChatRoom.swift
//  P0918
//
//  Created by khhwang on 30/12/2018.
//  Copyright © 2018 SnJ Mobile. All rights reserved.
//

import Foundation

// 대화방에서 메시지 정보
class Message {
    var messageId: String = ""                          // 메시지 아이디
    var userId: String = ""                             // 메시지 전송 사용자 아이디
    var message: String = ""                            // 메시지 내용               '\n으로 시작하면 대화방 제어 메시지'
    var sendDt: Date                                    // 메시지 전송 날짜
    var isImage: Bool = false                           // 이미지 파일인지??
    
    init(messageId: String) {
        self.messageId = messageId
        sendDt = CommonUtil.getDate()
    }
}

// 대화방 정보
class ChatRoom {
    var createDt: Date                                  // 대화방 생성 날짜
    var lstMsgDt: Date                                  // 마지막 메시지 송,수신 날짜 - 10분이 지나면 서버에서 대화방 삭제
    var ownerId: String = ""                            // 대화방 생성 사용자 아이디
    var userId: String = ""                             // 대화 상대방 사용자 아이디
    var priorScore: Double = 0.0                        // 사전 대화 적합도 조사 성적
    var soulmateScore: Double = 0.0                     // 소울메이트 조사 성적
    var messages: Array<Message> = Array<Message>()     // 메시지 리스트
    
    init() {
        createDt = CommonUtil.getDate()
        lstMsgDt = CommonUtil.getDate()
    }
}
