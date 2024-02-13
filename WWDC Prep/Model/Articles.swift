//
//  Articles.swift
//  WWDC Prep
//
//  Created by Akito Daiki on 9/2/2567 BE.
//

import Foundation

struct Article: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var articlViews: Int
    var about: String
}

var sampleArticles: [Article] = [
    .init(title: "Global Warming From Fossil Fuels", imageName: "GlobalWarming", author: "DEENA ROBINSON", rating: 5, articlViews: 1200, about: "2023 was the hottest year on record, with global average temperatures at 1.46C above pre-industrial levels and 0.13C higher than the eleven-month average for 2016, currently the warmest calendar year on record. The year was marked by six record-breaking months and two record-breaking seasons. What’s more, carbon dioxide (CO2) levels have never been so high. After being consistently around 280 parts per million (ppm) for almost 6,000 years of human civilisation, CO2 levels in the atmosphere are now well above 420 ppm, more than double what they were before the onset of the Industrial Revolution in the 19th century. According to National Oceanic and Atmospheric Administration (NOAA) Administrator Rick Spinrad, the steady annual increase is a “direct result of human activity,” mainly from the burning of fossil fuels for transportation and electricity generation but also from cement manufacturing, deforestation, and agriculture. This is undoubtedly one of the biggest environmental problems of our lifetime: as greenhouse gas emissions blanket the Earth, they trap the sun’s heat, leading to global warming.\n\nIncreased emissions of greenhouse gases have led to a rapid and steady increase in global temperatures, which in turn is causing catastrophic events all over the world – from Australia and the US experiencing some of the most devastating bushfire seasons ever recorded, locusts swarming across parts of Africa, the Middle East and Asia, decimating crops, and a heatwave in Antarctica that saw temperatures rise above 20C for the first time. Scientists are constantly warning that the planet has crossed a series of tipping points that could have catastrophic consequences, such as advancing permafrost melt in Arctic regions, the Greenland ice sheet melting at an unprecedented rate, accelerating sixth mass extinction, and increasing deforestation in the Amazon rainforest, just to name a few. The climate crisis is causing tropical storms and other weather events such as hurricanes, heatwaves and flooding to be more intense and frequent than seen before. However, even if all greenhouse gas emissions were halted immediately, global temperatures would continue to rise in the coming years. That is why it is absolutely imperative that we start now to drastically reduce greenhouse gas emissions, invest in renewable energy sources, and phase our fossil fuels as fast as possible."),
    .init(title: "Plastic Pollution", imageName: "PlasticPollution", author: "DEENA ROBINSON", rating: 4, articlViews: 950, about: "In 1950, the world produced more than 2 million tons of plastic per year. By 2015, this annual production swelled to 419 million tons and exacerbating plastic waste in the environment. A report by science journal, Nature, determined that currently, roughly 14 million tons of plastic make their way into the oceans every year, harming wildlife habitats and the animals that live in them. The research found that if no action is taken, the plastic crisis will grow to 29 million metric tons per year by 2040. If we include microplastics into this, the cumulative amount of plastic in the ocean could reach 600 million tons by 2040. Shockingly, National Geographic found that 91% of all plastic that has ever been made is not recycled, representing not only one of the biggest environmental problems of our lifetime, but another massive market failure. Considering that plastic takes 400 years to decompose, it will be many generations until it ceases to exist. There’s no telling what the irreversible effects of plastic pollution will have on the environment in the long run."),
    .init(title: "What is a carbon footprint?", imageName: "CarbonFootprint", author: "KIERAN MULVANEY", rating: 4, articlViews: 800, about: "So, what exactly is a carbon footprint? According to Mike Berners-Lee, a professor at Lancaster University in the UK and author of The Carbon Footprint of Everything, it is “the sum total of all the greenhouse gas emissions that had to take place in order for a product to be produced or for an activity to take place.” For most consumers in developed countries, these products and activities tend to fall into four principal categories: household energy use, transport, food, and everything else, which is mostly the products we buy, from utensils to clothes to cars to television sets. Each of these activities and products has its own footprint; a person’s carbon footprint is the combined total of the products they buy and use, the activities they undertake, and so on. A person who regularly consumes beef will have a  larger food footprint than his vegan neighbor, but that neighbor’s overall footprint may be larger if she drives an hour to work and back in an SUV each day while our meat-eater bicycles to his office nearby.\n\nBoth their footprints may pale in comparison to the businesswoman across the street, who flies first-class cross-country twice a month. Unsurprisingly, in general terms the size of a person’s carbon footprint tends to increase with wealth. In his book, Berners-Lee writes that the average global citizen has a carbon footprint that is equivalent to the emission of seven tons of carbon dioxide per year. However, that figure is approximately 13 tons for the average Briton and roughly 21 tons per person in the United States.; The “average American takes just a couple of days to match the annual footprint of the average Nigerian or Malian,” he writes."),
    .init(title: "Global research on carbon footprint: A scientometric review", imageName: "Research", author: "Shaoqing Shi, Jianhua Yin", rating: 5, articlViews: 1100, about: "This study delves into the evolution of carbon footprint research amidst global climate change, highlighting the lack of a comprehensive literature review in this domain. Utilizing 7450 articles from the Web of Science Core Collection, the research spans from 1992 to 2019, showcasing a thematic shift from ecology and botany to international trade and household behaviors, with water vapor as a consistently significant topic. The analysis reveals a trend of expanding research scope, transitioning from individual and family levels to broader organizational and national scales, with 2008 marked as a pivotal year for diversification and interdisciplinary growth.\n\nThe research landscape has been notably influenced by Chinese scholars and institutions post-2008, despite the predominance of North American and European collaborations. Carbon footprint research, initially focused on veterinary and animal science, has increasingly merged with economic studies, reflecting a significant thematic evolution and application to environmental, toxicology, and nutrition fields. This transition underscores the growing complexity and relevance of carbon footprint analyses in addressing global environmental challenges.\n\nThe core of carbon footprint research lies in its ability to quantify the direct and indirect carbon dioxide emissions associated with various activities and products, offering a nuanced view of consumer responsibility throughout a product's life cycle. This perspective facilitates targeted strategies for emission reduction and sustainable development, supported by life cycle analysis (LCA) and input-output analysis (IOA) methodologies. The research also highlights the importance of carbon footprint as a tool for fostering global cooperation and developing comprehensive strategies to mitigate carbon emissions.\n\nAddressing the need for a systematic review, this study utilizes knowledge graphs and bibliometrics to map the theoretical framework and evolution of carbon footprint research over the past 28 years. By answering key research questions on the knowledge base, cooperation network, and thematic drifts within carbon footprint studies, the research provides valuable insights into the discipline's development and future directions. This systematic approach not only clarifies the trajectory of carbon footprint research but also emphasizes its critical role in global efforts towards environmental sustainability."),
    .init(title: "The U.S. is missing a ton of snow — even with recent storms", imageName: "US", author: "Evan Bush", rating: 5, articlViews: 1300, about: "Storms are hammering much of the northern U.S., providing a welcome relief for some parts of the country that have received little or no snow in recent months. A sluggish start to winter through early January has constrained ski areas and raised early concerns about the water supply for summer. 'We’re playing catch-up now,' said Dan McEvoy, a regional climatologist at the Desert Research Institute in Reno, Nevada. About 800 monitoring stations track snow accumulation in the West, and more than 90% of those stations reported measurements below the median for this time of year, indicating a rare and widespread shortfall across the regions.\n\nIn western states, the size of the snowpack directly influences how much water farmers can use, the severity of the wildfire season, and the power generation capacity of hydropower dams. Climate scientists expect snowpack to decrease as the climate warms, further threatening a supply that’s already strained in most parts of the West. Research published in the journal Nature found that climate change is to blame for the declining trend in snowpack, posing a significant threat to water supplies for more than 2 billion people.\n\nMankin and Alexander Gottlieb, Earth systems scientists at Dartmouth, analyzed snowpack in 169 river basins in the Northern Hemisphere. They identified clear trends of sharp declines in snowpack, especially in basins that provide water to populated regions, with global warming being a driving factor behind these changes. 'Once snow goes off a cliff, it accelerates off a cliff,' Mankin said, highlighting the urgency of the situation and the unpreparedness for such rapid changes.\n\nAs of the beginning of January, only 20% of the continental U.S. had snow on the ground after a mild December, with recent storms only increasing coverage to about 45%. A ridge of high pressure blocked moisture in December, leaving significant areas dry. Despite recent improvements, the overall pattern does not seem to be changing, with forecasts predicting a warmer and drier winter for most northern states, partly due to a strong El Niño. 'El Niño is the double whammy, with the background warming of climate change and the warm ocean water of the Pacific adding more heat and energy to the atmosphere,' McEvoy explained, setting the stage for a challenging year ahead.")
]
