//
//  PieChartBuilder.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Charts

class ChartBuilder {
    static func buildPieChart(_ pieChart: PieChartView) {
        let dataSet = PieChartDataSet(values: [
            PieChartDataEntry(value: 25, label: "Flood"),
            PieChartDataEntry(value: 10, label: "Fire"),
            PieChartDataEntry(value: 5, label: "Drought"),
            PieChartDataEntry(value: 20, label: "Hurricane"),
            PieChartDataEntry(value: 40, label: "Tornado")
            ], label: "")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
//        pieChart.chartDescription?.text = "Share of Disasters by Type"

        //All other additions to this function will go here
        dataSet.colors = ChartColorTemplates.joyful()
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        formatter.percentSymbol = "%"
        formatter.zeroSymbol = ""
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))

        pieChart.centerAttributedText = getAttributedCenterText(state: "Alabama", level: "High")

        pieChart.usePercentValuesEnabled = true
        pieChart.animate(xAxisDuration: 1, easingOption: .easeOutBounce)

        //pieChart.spin(duration: 1, fromAngle: 0, toAngle: 120)

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

    static func buildBarChart(_ barChart: BarChartView) {
        let dataSet = BarChartDataSet(values: [
            BarChartDataEntry(x: 0, y: 20),
            BarChartDataEntry(x: 1, y: 10),
            BarChartDataEntry(x: 2, y: 15),
            BarChartDataEntry(x: 3, y: 20),
            BarChartDataEntry(x: 4, y: 20),
            BarChartDataEntry(x: 5, y: 20),
            BarChartDataEntry(x: 6, y: 15),
            BarChartDataEntry(x: 7, y: 20),
            BarChartDataEntry(x: 8, y: 20),
            BarChartDataEntry(x: 9, y: 20),
            BarChartDataEntry(x: 10, y: 20),
            BarChartDataEntry(x: 11, y: 20),], label: "")

        dataSet.colors = [Constants.Colors.lightBlue]
        dataSet.valueFont = .systemFont(ofSize: 10)

        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
//        barChart.drawBarShadowEnabled = true
        barChart.drawValueAboveBarEnabled = true
//        barChart.zoom(scaleX: 2, scaleY: 2, x: 0, y: 0)
        barChart.pinchZoomEnabled = true
        barChart.drawGridBackgroundEnabled = false

        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        formatter.percentSymbol = "%"
        formatter.zeroSymbol = ""
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        barChart.xAxis.granularity = 1
        barChart.xAxis.labelPosition = .bottom
        barChart.legend.enabled = false
        barChart.xAxis.drawGridLinesEnabled = false

        barChart.xAxis.labelFont = .systemFont(ofSize: 10)
        barChart.xAxis.labelCount = 12
        barChart.leftAxis.enabled = false
        barChart.rightAxis.enabled = false
//        barChart.chartDescription?.text = "Number of Widgets by Type"

        //All other additions to this function will go here

        //This must stay at end of function
        barChart.notifyDataSetChanged()
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
