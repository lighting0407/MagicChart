//
//  ChartData.swift
//  MagicChartDemo
//
//  Created by wen on 2018/6/29.
//  Copyright © 2018年 wenfeng. All rights reserved.
//

import UIKit

public enum MagicLineStyle {
    case line
    case curve
}

public enum MagicChartAxisRangeType {
    case auto
    case manual
}

public enum MagicChartPointShape {
    case circle
    case square
    case triangle
    case diamond
}

public enum AxisChartAxisPosition {
    case top
    case left
    case right
    case bottom
}

public class LineChartDataSource {
    public init() {}
    public var label = [String]()
    public var sets = [LineChartDataSet]()
    public var segment = LineChartSegmentSet.Zero()
}

public class LineChartDataSet {
    public init() {}
    
    public var value = [String: Double]()
    public var lineWidth: CGFloat = 1
    public var lineColor: UIColor?
    public var lineDashPattern: [[Double]] = []
    public var lineStyle: MagicLineStyle = .line
    public var continuous: Bool = true
    public var xAxisPosition: AxisChartAxisPosition = .bottom
    public var yAxisPosition: AxisChartAxisPosition = .left
    
    public var point: LineChartPointConfig? = nil
    public var area: LineChartAreaConfig? = nil
}

public struct LineChartAreaConfig {
    public var color: UIColor?
    public var gradient: CAGradientLayer?
    
    public init(
        color: UIColor?,
        gradient: CAGradientLayer?
        ) {
        self.color = color
        self.gradient = gradient
    }
}

public struct LineCharSegmentItem{
    public var start: String
    public var end: String
}

public struct LineChartSegmentSet{    /*分段的数据，如中间有一块需要单独背景色显示，当前labels是1/1,1/2,1/3,1/4,1/5,1/6,1/7,分段字段为1/3-1/5,表格里这部分背景色为color,表格顶部在分段部分h，和其前后显示segmentTitle，该segmentTitle为["节日前","节日中","节日后",]
     */
    public var segments = [(label: LineCharSegmentItem, color:UIColor, opacity: CGFloat)]()
    public var segmentTitle = [String]()
    
    public static func Zero() -> LineChartSegmentSet {
        return LineChartSegmentSet(segments: [], segmentTitle: [])
    }
}
