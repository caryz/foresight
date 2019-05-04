//
//  PieChartBuilder.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Charts

class PieChartBuilder {
    static func build(using pieChart: PieChartView) {
        let entry1 = PieChartDataEntry(value: 30, label: "Flood")
        let entry2 = PieChartDataEntry(value: 40, label: "Fire")
        let entry3 = PieChartDataEntry(value: 30, label: "Hurricane")
        let dataSet = PieChartDataSet(values: [entry1, entry2, entry3], label: "Disaster Types")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
//        pieChart.chartDescription?.text = "Share of Disasters by Type"

        //All other additions to this function will go here
        dataSet.colors = ChartColorTemplates.material()
        pieChart.centerAttributedText = getAttributedCenterText(state: "Alabama", level: "High")

        pieChart.animate(xAxisDuration: 2, easingOption: .easeOutBounce)
        pieChart.spin(duration: 2, fromAngle: 0, toAngle: 120)

        //        dataSet.valueColors = [UIColor.black]

        //        pieChart.backgroundColor = UIColor.black
        //        pieChart.holeColor = UIColor.clear
        //        pieChart.chartDescription?.textColor = UIColor.white
        //        pieChart.legend.textColor = UIColor.white

        //        pieChart.legend.font = UIFont(name: "Futura", size: 10)!
        //        pieChart.chartDescription?.font = UIFont(name: "Futura", size: 12)!
        //        pieChart.chartDescription?.xOffset = pieChart.frame.width - 8
        //        pieChart.chartDescription?.yOffset = pieChart.frame.height * (2/3)
        //        pieChart.chartDescription?.textAlign = NSTextAlignment.left

        //This must stay at end of function
        pieChart.notifyDataSetChanged()
    }

    /// State, Disaster Risk Levle, Level (Changes depending on color)
    static func getAttributedCenterText(state: String, level: String) -> NSAttributedString {
        let disasterText = "Disaster Risk Level"
        let mainString = "\(state)\n\(disasterText)\n\(level)"
        let stateRange = (mainString as NSString).range(of: state)
        let disasterTextRange = (mainString as NSString).range(of: disasterText)
        let levelRange = (mainString as NSString).range(of: level)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
//        for familyName:String in UIFont.familyNames {
//            print("Family Name: \(familyName)")
//            for fontName:String in UIFont.fontNames(forFamilyName: familyName) {
//                print("--Font Name: \(fontName)")
//            }
//        }
        let str = NSMutableAttributedString(string: mainString, attributes: [.paragraphStyle: paragraphStyle])
        str.addAttributes([.foregroundColor: UIColor.darkGray,
                           .font: Fonts.regular(size: 12)],
                          range: stateRange)
        str.addAttributes([.foregroundColor: UIColor.darkGray,
                           .font: Fonts.light(size: 12)],
                          range: disasterTextRange)
        str.addAttributes([.foregroundColor: UIColor.red,
                           .font: Fonts.bold(size: 14)],
                          range: levelRange)

        return str
    }
}
