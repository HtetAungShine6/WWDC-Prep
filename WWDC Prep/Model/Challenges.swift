//
//  Challenges.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import Foundation

struct Challenge: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var icon: String
    var isCompleted: Bool
    var date: Date
    
    static let allChallenges: [Challenge] = [
        Challenge(id: UUID(), title: "Use Reusable Bags", icon: "bag.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Take Shorter Showers", icon: "clock.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Refuse Single-Use Plastics", icon: "nosign", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Walk or Bike for Short Distances", icon: "figure.walk.circle.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Eat More Plant-Based Meals", icon: "leaf.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Turn Off Lights When Not in Use", icon: "lightbulb.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Use Public Transportation", icon: "bus.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Recycle Properly", icon: "arrow.3.trianglepath", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Compost Food Scraps", icon: "trash.circle.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Support Local Produce", icon: "cart.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Carry a Reusable Water Bottle", icon: "waterbottle.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Use Energy-Efficient Appliances", icon: "bolt.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Line-Dry Clothes", icon: "sun.max.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Reduce, Reuse, Recycle", icon: "arrow.3.trianglepath", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Conduct a Home Energy Audit", icon: "house.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Plant Trees or Support Tree Planting Initiatives", icon: "leaf.arrow.circlepath", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Reduce Meat Consumption", icon: "leaf.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Invest in a Reusable Coffee Cup", icon: "cup.and.saucer.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Use Natural Light", icon: "sun.max.fill", isCompleted: false, date: Date()),
        Challenge(id: UUID(), title: "Educate Yourself and Others", icon: "books.vertical.fill", isCompleted: false, date: Date())
    ]
}

extension Challenge{
    var advantage: String{
        switch title{
        case "Use Reusable Bags":
            return "Reduces plastic waste and pollution."
        case "Take Shorter Showers":
            return "Conserves water, reducing the energy required for heating water and the overall water usage."
        case "Refuse Single-Use Plastics":
            return "inimizes plastic pollution and its harmful effects on wildlife, as well as reduces the demand for plastic production."
        case "Walk or Bike for Short Distances":
            return "Reduces carbon emissions, improves air quality, and has health benefits due to increased physical activity."
        case "Eat More Plant-Based Meals":
            return "Lowers greenhouse gas emissions associated with animal farming and reduces the ecological footprint of food production."
        case "Turn Off Lights When Not in Use":
            return "Saves energy, reduces electricity bills, and decreases carbon dioxide emissions from power plants"
        case "Use Public Transportation":
            return "Reduces the number of vehicles on the road, which can decrease traffic congestion, air pollution, and greenhouse gas emissions."
        case "Recycle Properly":
            return "Conserves resources, reduces landfill waste, and saves energy by minimizing the need to produce materials from scratch."
        case "Compost Food Scraps":
            return "Enriches soil, reduces the need for chemical fertilizers, and decreases methane emissions from landfills."
        case "Support Local Produce":
            return "Reduces the carbon footprint associated with transporting food long distances and supports local economies."
        case "Carry a Reusable Water Bottle":
            return "Reduces the use of disposable plastic bottles, decreasing plastic waste and pollution."
        case "Use Energy-Efficient Appliances":
            return "Lowers energy consumption, reduces electricity bills, and decreases greenhouse gas emissions."
        case "Line-Dry Clothes":
            return "Saves energy by reducing the use of electric or gas dryers and extends the life of clothing by reducing wear from the drying process."
        case "Reduce, Reuse, Recycle":
            return "Minimizes waste, conserves natural resources, and reduces environmental impact by following these three key sustainable practices."
        case "Conduct a Home Energy Audit":
            return "Identifies ways to improve energy efficiency in the home, potentially reducing energy costs and environmental impact."
        case "Plant Trees or Support Tree Planting Initiatives":
            return "Trees absorb carbon dioxide, improve air quality, and support biodiversity and habitat for wildlife."
        case "Reduce Meat Consumption":
            return "Decreases the environmental impact of livestock farming, including reduced greenhouse gas emissions, water usage, and deforestation."
        case "Invest in a Reusable Coffee Cup":
            return "Reduces the use of disposable cups, which contributes to less waste and pollution."
        case "Use Natural Light":
            return "Saves energy by reducing the need for artificial lighting and can improve mental health and productivity."
        case "Educate Yourself and Others":
            return "Spreads awareness about environmental issues and sustainability practices, fostering a culture of conservation and responsible stewardship of the planet."
        default:
            return "Beneficial for the environment."
        }
    }
}
