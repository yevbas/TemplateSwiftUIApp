//
//  MailComposeView.swift
//  TemplateSwiftUIApp
//
//  Created by Jackson  on 25/08/2024.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    private var recipients: [String] = []
    private var subject = ""
    private var body = ""

    init?(recipients: [String], subject: String = "", body: String = "") {
        guard MFMailComposeViewController.canSendMail() else { return nil }

        self.recipients = recipients
        self.subject = subject
        self.body = body
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) { }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.setToRecipients(recipients)
        viewController.setSubject(subject)
        viewController.setMessageBody(body, isHTML: false)
        return viewController
    }
}
