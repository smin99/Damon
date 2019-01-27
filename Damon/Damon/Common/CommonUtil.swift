//
//  CommonUtil.swift
//  P0918
//
//  Created by khhwang on 11/12/2018.
//  Copyright © 2018 SnJ Mobile. All rights reserved.
//

import Foundation

// 일반 유틸리티 함수 정의 - 날짜, 시간등을 문자열로 변환
class CommonUtil {

    // 서버 시간에 보정된 현재 시간을 반환
    static func getDate() -> Date {
        if AppDelegate.timeDelta != 0.0 {
            var date = Date()
            date.addTimeInterval(AppDelegate.timeDelta)
            return date
        }
        return Date()
    }
    
    // date를 2018-12-30 10:10 형태의 문자열로 반환
    static func dateToString2(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale.current
        
        return formatter.string(from: date)
    }
    
    // date를 2018-12-30 형태의 문자열로 반환
    static func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        
        return formatter.string(from: date)
    }
    
    // 사용자 레벨 기간을 날짜 형태로 반환
    static func dateToString(sDate: Date, eDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale.current
        
        return String(format: "%@ ~ %@", formatter.string(from: sDate), formatter.string(from: eDate))
    }
    
    // 프로 사용자 인지 기간을 체크 - true이면 정상 기간 상태
    static func checkProUserPeriod(sDate: Date, eDate: Date) -> Bool {
        let doubleStart = Double(sDate.timeIntervalSince1970)
        let doubleEnd = Double(eDate.timeIntervalSince1970)
        
        let doubleCurrent = Double(Date().timeIntervalSince1970) - AppDelegate.timeDelta
        return doubleStart <= doubleCurrent && doubleCurrent <= doubleEnd
    }
    
    // 기간 설정시 시작 날짜 (날짜 + 00:00:00) 를 반환
    static func makeStartDate(date: Date) -> Date {
        var component = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        component.hour = 0
        component.minute = 0
        component.second = 0
        return Calendar.current.date(from: component)!
    }
    
    // 기간 설정시 종료 날짜 (날짜 + 23:59:59) 를 반환
    static func makeEndDate(date: Date) -> Date {
        var component = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        component.hour = 23
        component.minute = 59
        component.second = 59
        return Calendar.current.date(from: component)!
    }
    
    static let langcodes = [ ["en", "English"], ["zh", "中文"], ["es", "Español"], ["fr", "français"], ["de", "Deutsch"], ["it", "Italiano"], ["ru", "русский"], ["pt", "Português"], ["ja", "日本語"], ["ko", "한국어"]]
    static func getLanguageName(langcode: String) -> String {
        for language in langcodes {
            if language[0] == langcode { return language[1] }
        }
        
        return langcodes[0][1]      // 존재하지 않으면 English를 반환
    }
}
