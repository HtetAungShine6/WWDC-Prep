//
//  Quizzes.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 13/2/2567 BE.
//

import Foundation

//struct Quiz: Identifiable, Hashable {
//    var id: String = UUID().uuidString
//    var imageName: String
//    var question: String
//    var answerOne: String
//    var answerTwo: String
//    var answerThree: String
//    var answerFour: String
//    var correctAnswer: String
//}

struct Quiz {
    let id: String
    let imageName: String
    let question: String
    let answers: [String]
    let correctAnswer: String
    var userAnswer: String? = nil
    var isCorrect: Bool? = nil
}

let sampleQuizzes: [Quiz] = [
    Quiz(id: UUID().uuidString, imageName: "waveform.path.ecg", question: "What is the primary component of smog?", answers: ["Carbon Monoxide", "Ozone", "Sulfur Dioxide", "Nitrous Oxide"], correctAnswer: "Ozone"),
        Quiz(id: UUID().uuidString, imageName: "aqi.low", question: "What does AQI stand for?", answers: ["Air Quality Index", "Atmospheric Quotient Indicator", "Air Quantity Information", "Atmospheric Quality Index"], correctAnswer: "Air Quality Index"),
        Quiz(id: UUID().uuidString, imageName: "trash.slash.fill", question: "Which practice helps reduce methane emissions from landfills?", answers: ["Composting", "Incineration", "Landfill expansion", "Plastic use"], correctAnswer: "Composting"),
        Quiz(id: UUID().uuidString, imageName: "recycle", question: "What percentage of recyclable materials actually get recycled globally?", answers: ["About 9%", "About 20%", "About 50%", "About 70%"], correctAnswer: "About 9%"),
        Quiz(id: UUID().uuidString, imageName: "thermometer.sun.fill", question: "What phenomenon is causing coral bleaching?", answers: ["Ocean acidification", "Overfishing", "Global warming", "Plastic pollution"], correctAnswer: "Global warming"),
        Quiz(id: UUID().uuidString, imageName: "tortoise.fill", question: "Which species is critically endangered due to habitat loss and poaching?", answers: ["African Elephant", "Polar Bear", "Hawksbill Turtle", "Honeybee"], correctAnswer: "Hawksbill Turtle"),
        Quiz(id: UUID().uuidString, imageName: "seal.fill", question: "What is bycatch in the fishing industry?", answers: ["Target species catch", "Use of nets", "Unintended catch of non-target species", "Sustainable fishing methods"], correctAnswer: "Unintended catch of non-target species"),
        Quiz(id: UUID().uuidString, imageName: "leaf.arrow.circlepath", question: "Which practice is not a sustainable agricultural technique?", answers: ["Crop rotation", "Monoculture", "Integrated pest management", "Organic farming"], correctAnswer: "Monoculture"),
        Quiz(id: UUID().uuidString, imageName: "car.fill", question: "Electric vehicles reduce emissions by:", answers: ["Eliminating tailpipe emissions", "Using diesel fuel", "Increasing gas mileage", "Reducing vehicle weight"], correctAnswer: "Eliminating tailpipe emissions"),
        Quiz(id: UUID().uuidString, imageName: "wind", question: "What impact does deforestation have on the carbon cycle?", answers: ["Increases carbon storage", "Reduces carbon emissions", "Increases atmospheric carbon dioxide", "Stabilizes global temperatures"], correctAnswer: "Increases atmospheric carbon dioxide"),
        Quiz(id: UUID().uuidString, imageName: "flame.fill", question: "What is the main cause of wildfires in the United States?", answers: ["Lightning strikes", "Volcanic eruptions", "Human activities", "Animal activities"], correctAnswer: "Human activities"),
        Quiz(id: UUID().uuidString, imageName: "cloud.rain.fill", question: "Acid rain is primarily caused by:", answers: ["Natural forest fires", "Soil erosion", "Emissions of sulfur and nitrogen compounds", "Ozone layer depletion"], correctAnswer: "Emissions of sulfur and nitrogen compounds"),
        Quiz(id: UUID().uuidString, imageName: "snowflake.circle.fill", question: "The melting of polar ice caps contributes to:", answers: ["Decreased sea levels", "Increased biodiversity", "Increased sea levels", "Reduced carbon footprint"], correctAnswer: "Increased sea levels"),
        Quiz(id: UUID().uuidString, imageName: "sun.max.fill", question: "Solar energy generation works best in regions with:", answers: ["High rainfall", "Dense forests", "High winds", "High sunlight exposure"], correctAnswer: "High sunlight exposure"),
        Quiz(id: UUID().uuidString, imageName: "moon.stars.fill", question: "Nighttime energy demand can be a challenge for which renewable resource?", answers: ["Wind energy", "Solar energy", "Geothermal energy", "Biomass energy"], correctAnswer: "Solar energy"),
        Quiz(id: UUID().uuidString, imageName: "drop.fill", question: "Water conservation is critical in preventing:", answers: ["Air pollution", "Soil erosion", "Drought", "Ozone depletion"], correctAnswer: "Drought"),
        Quiz(id: UUID().uuidString, imageName: "globe.europe.africa.fill", question: "Which region is most affected by desertification?", answers: ["Arctic regions", "Tropical rainforests", "Sub-Saharan Africa", "European plains"], correctAnswer: "Sub-Saharan Africa"),
        Quiz(id: UUID().uuidString, imageName: "ant.fill", question: "Biodiversity is essential for:", answers: ["Increasing pollution", "Ecosystem resilience", "Reducing oxygen levels", "Monoculture farming"], correctAnswer: "Ecosystem resilience"),
        Quiz(id: UUID().uuidString, imageName: "hare.fill", question: "Which factor does not directly threaten biodiversity?", answers: ["Climate change", "Invasive species", "Natural disasters", "Conservation efforts"], correctAnswer: "Conservation efforts"),
        Quiz(id: UUID().uuidString, imageName: "flame.fill", question: "Greenhouse gases include all the following except:", answers: ["Methane", "Oxygen", "Nitrous oxide", "Carbon dioxide"], correctAnswer: "Oxygen")
    ]

//    Quiz(
//        id: UUID().uuidString,
//        imageName: "mappin.and.ellipse",
//        question: "What is the capital of France?",
//        answers: ["Paris", "London", "Berlin", "Madrid"],
//        correctAnswer: "Paris"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "flame",
//        question: "Which element has the chemical symbol 'O'?",
//        answers: ["Gold", "Oxygen", "Silver", "Iron"],
//        correctAnswer: "Oxygen"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "globe",
//        question: "What is the largest planet in our solar system?",
//        answers: ["Earth", "Mars", "Jupiter", "Saturn"],
//        correctAnswer: "Jupiter"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "book.closed",
//        question: "Who wrote 'Romeo and Juliet'?",
//        answers: ["William Shakespeare", "Jane Austen", "Leo Tolstoy", "Mark Twain"],
//        correctAnswer: "William Shakespeare"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "speedometer",
//        question: "What is the speed of light?",
//        answers: ["300,000 km/s", "150,000 km/s", "450,000 km/s", "600,000 km/s"],
//        correctAnswer: "300,000 km/s"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "cloud.heavyrain",
//        question: "What contributes most to climate change?",
//        answers: ["Video games", "Greenhouse gases", "Recycling", "Solar panels"],
//        correctAnswer: "Greenhouse gases"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "leaf.arrow.triangle.circlepath",
//        question: "How can we reduce air pollution?",
//        answers: ["Use more plastic", "Drive more cars", "Plant trees", "Increase industrial production"],
//        correctAnswer: "Plant trees"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "battery.100",
//        question: "What energy storage method helps reduce fossil fuel use?",
//        answers: ["Disposable batteries", "Rechargeable batteries", "Plastic bags", "Coal storage"],
//        correctAnswer: "Rechargeable batteries"
//    ),
//    Quiz(
//        id: UUID().uuidString,
//        imageName: "sun.max",
//        question: "What is the impact of using solar panels?",
//        answers: ["More water pollution", "Increased use of fossil fuels", "Reduction in greenhouse gases", "None of the above"],
//        correctAnswer: "Reduction in greenhouse gases"
//    )





//let sampleQuizzes: [Quiz] = [
//    .init(imageName: "bag.fill", question: "What do we do with plastic bags?", answerOne: "Throw away", answerTwo: "Keep them", answerThree: "Use them", answerFour: "Don't use them", correctAnswer: "Don't use them"),
//    .init(imageName: "leaf.arrow.circlepath", question: "What does recycling symbolize?", answerOne: "Waste", answerTwo: "Reuse", answerThree: "Reduce", answerFour: "Recycle", correctAnswer: "Recycle"),
//    .init(imageName: "tortoise.fill", question: "Which animal is often affected by plastic waste in oceans?", answerOne: "Deer", answerTwo: "Eagle", answerThree: "Tortoise", answerFour: "Rabbit", correctAnswer: "Tortoise"),
//    .init(imageName: "wind", question: "What is a renewable energy source?", answerOne: "Coal", answerTwo: "Oil", answerThree: "Wind", answerFour: "Nuclear", correctAnswer: "Wind"),
//    .init(imageName: "drop.fill", question: "Why is water conservation important?", answerOne: "Increase water bills", answerTwo: "Prevent drought", answerThree: "Make oceans fuller", answerFour: "None of the above", correctAnswer: "Prevent drought"),
//    .init(imageName: "globe.asia.australia.fill", question: "What contributes most to climate change?", answerOne: "Video games", answerTwo: "Greenhouse gases", answerThree: "Recycling", answerFour: "Solar panels", correctAnswer: "Greenhouse gases"),
//    .init(imageName: "car.fill", question: "How can we reduce air pollution?", answerOne: "Use more plastic", answerTwo: "Drive more cars", answerThree: "Plant trees", answerFour: "Increase industrial production", correctAnswer: "Plant trees"),
//    .init(imageName: "battery.100.bolt", question: "What energy storage method helps reduce fossil fuel use?", answerOne: "Disposable batteries", answerTwo: "Rechargeable batteries", answerThree: "Plastic bags", answerFour: "Coal storage", correctAnswer: "Rechargeable batteries"),
//    .init(imageName: "sun.max.fill", question: "What is the impact of using solar panels?", answerOne: "More water pollution", answerTwo: "Increased use of fossil fuels", answerThree: "Reduction in greenhouse gases", answerFour: "None of the above", correctAnswer: "Reduction in greenhouse gases")
//]
