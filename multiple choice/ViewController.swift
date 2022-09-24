//
//  ViewController.swift
//  multiple choice
//
//  Created by Ryan Lin on 2022/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    //四個選項連到IBOutlet Collection
    @IBOutlet var showChoiceButtons: [UIButton]!
    @IBOutlet weak var showNextButton: UIButton!
    
    var questions = [Question]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(answer: "seal", option:  ["seal","seahorse","fish","octopus"])
        questions.append(question1)
        let question2 = Question(answer: "seahorse",option: ["seahorse","fish","octopus","jellyfish"])
        questions.append(question2)
        let question3 = Question(answer: "fish",option: ["fish","octopus","jellyfish","starfish"])
               questions.append(question3)
        let question4 = Question(answer: "octopus",option: ["octopus","jellyfish","starfish","dolphin"])
               questions.append(question4)
        let question5 = Question(answer: "jellyfish",option: ["jellyfish","starfish","dolphin","whale"])
               questions.append(question5)
        let question6 = Question(answer: "starfish",option: ["starfish","dolphin","whale","crab"])
               questions.append(question6)
        let question7 = Question(answer: "dolphin",option: ["dolphin","whale","crab","puffer fish"])
               questions.append(question7)
        let question8 = Question(answer: "whale",option: ["whale","crab","puffer fish","seal"])
               questions.append(question8)
        let question9 = Question(answer: "crab",option: ["crab","puffer fish","seal","seahorse"])
               questions.append(question9)
        let question10 = Question(answer: "puffer fish",option: ["puffer fish","seal","seahorse","fish"])
               questions.append(question10)
        //題目隨機排列
        questions.shuffle()
        //關閉Next Button反應
        showNextButton.isEnabled = false
       resetPattern()
    }
    
    //重複項目設成function
    fileprivate func resetPattern() {
        //讓slider跟文字label連動
        progressSlider.value = Float(index)
        progressLabel.text = "\(index+1)/10"
        //讓image跟著對應questions array index的answer
        creatureImageView.image = UIImage(named: questions[index].answer)
        //答案選項隨機排列
        //option.shuffle()一定要在設定Button文字之前，不然選項會維持在固定位置
        questions[index].option.shuffle()
        //設定選項Button文字
        for i in 0...3{
            showChoiceButtons[i].setTitle(questions[index].option[i], for: .normal)
        }
        //還原選項Button文字顏色
        for i in 0...3{
            showChoiceButtons[i].setTitleColor(UIColor(red: 0, green:  150/255, blue: 1, alpha: 1), for: .normal)
            //開啟選項Button反應
            showChoiceButtons[i].isEnabled = true
        }
    }
    
    //設定四個選項Button
    @IBAction func selectedButtons(_ sender: UIButton) {
        if sender.currentTitle == questions[index].answer{
            infoLabel.text = "Good Job !!"
            //設定infoLabel字體顏色變成暗黃色
            infoLabel.textColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
            //設定正確答案變桃紅顏
            sender.setTitleColor(UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1), for: .normal)
            showNextButton.isEnabled = true
            }
        else{
            infoLabel.text = "Please Try Again !"
            //設定infoLabel字體顏色回到淡紫色
            infoLabel.textColor = UIColor(red: 30/255, green: 152/255, blue: 253/255, alpha: 1)
            //設定錯誤答案變灰色
            sender.setTitleColor(UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 0.6), for: .normal)
            //設定錯誤答案再無反應
            sender.isEnabled = false
        }
    }
   
    @IBAction func nextButton(_ sender: Any) {

        if index<questions.count-1{
            index += 1
            infoLabel.text = "Do Your Best !"
            infoLabel.textColor = UIColor(red: 30/255, green: 152/255, blue: 253/255, alpha: 1)
            resetPattern()
        }
        else{
            infoLabel.text = "Press Replay !"
            infoLabel.textColor = UIColor(red: 1, green: 126/255, blue: 121/255, alpha: 1)
        }
        //開啟Next Button反應
        showNextButton.isEnabled = false
    }
    
    @IBAction func replayButton(_ sender: Any) {
        questions.shuffle()
        index = 0
        infoLabel.text = "Let's Play Together !"
        infoLabel.textColor = UIColor(red: 122/255, green: 129/255, blue: 255/255, alpha: 1)
        resetPattern()
    }
}
