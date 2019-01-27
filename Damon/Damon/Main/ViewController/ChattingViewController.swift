//
//  ChattingViewController.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit

enum RoomStatus {
    case wait, chat
}

class ChattingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, HPGrowingTextViewDelegate {

    
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var msgInputView: UIView!
    @IBOutlet weak var msgInputViewHeight: NSLayoutConstraint!
    @IBOutlet weak var messageSendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var buddyName: String! = ""
    
    var roomStatus: RoomStatus = .wait              // 대화방의 상태(wait, chattest, chat, soulmatetest)
    
    var chatRoom: ChatRoom!                         // 대화방 데이타

    var messagesInbox: [String] = []
    
    var messagesCount: Int! = 0
    
    let messageTextField = HPGrowingTextView()      // 전송 메시지 입력 텍스트 뷰
    var textViewHeight: CGFloat = 30.0              // 텍스트 뷰의 크기 변경이 발생할 때 높이
    var messageTextFieldHeight: NSLayoutConstraint! // 전송 메시지 입력 텍스트 뷰 높이 Constraint
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = buddyName
        
        hideKeyboardWhenTappedAround()
        chatRoom = ChatRoom()
        
        // tabble View 초기화
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 31.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = ThemeColor.tableViewBackgroundColor
        tableView.register(SendMessageTableViewCell.classForCoder(), forCellReuseIdentifier: "SendMessageTableViewCell")
        tableView.register(ReceiveMessageTableViewCell.classForCoder(), forCellReuseIdentifier: "ReceiveMessageTableViewCell")
        tableView.register(SendImageTableViewCell.classForCoder(), forCellReuseIdentifier: "SendImageTableViewCell")
        tableView.register(ReceiveImageTableViewCell.classForCoder(), forCellReuseIdentifier: "ReceiveImageTableViewCell")
        
        // 메시지 텍스트 뷰 초기화
        msgInputView.addSubview(messageTextField)
        messageTextField.layer.borderWidth = 1.0
        messageTextField.layer.borderColor = UIColor.lightGray.cgColor
        messageTextField.layer.cornerRadius = 5.0
        messageTextField.isScrollable = false
        messageTextField.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        messageTextField.minNumberOfLines = 1
        messageTextField.maxNumberOfLines = 3
        messageTextField.returnKeyType = UIReturnKeyType.default
        messageTextField.font = ThemeColor.recvMessageTextFont // UIFont.systemFont(ofSize: 15.0)
        messageTextField.delegate = self
        messageTextField.internalTextView.scrollIndicatorInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        messageTextField.backgroundColor = UIColor.white
        messageTextField.placeholder = "New Message".localized
        
        
        // 메시지 텍스트 뷰 constraint 초기화
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.leadingAnchor.constraint(equalTo: msgInputView.leadingAnchor, constant: 40.0).isActive = true
        messageTextField.bottomAnchor.constraint(equalTo: msgInputView.bottomAnchor, constant: -5.0).isActive = true
        messageTextField.topAnchor.constraint(equalTo: msgInputView.topAnchor, constant: 5.0).isActive = true
        messageTextField.trailingAnchor.constraint(equalTo: msgInputView.trailingAnchor, constant: -40.0).isActive = true
        messageTextField.heightAnchor.constraint(equalToConstant: textViewHeight).isActive = true
        messageTextFieldHeight = messageTextField.heightAnchor.constraint(equalToConstant: textViewHeight)
        messageTextFieldHeight.isActive = true
    }
    
    // table 뷰의 섹션 갯수 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 각 섹션별 row 갯수를 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chatRoom.messages.count
        return messagesInbox.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = ThemeColor.tableViewCellBackgroundColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        messageSendAction(textField)
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startAvoidingKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopAvoidingKeyboard()
    }
    
    // 채팅 메시지 입력 창의 높이가 변경이 있을 때 호출
    func growingTextView(_ growingTextView: HPGrowingTextView!, didChangeHeight height: Float) {
        print("growingTextView:_:didChangeHeight - \(height)")
        textViewHeight = CGFloat(height)
        msgInputViewHeight.constant = textViewHeight + 10.0
        messageTextFieldHeight.constant = textViewHeight
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
    // 메시지 전송 버튼 액션
    @IBAction func messageSendAction(_ sender: Any) {
        if let message = messageTextField.text {
            sendMessage(msg: message)
            messageTextField.text = ""
            messageTextField.becomeFirstResponder()
        }
    }
    
    // 메시지 전송
    func sendMessage(msg: String) {
        messagesInbox.append(msg)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let message = chatRoom.messages[indexPath.row]
//        if message.userId == RDDatabse.shared.user.userId {
        let cellIdentifier = "SendMessageTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SendMessageTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SendMessageTableViewCell.")
        }
        cell.selectionStyle = .none
        cell.messageLabel.text = messagesInbox[indexPath.row]
        return cell
//        } else {
//            let cellIdentifier = "ReceiveMessageTableViewCell"
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReceiveMessageTableViewCell  else {
//                fatalError("The dequeued cell is not an instance of ReceiveMessageTableViewCell.")
//            }
//
//            if !userProfile.isEmpty {
//                if let fPath = FileUtil.getFileUrl(folder: FIRRemoteConfig.shared.getProfilePath(), fname: userProfile) {
//                    if FileUtil.fileExists(folder: FIRRemoteConfig.shared.getProfilePath(), fname: userProfile) {
//                        ControlUtil.loadProfilrImageFile(fPath, image: cell.profileImageView)
//                    } else {
//                        let storage = Storage.storage(url: FIRRemoteConfig.shared.getBucketName())
//                        let ref = storage.reference(withPath: "\(FIRRemoteConfig.shared.getProfilePath())/\(userProfile)")
//                        _ = ref.write(toFile: fPath) { url, error in
//                            if let error = error {
//                                print("Download Error: \(error.localizedDescription)")
//                            } else if let url = url {
//                                ControlUtil.loadProfilrImageFile(url, image: cell.profileImageView)
//                            }
//                        }
//                    }
//                }
//            } else {
//                cell.profileImageView.image = UIImage(named: "ProfileImage")
//            }
//
//            cell.nameLabel.text = userName
//            cell.messageLabel.text = message.message
//
//            return cell
//        }
    }

}
