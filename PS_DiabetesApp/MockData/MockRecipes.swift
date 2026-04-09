import Foundation

enum MockRecipes {

    static let all: [Recipe] = [

        Recipe(
            id: UUID(),
            title: "Griechischer Joghurt-Parfait",
            emoji: "🫙",
            shortDescription: "Cremig, sättigend und in Minuten fertig. Toll zum Frühstück oder als schnellen Snack.",
            prepTime: "5 Min.",
            cookTime: "0 Min.",
            servings: 1,
            tags: [.breakfast, .snack, .highProtein, .quickAndEasy],
            ingredients: [
                "½ Tasse griechischer Naturjoghurt (Vollfett oder fettarm)",
                "¼ Tasse frische Beeren (Erdbeeren, Heidelbeeren oder Himbeeren)",
                "1 EL gehackte Walnüsse oder Mandeln",
                "1 TL Chiasamen",
                "Optional: ein Spritzer Honig"
            ],
            steps: [
                "Joghurt in eine Schüssel oder ein Glas geben.",
                "Frische Beeren darauf verteilen.",
                "Nüsse und Chiasamen darüberstreuen.",
                "Bei Bedarf etwas Honig dazugeben.",
                "Sofort genießen oder für einige Stunden kühlen."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Ei & Gemüse Rührei",
            emoji: "🍳",
            shortDescription: "Ein sättigendes, proteinreiches Frühstück, das dich anhält, ohne den Zucker in die Höhe zu treiben.",
            prepTime: "5 Min.",
            cookTime: "10 Min.",
            servings: 1,
            tags: [.breakfast, .highProtein, .lowSugar, .quickAndEasy],
            ingredients: [
                "2 große Eier",
                "¼ Tasse gewürfelte Paprika (beliebige Farbe)",
                "¼ Tasse Babyspinat",
                "2 EL gewürfelte rote Zwiebel",
                "1 TL Olivenöl",
                "Salz und Pfeffer nach Geschmack",
                "Optional: eine Prise Feta-Käse"
            ],
            steps: [
                "Olivenöl in einer kleinen Pfanne bei mittlerer Hitze erhitzen.",
                "Paprika und Zwiebel hinzufügen, 2–3 Minuten dünsten bis sie weich sind.",
                "Spinat hinzufügen und rühren bis er zusammenfällt (ca. 1 Minute).",
                "Eier in einer Schüssel verquirlen, mit Salz und Pfeffer würzen.",
                "Eier in die Pfanne geben und sanft rühren, bis sie gerade gestockt sind.",
                "Feta darübergeben, falls verwendet, und warm servieren."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Kichererbsen-Gurken-Salat",
            emoji: "🥗",
            shortDescription: "Leicht, erfrischend und voller pflanzlicher Proteine. Fertig in unter 10 Minuten.",
            prepTime: "10 Min.",
            cookTime: "0 Min.",
            servings: 2,
            tags: [.lunch, .vegetarian, .highProtein, .quickAndEasy],
            ingredients: [
                "1 Dose (400 g) Kichererbsen, abgetropft und abgespült",
                "1 mittlere Gurke, gewürfelt",
                "1 Tasse Kirschtomaten, halbiert",
                "¼ rote Zwiebel, fein gewürfelt",
                "2 EL frische Petersilie, gehackt",
                "2 EL Olivenöl",
                "1 EL Zitronensaft",
                "Salz und Pfeffer nach Geschmack"
            ],
            steps: [
                "Kichererbsen gründlich abspülen.",
                "Kichererbsen, Gurke, Tomaten und rote Zwiebel in einer Schüssel vermischen.",
                "Petersilie hinzufügen und alles gut vermengen.",
                "Olivenöl und Zitronensaft darüber träufeln.",
                "Mit Salz und Pfeffer würzen.",
                "Sofort servieren oder bis zu 2 Tage kühlen."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Gebackener Zitronen-Lachs",
            emoji: "🐟",
            shortDescription: "Einfach, geschmackvoll und eine der besten Proteinquellen überhaupt.",
            prepTime: "5 Min.",
            cookTime: "15 Min.",
            servings: 2,
            tags: [.dinner, .highProtein, .lowSugar],
            ingredients: [
                "2 Lachsfilets (je ca. 150 g)",
                "1 Zitrone, in Scheiben geschnitten",
                "2 Knoblauchzehen, fein gehackt",
                "1 EL Olivenöl",
                "1 TL getrockneter Oregano",
                "Salz und Pfeffer nach Geschmack",
                "Frische Petersilie zum Garnieren"
            ],
            steps: [
                "Ofen auf 200 °C vorheizen.",
                "Lachsfilets auf ein ausgelegtes Backblech legen.",
                "Olivenöl, Knoblauch, Oregano, Salz und Pfeffer vermischen.",
                "Die Mischung über den Lachs streichen.",
                "Zitronenscheiben darauflegen.",
                "12–15 Minuten backen, bis der Lachs leicht zerfällt.",
                "Mit frischer Petersilie garnieren und mit Gemüse oder einem Beilagensalat servieren."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Erdnussbutter-Bananen-Happen",
            emoji: "🥜",
            shortDescription: "Ein schneller Snack, der natürlichen Zucker mit gesunden Fetten und Proteinen ausgleicht.",
            prepTime: "5 Min.",
            cookTime: "0 Min.",
            servings: 1,
            tags: [.snack, .quickAndEasy],
            ingredients: [
                "1 kleine Banane",
                "1–2 EL natürliche Erdnussbutter (ohne Zuckerzusatz)",
                "Optional: eine Prise Zimt"
            ],
            steps: [
                "Banane schälen und in Scheiben schneiden.",
                "Auf einem Teller anrichten.",
                "Etwas Erdnussbutter auf jede Scheibe geben.",
                "Mit Zimt bestreuen, wenn gewünscht.",
                "Sofort genießen."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Linsen-Tomaten-Suppe",
            emoji: "🍲",
            shortDescription: "Wärmend, sättigend und reich an Ballaststoffen. Toll als Mittagessen oder leichtes Abendessen.",
            prepTime: "10 Min.",
            cookTime: "25 Min.",
            servings: 4,
            tags: [.lunch, .dinner, .vegetarian, .highProtein],
            ingredients: [
                "1 Tasse rote Linsen, gespült",
                "1 Dose (400 g) gehackte Tomaten",
                "1 mittlere Zwiebel, gewürfelt",
                "2 Knoblauchzehen, fein gehackt",
                "1 TL Kreuzkümmel",
                "1 TL geräuchertes Paprikapulver",
                "1 EL Olivenöl",
                "750 ml Gemüsebrühe",
                "Salz und Pfeffer nach Geschmack",
                "Frischer Koriander oder Petersilie zum Servieren"
            ],
            steps: [
                "Olivenöl in einem Topf bei mittlerer Hitze erhitzen.",
                "Zwiebel und Knoblauch hinzufügen, 3–4 Minuten dünsten bis sie weich sind.",
                "Kreuzkümmel und Paprikapulver hinzufügen, 1 Minute rühren.",
                "Linsen, Tomaten und Gemüsebrühe hinzufügen.",
                "Aufkochen, dann Hitze reduzieren und 20 Minuten köcheln lassen, bis die Linsen weich sind.",
                "Mit Salz und Pfeffer abschmecken.",
                "Für eine cremigere Konsistenz teilweise pürieren oder stückig lassen.",
                "Mit frischen Kräutern servieren."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Avocado-Toast mit Ei",
            emoji: "🥑",
            shortDescription: "Die klassische Kombination – gesunde Fette, Protein und befriedigender Crunch.",
            prepTime: "5 Min.",
            cookTime: "5 Min.",
            servings: 1,
            tags: [.breakfast, .lunch, .quickAndEasy, .highProtein],
            ingredients: [
                "1 Scheibe Vollkorn- oder Sauerteigbrot",
                "½ reife Avocado",
                "1 Ei (pochiert oder gebraten)",
                "Eine Prise Chiliflocken",
                "Salz und schwarzer Pfeffer",
                "Optional: ein Spritzer Zitronensaft"
            ],
            steps: [
                "Brot toasten bis es goldbraun ist.",
                "Avocado mit einer Gabel zerdrücken, mit Salz, Pfeffer und Zitronensaft würzen.",
                "Avocado auf den Toast streichen.",
                "Ei nach Wunsch zubereiten – gebraten oder pochiert, beides ist toll.",
                "Ei darauflegen.",
                "Mit Chiliflocken bestreuen und sofort servieren."
            ]
        ),

        Recipe(
            id: UUID(),
            title: "Overnight Oats",
            emoji: "🌾",
            shortDescription: "Abends vorbereiten für ein einfaches, unkompliziertes Frühstück, das dich satt hält.",
            prepTime: "5 Min.",
            cookTime: "0 Min. (über Nacht quellen lassen)",
            servings: 1,
            tags: [.breakfast, .vegetarian, .quickAndEasy],
            ingredients: [
                "½ Tasse Haferflocken",
                "½ Tasse Milch (beliebige Sorte)",
                "¼ Tasse griechischer Naturjoghurt",
                "1 EL Chiasamen",
                "½ TL Vanilleextrakt",
                "Toppings: Beeren, Nüsse oder ein Spritzer Nussmus"
            ],
            steps: [
                "Haferflocken, Milch, Joghurt, Chiasamen und Vanille in einem Glas oder Behälter vermischen.",
                "Gut umrühren, bis alles verbunden ist.",
                "Abdecken und über Nacht kühlen (oder mindestens 4 Stunden).",
                "Morgens umrühren – bei zu dicker Konsistenz etwas mehr Milch hinzufügen.",
                "Mit Lieblingsbeeren, Nüssen oder Nussmus toppen.",
                "Kalt direkt aus dem Kühlschrank genießen."
            ]
        )
    ]
}
