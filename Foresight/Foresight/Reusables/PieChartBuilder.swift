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
        pieChart.animate(xAxisDuration: 2, easingOption: .easeOutBounce)
        dataSet.colors = ChartColorTemplates.material()
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
}
