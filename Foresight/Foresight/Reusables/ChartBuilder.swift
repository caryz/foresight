//
//  PieChartBuilder.swift
//  Foresight
//
//  Created by Cary Zhou on 5/4/19.
//  Copyright © 2019 Many Hats. All rights reserved.
//

import Charts

class ChartBuilder {
    static func buildPieChart(_ pieChart: PieChartView, using res: IncidentResponse) {

        let entries = res.incidents.map {
            PieChartDataEntry(value: $0.percent,
                              label: $0.type.description)
        }

        let dataSet = PieChartDataSet(values: entries, label: "")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
//        pieChart.chartDescription?.text = "Share of Disasters by Type"

        //All other additions to this function will go here
        dataSet.colors = ChartColorTemplates.joyful()
        dataSet.valueFont = Fonts.bold(size: 14)
        dataSet.valueColors = [.black]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        formatter.multiplier = 1.0
        formatter.percentSymbol = "%"
        formatter.zeroSymbol = ""
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
//        pieChart.offset

        pieChart.centerAttributedText = getAttributedCenterText(state: res.stateName.capitalized, level: res.incidentRiskLevel.capitalized)

        pieChart.usePercentValuesEnabled = true
        pieChart.drawEntryLabelsEnabled = false
        pieChart.animate(xAxisDuration: 1, easingOption: .easeOutBounce)
        pieChart.legend.font = Fonts.light(size: 14)

        //pieChart.spin(duration: 1, fromAngle: 0, toAngle: 120)

        //        dataSet.valueColors = [UIColor.black]

        //This must stay at end of function
        pieChart.notifyDataSetChanged()
    }

    static func buildBarChart(_ barChart: BarChartView, using res: IncidentResponse) {
        let entries = res.monthData.map {
            BarChartDataEntry(x: $0.month - 1,
                              y: $0.percentage)
        }

        let dataSet = BarChartDataSet(values: entries, label: "")

        dataSet.colors = [Constants.Colors.lightBlue]
        dataSet.valueFont = Fonts.light(size: 10)

        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
//        barChart.drawBarShadowEnabled = true
        barChart.drawValueAboveBarEnabled = true
//        barChart.zoom(scaleX: 2, scaleY: 2, x: 0, y: 0)
        barChart.pinchZoomEnabled = true
        barChart.drawGridBackgroundEnabled = false

        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
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

        barChart.xAxis.labelFont = Fonts.regular(size: 10)
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
