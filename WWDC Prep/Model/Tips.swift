//
//  Tips.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import Foundation

struct Tip: Identifiable {
    let id = UUID()
    let title: String
    let detail: String
    let imageName: String
    
    static let sampleTips: [Tip] = [
        Tip(title: "Reusable Bags", detail: "Use reusable bags to reduce plastic waste and protect marine life.", imageName: "bag.fill"),
        Tip(title: "Shorter Showers", detail: "Taking shorter showers can save gallons of water over time.", imageName: "drop.fill"),
        Tip(title: "Refuse Plastics", detail: "Avoiding single-use plastics helps reduce ocean pollution.", imageName: "tortoise.fill"),
        Tip(title: "Walk More", detail: "Walking or biking reduces carbon emissions and can improve your health.", imageName: "figure.walk"),
        Tip(title: "Plant-Based Diet", detail: "Eating plant-based meals can reduce water usage and greenhouse gases.", imageName: "leaf.fill"),
        Tip(title: "Save Energy", detail: "Turning off unused lights and electronics saves energy and money.", imageName: "lightbulb.fill"),
        Tip(title: "Public Transport", detail: "Using public transportation can cut down on traffic and pollution.", imageName: "bus.fill"),
        Tip(title: "Recycle", detail: "Proper recycling can reduce waste and the need for new raw materials.", imageName: "arrow.3.trianglepath"),
        Tip(title: "Composting", detail: "Composting food scraps turns waste into valuable fertilizer.", imageName: "leaf.arrow.circlepath"),
        Tip(title: "Support Local", detail: "Buying local produce reduces transportation and supports the local economy.", imageName: "cart.fill"),
        Tip(title: "Water Bottle", detail: "Carrying a reusable water bottle decreases the use of disposable plastics.", imageName: "flask.fill"),
        Tip(title: "Energy Audit", detail: "Conducting a home energy audit can identify ways to improve efficiency.", imageName: "house.fill"),
        Tip(title: "Dry Clothes Naturally", detail: "Line-drying clothes saves energy and reduces wear and tear.", imageName: "wind"),
        Tip(title: "Go Digital", detail: "Opt for digital documents over printing to save paper.", imageName: "doc.text.fill"),
        Tip(title: "Tree Planting", detail: "Planting trees absorbs CO2 and enhances the urban environment.", imageName: "leaf.fill"),
        Tip(title: "Smart Thermostat", detail: "Using a smart thermostat can optimize heating and cooling efficiency.", imageName: "thermometer"),
        Tip(title: "Eco-friendly Products", detail: "Choose eco-friendly and sustainable products when shopping.", imageName: "cart.fill"),
        Tip(title: "Water Conservation", detail: "Fix leaks and install low-flow fixtures to conserve water.", imageName: "drop.fill"),
        Tip(title: "Unplug Devices", detail: "Unplug electronics when not in use to prevent 'vampire' energy loss.", imageName: "powerplug.fill"),
        Tip(title: "Educate Others", detail: "Share knowledge about sustainability practices with friends and family.", imageName: "books.vertical.fill")
    ]
}
