import Foundation

// Static mock lessons. All content is written in plain, friendly language.
// Medical accuracy is intentionally kept general — this is educational, not clinical.
enum MockLessons {

    static let all: [Lesson] = whatIsT1D + dailyLife + foodCarbs

    // MARK: - Was ist T1D? (6 Lektionen)

    static let whatIsT1D: [Lesson] = [

        Lesson(
            id: UUID(),
            category: .whatIsT1D,
            title: "Dein Körper & Insulin",
            emoji: "🫀",
            shortDescription: "Erfahre, warum deine Bauchspeicheldrüse aufgehört hat, Insulin zu produzieren – und was das wirklich bedeutet.",
            pages: [
                LessonPage(id: UUID(), heading: "Jeder braucht Insulin",
                    body: "Insulin ist ein Hormon, das dein Körper verwendet, um die Nahrung, die du isst, in Energie umzuwandeln. Stell dir vor, es ist wie ein Schlüssel – er öffnet deine Zellen, damit Zucker (Glukose) aus deiner Nahrung hineinkann und dich antreibt.",
                    illustrationName: "key.fill",
                    sciHeading: "Insulin: ein Peptidhormon",
                    sciBody: "Insulin ist ein Peptidhormon, das von den β-Zellen der Langerhans-Inseln in der Bauchspeicheldrüse sezerniert wird. Es bindet an den Insulinrezeptor (Tyrosinkinase-Rezeptor) und aktiviert über den PI3K/Akt-Signalweg die GLUT4-Translokation in Muskel- und Fettzellen, wodurch Glukose aus dem Blut aufgenommen wird."),
                LessonPage(id: UUID(), heading: "Bei Typ 1 schließt die Schlüsselfabrik",
                    body: "Bei Typ-1-Diabetes greift dein Immunsystem versehentlich die Zellen in deiner Bauchspeicheldrüse an, die Insulin produzieren. Es ist nicht deine Schuld – es wird nicht durch Ernährung oder Lebensstil verursacht. Dein Körper hat einfach aufgehört, den Schlüssel zu produzieren.",
                    illustrationName: "exclamationmark.shield",
                    sciHeading: "Autoimmune β-Zell-Destruktion",
                    sciBody: "T1DM ist eine T-Zell-mediierte Autoimmunerkrankung, bei der CD4⁺/CD8⁺-Lymphozyten und Autoantikörper (GAD65, IA-2, ZnT8, Insulin-Autoantikörper) die β-Zellen des Pankreas irreversibel zerstören. Der resultierende absolute Insulinmangel führt zu unkontrollierter Hyperglykämie, gestörtem Lipidstoffwechsel und erhöhtem Ketoazidose-Risiko."),
                LessonPage(id: UUID(), heading: "Also bringst du deine eigenen Schlüssel mit",
                    body: "Da deine Bauchspeicheldrüse kein Insulin mehr produzieren kann, gibst du es dir selbst – durch Injektionen oder eine Insulinpumpe. Du machst im Grunde manuell, was deine Bauchspeicheldrüse früher automatisch getan hat.",
                    illustrationName: "cross.case.fill",
                    sciHeading: "Exogene Insulinsubstitution",
                    sciBody: "Da die endogene Insulinsekretion vollständig fehlt, ist eine lebenslange exogene Insulinsubstitution obligat. Diese erfolgt entweder als intensivierte konventionelle Insulintherapie (ICT, 4–5 Injektionen/Tag) oder als kontinuierliche subkutane Insulininfusion (CSII) per Pumpe, idealerweise gekoppelt mit kontinuierlichem Glukosemonitoring (CGM)."),
                LessonPage(id: UUID(), heading: "Du bist nicht allein",
                    body: "Weltweit leben rund 8 Millionen Menschen mit Typ-1-Diabetes. Athleten, Künstler, Ingenieure, Eltern – Menschen, die ein erfülltes, reiches Leben führen. T1D ist ein Teil deiner Geschichte, nicht die ganze Geschichte.",
                    illustrationName: "person.3.fill",
                    sciHeading: "Epidemiologie des T1DM",
                    sciBody: "Die Prävalenz von T1DM liegt in westlichen Industrieländern bei 0,3–0,5 % der Bevölkerung. Die globale Inzidenz steigt jährlich um ca. 3–4 %, besonders in der Altersgruppe < 15 Jahre. Die Ätiologie ist multifaktoriell: genetische Prädisposition (HLA-DR3/DR4-Haplotypen, Non-HLA-Gene wie PTPN22, INS) kombiniert mit Umwelttriggern (Enteroviren, veränderte Darmmikrobiota).")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .whatIsT1D,
            title: "Was ist Blutzucker?",
            emoji: "🩸",
            shortDescription: "Verstehe, was Glukose ist, warum sie wichtig ist und was 'im Bereich' bedeutet.",
            pages: [
                LessonPage(id: UUID(), heading: "Glukose ist einfach Kraftstoff",
                    body: "Glukose ist eine Zuckerart, die aus der Nahrung stammt, die du isst – besonders aus Kohlenhydraten. Dein Gehirn und deine Muskeln lieben sie. Sie ist der primäre Treibstoff, von dem dein Körper lebt.",
                    illustrationName: "bolt.fill",
                    sciHeading: "Glukose als zentrales Stoffwechselsubstrat",
                    sciBody: "D-Glukose (Dextrose) ist das primäre Energiesubstrat für Gehirn, Erythrozyten und intensiv arbeitende Muskulatur. Sie wird über SGLT1/2 intestinal resorbiert und über GLUT-Transporter zellulär aufgenommen. Plasmaglukosewerte werden in mg/dl oder mmol/L angegeben (Umrechnungsfaktor: 1 mmol/L = 18 mg/dl)."),
                LessonPage(id: UUID(), heading: "Dein Blut transportiert sie überall hin",
                    body: "Nach dem Essen tritt Glukose in deinen Blutkreislauf ein. Dein Blutzuckerspiegel ist einfach, wie viel Glukose sich zu einem bestimmten Zeitpunkt in deinem Blut befindet. Er steigt nach dem Essen natürlich an und sinkt, wenn dein Körper ihn verbraucht.",
                    illustrationName: "arrow.up.arrow.down",
                    sciHeading: "Glukosehomöostase und postprandialer Verlauf",
                    sciBody: "Die Plasmaglukose steigt postprandial durch intestinale Resorption und initial verstärkte hepatische Glukoseabgabe. Insulin supprimiert die hepatische Glukoseproduktion und stimuliert die periphere Aufnahme. Bei T1DM entfällt diese Regulation; ohne Bolusinsulin entstehen prolongierte postprandiale Hyperglykämien."),
                LessonPage(id: UUID(), heading: "Im Gleichgewicht halten",
                    body: "Für Menschen mit T1D bedeutet die Kontrolle des Blutzuckers, ihn davon abzuhalten, zu hoch (Hyperglykämie) oder zu niedrig (Hypoglykämie) zu werden. Dein Behandlungsteam hilft dir, deinen persönlichen Zielbereich zu finden.",
                    illustrationName: "waveform.path.ecg",
                    sciHeading: "Therapeutische Zielwerte",
                    sciBody: "Leitliniengerechte Zielwerte (DDG/ADA 2024): Nüchternglukose 80–130 mg/dl, postprandialer Peak < 180 mg/dl, HbA1c < 7,0 % (53 mmol/mol) für die meisten Erwachsenen. CGM-basiertes Time in Range (TIR 70–180 mg/dl) > 70 % bei < 4 % Werten < 70 mg/dl und < 1 % Werten < 54 mg/dl gilt als ergänzendes Therapieziel.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .whatIsT1D,
            title: "T1D vs. T2D",
            emoji: "🔄",
            shortDescription: "Sie teilen einen Namen, sind aber sehr unterschiedlich. Hier ist, was T1D auszeichnet.",
            pages: [
                LessonPage(id: UUID(), heading: "Gleicher Name, andere Erkrankung",
                    body: "Typ-1- und Typ-2-Diabetes betreffen beide den Blutzucker, haben aber unterschiedliche Ursachen und funktionieren anders. Das zu verstehen hilft, wenn Menschen Annahmen treffen.",
                    illustrationName: "questionmark.circle",
                    sciHeading: "Differenzialdiagnose T1DM vs. T2DM",
                    sciBody: "T1DM und T2DM unterscheiden sich fundamental in Pathogenese, Ätiologie und Therapie. T1DM ist eine Autoimmunerkrankung mit absolutem Insulinmangel, positiven Autoantikörpern und HLA-DR3/DR4-Assoziation. T2DM ist primär durch periphere Insulinresistenz und relative β-Zell-Insuffizienz charakterisiert, stark mit Adipositas und Bewegungsmangel assoziiert."),
                LessonPage(id: UUID(), heading: "Typ 1: eine Autoimmunerkrankung",
                    body: "T1D ist Autoimmun. Dein Immunsystem hat deine insulinproduzierenden Zellen angegriffen. Es kann in jedem Alter und bei jedem auftreten und wird nicht durch Lebensstil oder Ernährung verursacht. Zur Kontrolle ist immer Insulin erforderlich.",
                    illustrationName: "shield.slash",
                    sciHeading: "Genetische und immunologische Unterschiede",
                    sciBody: "T1DM ist mit spezifischen HLA-Klasse-II-Allelen (DR3-DQ2, DR4-DQ8) assoziiert und zeigt polygenetische Non-HLA-Komponenten (PTPN22, IL2RA, CTLA4). LADA (Latent Autoimmune Diabetes in Adults) repräsentiert eine Übergangsform mit langsamerer Autoimmunprogression, oft initial als T2DM fehlklassifiziert. Autoantikörper-Screening (GAD65) differenziert zuverlässig."),
                LessonPage(id: UUID(), heading: "Typ 2: Insulinresistenz",
                    body: "Bei T2D produziert der Körper noch Insulin, nutzt es aber nicht effektiv. Er wird oft mit Ernährung, Bewegung und Medikamenten kontrolliert. Manche Menschen mit T2D verwenden auch Insulin, aber nicht alle.",
                    illustrationName: "arrow.triangle.2.circlepath",
                    sciHeading: "Gemeinsame Komplikationspfade",
                    sciBody: "Chronische Hyperglykämie führt bei beiden Entitäten zu mikro- und makrovaskulären Komplikationen über gemeinsame Pathomechanismen: Advanced Glycation End Products (AGEs), Polyolweg-Aktivierung, Proteinkinase-C-Aktivierung und erhöhter oxidativer Stress. Die DCCT/EDIC-Studie belegt, dass intensive Glukosekontrolle bei T1DM Komplikationsraten signifikant reduziert (HR 0,27 für Retinopathie)."),
                LessonPage(id: UUID(), heading: "Warum es wichtig ist",
                    body: "Menschen sagen manchmal: 'Hast du zu viel Zucker gegessen?' Das ist ein T2D-Mythos, der auf T1D angewendet wird – und er ist falsch. Den Unterschied zu kennen hilft dir, deine Erkrankung auf deine eigene Weise zu erklären.",
                    illustrationName: "text.bubble.fill",
                    sciHeading: "Glukosevariabilität und klinische Relevanz",
                    sciBody: "Glukosevariabilität (GV) wird durch den Variationskoeffizienten (CV) quantifiziert; ein CV < 36 % gilt als stabiler Verlauf. Erhöhte GV ist unabhängig vom HbA1c mit endothelialer Dysfunktion, oxidativem Stress und kardiovaskulären Komplikationen assoziiert. Der Standard Deviation (SD) der Glukose ist ein weiteres klinisch relevantes Maß.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .whatIsT1D,
            title: "Insulin-Typen einfach erklärt",
            emoji: "💉",
            shortDescription: "Bolus, Basal, schnell, langsam – hier wird es verständlich.",
            pages: [
                LessonPage(id: UUID(), heading: "Nicht jedes Insulin ist gleich",
                    body: "Es gibt verschiedene Insulintypen, die sich darin unterscheiden, wie schnell sie wirken und wie lange sie aktiv bleiben. Das klingt kompliziert – ist aber logischer als es aussieht.",
                    illustrationName: "chart.line.uptrend.xyaxis",
                    sciHeading: "Pharmakodynamische Klassifikation",
                    sciBody: "Insuline werden nach Wirkbeginn, Peak und Wirkdauer klassifiziert. Kurzwirksame Analoga (Lispro, Aspart, Glulisin): Beginn 10–15 min, Peak 1–2 h, Dauer 3–5 h. Humaninsulin (Normalinsulin): Beginn 30–60 min, Peak 2–4 h, Dauer 5–8 h. Basalanaloga (Glargin, Detemir, Degludec): peakarmes/peakloses Profil, Dauer 16–42 h."),
                LessonPage(id: UUID(), heading: "Schnell wirkendes Insulin",
                    body: "Schnell wirkendes Insulin (auch Bolus-Insulin genannt) wirkt innerhalb von Minuten und ist ideal zu den Mahlzeiten. Es deckt den Zuckeranstieg durch das Essen ab. Dein Behandlungsteam legt fest, wie viel du wann brauchst.",
                    illustrationName: "bolt.circle.fill",
                    sciHeading: "Prandiale Insulinanaloga",
                    sciBody: "Schnellwirksame Insulinanaloga (z.B. Aspart, Lispro) entstehen durch Aminosäuresubstitutionen, die die Hexamerisierung verhindern und die Absorption aus dem subkutanen Depot beschleunigen. Ultra-Rapid-Analoga (Fiasp, Lyumjev) mit zusätzlichen Absorptionsverstärkern (Niacinamid, Citrat) haben Wirkbeginn < 5 min und decken den prandial-bedingten Glukoseanstieg effektiver."),
                LessonPage(id: UUID(), heading: "Lang wirkendes Insulin",
                    body: "Lang wirkendes Insulin (auch Basal-Insulin genannt) arbeitet still im Hintergrund – über viele Stunden. Es hält deinen Blutzucker stabil, wenn du gerade nicht isst. Zusammen bilden Bolus und Basal ein Team.",
                    illustrationName: "moon.zzz.fill",
                    sciHeading: "Basalinsuline und ihre Pharmakodynamik",
                    sciBody: "Insulinglargin U300 und Insulindegludec bilden subkutane Depots (Mikropräzipitate bzw. lösliche Multihexamere), die eine gleichmäßige, langanhaltende Absorption gewährleisten. Degludec (> 42 h Wirkdauer) ermöglicht flexible Injektionszeitpunkte und zeigt in RCTs signifikant weniger nächtliche Hypoglykämien (SWITCH-Studie, HR 0,64) gegenüber Glargin U100."),
                LessonPage(id: UUID(), heading: "Dein Team findet die richtige Balance",
                    body: "Die richtige Kombination und Dosierung ist für jeden anders und ändert sich mit der Zeit. Vertrau deinem Behandlungsteam – gemeinsam findet ihr, was für deinen Körper am besten passt.",
                    illustrationName: "checkmark.seal.fill",
                    sciHeading: "Closed-Loop-Systeme",
                    sciBody: "Hybride Closed-Loop-Systeme (HCL) integrieren CGM, Insulinpumpe und Steuerungsalgorithmen (MPC, PID). Klinische Studien (CLOSED, DCLP3) zeigen TIR-Verbesserung von 65 % auf 72–77 % und HbA1c-Reduktion um 0,3–0,5 %. Vollautomatische Systeme (iAPS, Omnipod 5) erfordern noch manuelle Mahlzeitankündigung; prädiktive Algorithmen reduzieren Hypoglykämien nachts signifikant.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .whatIsT1D,
            title: "Diabetes-Technologie",
            emoji: "📱",
            shortDescription: "CGMs, Pumpen, Apps – ein Überblick über Tools, die das Leben mit T1D erleichtern können.",
            pages: [
                LessonPage(id: UUID(), heading: "Technologie, die hilft",
                    body: "In den letzten Jahren hat sich viel getan. Heute gibt es Tools, die das Leben mit T1D erheblich einfacher machen können. Kein Muss – aber es lohnt sich, darüber Bescheid zu wissen.",
                    illustrationName: "iphone",
                    sciHeading: "Kapilläre Blutglukosemessung (SMBG)",
                    sciBody: "Selbstkontrolle der Blutglukose (SMBG) mittels Stechhilfe und Teststreifen liefert punktuelle Plasmawerte (enzymatische Messung via Glucoseoxidase/GOD-POD). SMBG-Frequenz korreliert mit HbA1c-Verbesserung; jedoch fehlen Trendinfos und Hypoalarmierung. Die Messungenauigkeit (MARD ca. 10–15 %) ist ISO-15197-standardisiert."),
                LessonPage(id: UUID(), heading: "Kontinuierliche Glukosemessung (CGM)",
                    body: "Ein CGM ist ein kleines Gerät, das du am Körper trägst und deinen Blutzucker rund um die Uhr misst – ohne ständiges Stechen. Es zeigt nicht nur den aktuellen Wert, sondern auch den Trend. Das ist ein riesiger Fortschritt.",
                    illustrationName: "waveform.path.ecg",
                    sciHeading: "Kontinuierliche Glukosemessung (CGM)",
                    sciBody: "CGM-Systeme messen Gewebeglukose im Interstitium elektrochemisch (Glucoseoxidase-Elektrode). Der physiologische Lag zur Plasmaglukose beträgt 5–10 min. Aktuelle Systeme (Dexcom G7, Libre 3) erreichen MARD-Werte < 9 %, streamen kontinuierlich und ermöglichen alarmbasiertes Hypo-/Hyperglykämiemanagement. Klinische Evidenz: HbA1c-Senkung −0,3 bis −0,5 % (RCTs DIAMOND, GOLD)."),
                LessonPage(id: UUID(), heading: "Insulinpumpen",
                    body: "Eine Insulinpumpe ist ein kleines Gerät, das kontinuierlich Insulin abgibt und Injektionen ersetzt. Für manche Menschen ist das ein Gamechanger – für andere funktionieren Spritzen genauso gut. Beides ist eine valide Wahl.",
                    illustrationName: "cross.case.fill",
                    sciHeading: "CSII — kontinuierliche subkutane Insulininfusion",
                    sciBody: "Insulinpumpen applizieren schnellwirksames Analoginsulin (Aspart, Lispro) kontinuierlich subkutan mit programmierbaren Basalraten und Boli. Vorteile vs. ICT: temporäre Basalratenänderung für Sport/Stress, präzisere Mikroboli (0,025 U), verlängerter/dualer Wellenbolus. Hybride Closed-Loop-Systeme automatisieren Basalraten basierend auf CGM-Prädiktionen."),
                LessonPage(id: UUID(), heading: "Es ist deine Entscheidung",
                    body: "Welche Technologie du nutzt, ist eine persönliche Entscheidung – basierend auf deinem Lebensstil, deinen Vorlieben und was dein Behandlungsteam empfiehlt. Es gibt kein Richtig oder Falsch.",
                    illustrationName: "hand.thumbsup.fill",
                    sciHeading: "Emerging Technologies",
                    sciBody: "Implantierbare CGM-Sensoren (Eversense) mit 6-monatiger Tragedauer, bispezifische Insuline (Hepato-präferentielle Formeln) und inhaliertes Insulin (Afrezza, ultraschnell, Wirkbeginn < 3 min) befinden sich in klinischer Anwendung oder fortgeschrittener Erprobung. Zellersatz-Therapien (Vertex VX-880, encapsulierte β-Zellen) zeigen erste klinische Erfolge bei T1DM.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .whatIsT1D,
            title: "Häufige Mythen über T1D",
            emoji: "🚫",
            shortDescription: "Was stimmt, was nicht – damit du weißt, was du anderen erklären kannst.",
            pages: [
                LessonPage(id: UUID(), heading: "Mythen können schaden",
                    body: "Über Diabetes kursieren viele falsche Vorstellungen. Das frustriert Menschen mit T1D täglich. Hier räumen wir mit den häufigsten Mythen auf – damit du sie kennst und erklären kannst.",
                    illustrationName: "questionmark.bubble",
                    sciHeading: "Ätiologie T1DM: keine Lifestyle-Erkrankung",
                    sciBody: "T1DM entsteht nicht durch Ernährungsgewohnheiten. Die Pathogenese basiert auf genetischer Suszeptibilität (HLA-DR3/DR4, PTPN22, INS-VNTR) und autoimmunologischer Triggerung durch Umweltfaktoren. Prospektive Studien (TEDDY, DAISY) zeigen, dass weder Zuckerkonsum noch Übergewicht die T1DM-Inzidenz erhöhen."),
                LessonPage(id: UUID(), heading: "Mythos: 'Du hast zu viel Zucker gegessen'",
                    body: "T1D wird nicht durch Ernährung verursacht. Es ist eine Autoimmunerkrankung – dein Immunsystem hat die insulinproduzierenden Zellen angegriffen. Niemand trägt Schuld an T1D.",
                    illustrationName: "xmark.circle.fill",
                    sciHeading: "Kohlenhydrate und Insulindosierung",
                    sciBody: "Kohlenhydrate sind bei T1DM nicht verboten. Das Prinzip des KH-Countings erlaubt alle Kohlenhydratquellen bei entsprechender Bolusinsulinanpassung. Evidenz (ADA 2024): Es gibt keinen Vorteil für strikte KH-Restriktion vs. flexibles Counting bei optimaler Insulindosierung. Very-Low-Carb-Diäten erhöhen das Hypoglykämierisiko und erschweren die Dosisberechnung."),
                LessonPage(id: UUID(), heading: "Mythos: 'Du kannst keinen Zucker essen'",
                    body: "Menschen mit T1D können alles essen – mit dem richtigen Insulin-Management. Es geht um Bewusstsein und Planung, nicht um strikte Verbote. Ein Stück Kuchen beim Geburtstag ist vollkommen okay.",
                    illustrationName: "fork.knife",
                    sciHeading: "Insulintherapie: Sicherheit und Evidenz",
                    sciBody: "Exogenes Insulin ist seit 1921 klinisch eingesetzt (Banting & Best) und ist bei T1DM lebensnotwendig. Moderne Insulinanaloga haben optimierte Pharmakodynamik und reduzierte Hypoglykämieraten im Vergleich zu Humaninsulin (SWITCH-1/2-Studien). Das Hypoglykämierisiko ist durch CGM, strukturierte Schulung (DAFNE, PRIMAS) und HCL-Systeme deutlich reduzierbar."),
                LessonPage(id: UUID(), heading: "Mythos: 'Irgendwann brauchst du kein Insulin mehr'",
                    body: "T1D ist eine lebenslange Erkrankung – Insulin wird immer benötigt. Es gibt kein 'Ausheilen' durch Sport oder Ernährung. Das ist keine schlechte Nachricht: Mit Insulin lässt sich ein völlig normales Leben führen.",
                    illustrationName: "repeat.circle",
                    sciHeading: "Epidemiologie und Langzeitprognose bei T1DM",
                    sciBody: "T1DM erfordert lebenslange exogene Insulinsubstitution ohne Aussicht auf spontane Remission. Die Honeymoon-Phase (partielle Remission mit transienter Restsekretion) dauert Monate bis maximal 1–2 Jahre. Intensivierte Insulintherapie mit HbA1c-Zielwert < 7 % reduziert das Risiko mikrovaskulärer Langzeitkomplikationen (Retinopathie, Nephropathie, Neuropathie) um 50–75 % (DCCT-Studie).")
            ],
            estimatedMinutes: 3
        )
    ]

    // MARK: - Alltag (7 Lektionen)

    static let dailyLife: [Lesson] = [

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Hochs & Tiefs managen",
            emoji: "📉",
            shortDescription: "Wie fühlt es sich an, wenn dein Zucker aus dem Gleichgewicht ist – und was machst du dann?",
            pages: [
                LessonPage(id: UUID(), heading: "Hoher Blutzucker (Hyperglykämie)",
                    body: "Wenn dein Blutzucker zu hoch ist, könntest du dich durstig, müde fühlen oder häufig auf die Toilette müssen. Er kann sich langsam einschleichen. Dein Behandlungsteam wird dich beraten, wie du reagieren sollst – dies sind nur Bildungsinhalte.",
                    illustrationName: "thermometer.high",
                    sciHeading: "Hyperglykämie und Ketoazidose",
                    sciBody: "Hyperglykämie (> 180 mg/dl postprandial, > 130 mg/dl nüchtern) resultiert aus relativem oder absolutem Insulinmangel. Diabetische Ketoazidose (DKA) entsteht bei absolutem Insulinmangel mit unkontrollierter Lipolyse, Ketonkörperproduktion (β-Hydroxybutyrat > 3 mmol/L) und metabolischer Azidose (pH < 7,3, Bikarbonat < 15 mmol/L). DKA-Mortalität: < 1 % in modernen Zentren."),
                LessonPage(id: UUID(), heading: "Niedriger Blutzucker (Hypoglykämie)",
                    body: "Wenn der Blutzucker zu niedrig wird, könntest du dich zittrig, schwitzend, verwirrt oder sehr hungrig fühlen. Das nennt man eine 'Hypo' oder 'Unterzuckerung'. Schnell zu handeln ist wichtig – schnell wirkende Kohlenhydrate wie Saft oder Glukosetabletten helfen.",
                    illustrationName: "thermometer.low",
                    sciHeading: "Definition und Klassifikation der Hypoglykämie",
                    sciBody: "Hypoglykämie ist definiert als Plasmaglukose < 70 mg/dl (Level 1, symptomatisch), < 54 mg/dl (Level 2, klinisch signifikant) und schwere Hypoglykämie (Level 3) mit kognitiver Beeinträchtigung und Fremdhilfebedarf (ADA/EASD 2023). Adrenerg-mediierte Frühsymptome (Tremor, Tachykardie, Diaphorese) entstehen bei ca. 60–70 mg/dl; neuroglukopenische Symptome (Verwirrtheit, Bewusstlosigkeit) bei < 50 mg/dl."),
                LessonPage(id: UUID(), heading: "Dein Gespür entwickelt sich mit der Zeit",
                    body: "Viele Menschen mit T1D lernen, ihre eigenen frühen Warnsignale zu erkennen. Jeder ist anders. Mit der Zeit wirst du besser darin, zu spüren, wenn etwas 'nicht stimmt' – noch bevor du es überprüfst.",
                    illustrationName: "brain.head.profile",
                    sciHeading: "Evidenzbasiertes Hypoglykämiemanagement",
                    sciBody: "Die 15-15-Regel (15 g schnellwirksame KH, Kontrollmessung nach 15 min) ist durch randomisierte Studien validiert. Geeignete Mittel: Glukosetabletten (bevorzugt, standardisierte Resorption), Fruchtsaft, Saccharoselösung. Schokolade/fetthaltige Lebensmittel sind ungeeignet (verzögerte Resorption durch Fett). Bei Bewusstlosigkeit: Glukagon i.m./i.n. (GlucaGen, Baqsimi) oder Glukose i.v.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Bewegung & T1D",
            emoji: "🏃",
            shortDescription: "Aktiv zu bleiben ist gut für dich – hier ist, was du beachten solltest.",
            pages: [
                LessonPage(id: UUID(), heading: "Bewegung ist dein Freund",
                    body: "Sport ist für jeden gut, auch für Menschen mit T1D. Er hilft deinem Körper, Glukose effizienter zu nutzen, hebt deine Stimmung und unterstützt die allgemeine Gesundheit. Lass T1D dich nicht davon abhalten, aktiv zu sein.",
                    illustrationName: "figure.run",
                    sciHeading: "Metabolische Auswirkungen von körperlicher Aktivität",
                    sciBody: "Aerobes Ausdauertraining erhöht die muskuläre Glukoseaufnahme durch GLUT4-Translokation (insulinunabhängig) und steigert die Insulinsensitivität für 24–48 h postexerzitiv. Anaerobes/intensives Training und HIIT stimulieren Katecholaminausschüttung (Adrenalin, Noradrenalin), aktivieren Glykogenolyse und können transienten Blutzuckeranstieg (20–40 mg/dl) verursachen."),
                LessonPage(id: UUID(), heading: "Aktivität beeinflusst den Blutzucker",
                    body: "Körperliche Aktivität kann dazu führen, dass der Blutzucker während oder nach dem Sport sinkt. Das ist normal und handhabbar. Dein Behandlungsteam kann dir helfen, Muster zu verstehen und dich auf verschiedene Aktivitäten vorzubereiten.",
                    illustrationName: "chart.line.downtrend.xyaxis",
                    sciHeading: "Periexerzitive Glukosemanagement-Strategien",
                    sciBody: "ADA-Empfehlungen (2024): Ausgangswert vor Aktivität 126–180 mg/dl anstreben. Bei < 90 mg/dl: 15–30 g KH vor Beginn. Basalinsulin 20–50 % reduzieren bei > 60 min Ausdauerbelastung (CSII: temporäre Basalreduktion 60–90 min vorher). Mahlzeitenbolus vor Sport: 25–75 % Reduktion je nach Intensität und Dauer (individuelle Titration erforderlich)."),
                LessonPage(id: UUID(), heading: "Vorbereitung ist der Schlüssel",
                    body: "Viele Menschen mit T1D überprüfen ihren Blutzucker vor, während und nach dem Sport. Schnell wirkende Kohlenhydrate in der Nähe zu haben ist eine gängige Vorsichtsmaßnahme. Mit der Zeit wirst du lernen, was für deinen Körper funktioniert.",
                    illustrationName: "checklist",
                    sciHeading: "Post-exercise Late-onset Hypoglycemia (PELOH)",
                    sciBody: "PELOH tritt 6–15 h nach Belastung auf durch erhöhte muskuläre Glykogensynthese, gesteigerte Insulinsensitivität und reduzierten hepatischen Glukoseoutput. Präventive Maßnahmen: KH-reicher Snack (15–30 g) nach intensiver Belastung, Basalreduktion in der Folgenacht, CGM-Alarmgrenzen anheben (< 90 mg/dl). Alkohol postexerzitiv verstärkt PELOH-Risiko signifikant.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Schlaf & Stress",
            emoji: "😴",
            shortDescription: "Deine mentale und emotionale Gesundheit ist genauso wichtig wie alles andere.",
            pages: [
                LessonPage(id: UUID(), heading: "Stress beeinflusst den Blutzucker",
                    body: "Wenn du gestresst bist, setzt dein Körper Hormone frei, die den Blutzucker erhöhen können. Das ist nicht deine Schuld – das ist einfach Biologie. Diese Verbindung zu erkennen kann dir helfen, unerwartete Schwankungen zu verstehen.",
                    illustrationName: "bolt.heart.fill",
                    sciHeading: "Stresshormone und Glukoseregulation",
                    sciBody: "Psychophysischer Stress aktiviert die Hypothalamus-Hypophysen-Nebennierenrinden-Achse (HPA-Achse) mit Ausschüttung von Kortisol, Adrenalin und Wachstumshormon. Diese kontrainsulinären Hormone steigern hepatische Glykogenolyse und Glukoneogenese, hemmen die periphere Insulinwirkung und führen zu Hyperglykämie, auch ohne Nahrungsaufnahme."),
                LessonPage(id: UUID(), heading: "Schlaf ist wichtiger, als du denkst",
                    body: "Schlechter Schlaf kann die Blutzuckerkontrolle erschweren. Er beeinflusst auch deine Stimmung, Konzentration und Energie. Ruhe zu priorisieren ist keine Faulheit – es ist Teil der Selbstfürsorge mit T1D.",
                    illustrationName: "moon.zzz.fill",
                    sciHeading: "Schlaf und Glukosemetabolismus",
                    sciBody: "Schlafdeprivation (< 6 h) ist mit erhöhter Insulinresistenz (+25 %), gesteigertem Ghrelinspiegel und vermindertem Leptinspiegel assoziiert. Bei T1DM erhöht gestörter Schlaf die nächtliche Hypoglykämierate (REM-Schlaf-assoziierter GH-Surge → Dawn-Phänomen) und die Tageshyperglykämieneigung. CGM-Studien zeigen: jede Stunde Schlafreduktion erhöht die Zeit-außerhalb-Zielbereich um ~5 %."),
                LessonPage(id: UUID(), heading: "Diabetes-Burnout ist real",
                    body: "Mit einer Erkrankung zu leben, die rund um die Uhr Aufmerksamkeit erfordert, ist erschöpfend. Es ist völlig normal, ausgebrannt, frustriert oder des T1D-Managements müde zu sein. Mit jemandem zu reden – einem Freund, Berater oder der Diabetes-Community – kann wirklich helfen.",
                    illustrationName: "heart.text.square.fill",
                    sciHeading: "Psychologische Interventionen und Diabetes Distress",
                    sciBody: "Diabetes Distress (DD) betrifft 30–40 % der Menschen mit T1DM und ist mit HbA1c-Anstieg (+0,3–0,5 %) und reduzierter Therapieadhärenz assoziiert. Kognitive Verhaltenstherapie (KVT), Akzeptanz- und Commitment-Therapie (ACT) und Achtsamkeitsbasierte Stressreduktion (MBSR) zeigen in RCTs signifikante Reduktion von DD und Verbesserung der Glukosekontrolle.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Reisen mit T1D",
            emoji: "✈️",
            shortDescription: "Mit der richtigen Vorbereitung steht dem nächsten Abenteuer nichts im Weg.",
            pages: [
                LessonPage(id: UUID(), heading: "T1D stoppt dich nicht",
                    body: "Urlaub, Städtetrips, Abenteuer – das alles ist mit T1D möglich. Gute Vorbereitung ist der Schlüssel, damit du entspannt reisen kannst. Viele Menschen mit T1D reisen regelmäßig durch die ganze Welt.",
                    illustrationName: "airplane",
                    sciHeading: "Präreisevorbereitungen und Dokumentation",
                    sciBody: "Ärztliche Reisebescheinigung (Englisch/Landessprache) sollte Diagnose, Medikamente (Insulinnamen, Konzentration U100/U200/U300), Hilfsmittel (Pens, Pumpe, CGM) und Kühlbedarf dokumentieren. Doppelter Vorrat an Insulinen, Verbrauchsmaterialien und Glukagons ist medizinisch indiziert. Internationale Diabetesverbände (IDF) bieten mehrsprachige Reisepässe."),
                LessonPage(id: UUID(), heading: "Was du einpackst",
                    body: "Insulin und Verbrauchsmaterial immer ins Handgepäck – niemals ins aufgegebene Gepäck. Temperaturschwankungen im Frachtraum können Insulin beschädigen. Nimm mehr mit als du glaubst zu brauchen – lieber zu viel als zu wenig.",
                    illustrationName: "bag.fill",
                    sciHeading: "Flugreisen: Physiologische und logistische Besonderheiten",
                    sciBody: "Kabinendruck (0,75 bar Equivalent auf 2.400 m) und Luftfeuchtigkeit (10–20 %) verursachen Dehydratation, beeinflussen CGM-Sensorgenauigkeit und verändern die subkutane Insulinabsorption (veränderte Gewebeperfusion). Insulinpumpen sind flugsicher; CGM-Sender und Pumpen sind MRT-inkompatibel, aber flugzeugkompatibel (EFTA/EU-Regelungen)."),
                LessonPage(id: UUID(), heading: "Am Flughafen & im Flieger",
                    body: "CGMs und Insulinpumpen sind sicher bei der Sicherheitskontrolle. Ein ärztliches Attest in der Landessprache kann hilfreich sein. Im Flugzeug ist Insulin bei Raumtemperatur im Handgepäck sicher.",
                    illustrationName: "doc.text.fill",
                    sciHeading: "Chronobiologie und Insulinschema-Anpassung",
                    sciBody: "Transmeridiane Reisen erfordern systematische Basalinsulinanpassung. Richtung Osten (verkürzte Tage): Basaldosis ggf. proportional reduzieren, da weniger Stunden abzudecken. Richtung Westen (verlängerte Tage): geringfügige Erhöhung möglich. CGM ermöglicht reaktives Management. Insulindegludec (ultralange WD) erlaubt flexiblere Zeitpunktverschiebung ohne Dosisanpassung."),
                LessonPage(id: UUID(), heading: "Zeitzonenwechsel",
                    body: "Bei Langstreckenflügen und Zeitzonenwechseln kann sich der Tagesrhythmus verschieben – das betrifft auch Mahlzeiten und Basal-Insulin. Sprich vorher mit deinem Behandlungsteam, um einen Plan zu haben.",
                    illustrationName: "globe.europe.africa.fill",
                    sciHeading: "Glukosevariabilität bei Fernreisen",
                    sciBody: "Transmeridiane Flüge > 5 Zeitzonen verursachen zirkadiane Desynchronose mit gestörtem Kortisol-Tagesprofil, veränderten Insulinsensitivitätsmustern und erhöhter Hypoglykämieinzidenz in den ersten 48–72 h. CGM-gestütztes reaktives Management mit engmaschiger Trendüberwachung ist empfohlen; feste Dosierungsschemata ohne individuelle Anpassung sind unzureichend.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Soziale Situationen",
            emoji: "🍕",
            shortDescription: "Restaurants, Partys, Freunde – so meisterst du T1D im sozialen Alltag.",
            pages: [
                LessonPage(id: UUID(), heading: "T1D im sozialen Leben",
                    body: "Restaurantbesuche, Partys, Essen bei Freunden – das alles klappt mit T1D wunderbar. Es braucht manchmal etwas mehr Planung, aber mit der Zeit wird es zur Routine.",
                    illustrationName: "fork.knife",
                    sciHeading: "Psychosoziale Aspekte des T1DM-Managements",
                    sciBody: "Soziale Stigmatisierung von Insulininjektionen und Blutzuckermessungen in der Öffentlichkeit ist bei 25–40 % der T1DM-Betroffenen nachweisbar (Qualitative Studien). Diese Barrieren führen zu verzögerter Hypo-Behandlung, vermiedenen Injektionen und schlechterer Glukosekontrolle. Peer-Support-Programme und Psychoedukation reduzieren Stigmaerleben nachweisbar."),
                LessonPage(id: UUID(), heading: "Was du anderen erzählst",
                    body: "Du entscheidest, wem du von deinem T1D erzählst. Enge Freunde oder Familie zu informieren kann hilfreich sein – vor allem damit sie wissen, was im Notfall zu tun ist. Aber du bist niemandem eine Erklärung schuldig.",
                    illustrationName: "person.2.fill",
                    sciHeading: "Prandiales Management bei Restaurantmahlzeiten",
                    sciBody: "Restaurantmahlzeiten zeigen ±50 % Varianz im tatsächlichen KH-Gehalt vs. Schätzung. Fettreiche Gerichte verzögern Magenentleerung (GLP-1-Suppression, CCK-Aktivierung) und verursachen postprandiale BZ-Spitzen mit 2–4 h Latenz. Empfohlene Bolusstrategie: Split-Bolus (50 % präprandial, 50 % nach 30–45 min) oder dualer Bolus (CSII)."),
                LessonPage(id: UUID(), heading: "Wenn andere nachfragen",
                    body: "Manche Menschen sind neugierig. Du bestimmst, wie viel du teilst. Ein einfaches 'Mein Körper produziert kein Insulin, also muss ich es spritzen' reicht oft aus. Oder du sagst gar nichts – das ist auch völlig okay.",
                    illustrationName: "bubble.left.and.bubble.right.fill",
                    sciHeading: "Pharmakologie von Ethanol bei T1DM",
                    sciBody: "Ethanol hemmt die hepatische Glukoneogenese kompetitiv durch NADH/NAD⁺-Verschiebung und unterdrückt die Glykogenolyse. Kombiniert mit Insulin entsteht prolongiertes Hypoglykämierisiko (bis 12–16 h nach Konsum). Präventivstrategie: KH-haltiger Snack (15–30 g) nach Alkoholkonsum, keine Boluskorrekturen für alkoholbedingte Hyperglykämien, CGM-Hypoalarm aktivieren.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Krank sein mit T1D",
            emoji: "🤒",
            shortDescription: "Was passiert mit deinem Blutzucker, wenn du krank bist – und was hilft.",
            pages: [
                LessonPage(id: UUID(), heading: "Krankheit und Blutzucker",
                    body: "Wenn du krank bist – Erkältung, Grippe oder etwas anderes – kann dein Blutzucker unberechenbar werden. Krankheitshormone können ihn erhöhen, selbst wenn du kaum isst. Das ist normal und kein Versagen.",
                    illustrationName: "thermometer",
                    sciHeading: "Sick-Day-Physiologie und Insulinbedarf",
                    sciBody: "Akute Erkrankungen (Infekte, Fieber) induzieren über IL-6, TNF-α und CRP eine entzündungsbedingte Insulinresistenz mit 20–50 % erhöhtem Insulinbedarf. Kortikosteroide (systemische Therapie) steigern die Glukose dosisabhängig durch Förderung der hepatischen Glukoneogenese und Hemmung der GLUT4-Expression. Insulinpausen sind bei T1DM kontraindiziert."),
                LessonPage(id: UUID(), heading: "Grundregeln für kranke Tage",
                    body: "Auch wenn du wenig isst: Höre niemals von selbst auf, Insulin zu nehmen. Trinke viel Wasser. Überprüfe deinen Blutzucker häufiger als sonst. Das sind allgemeine Hinweise – dein Behandlungsteam hat deinen persönlichen Plan für solche Tage.",
                    illustrationName: "checklist",
                    sciHeading: "Strukturiertes Sick-Day-Management",
                    sciBody: "Regelmäßige Ketontestung (alle 2–4 h bei Glukose > 240 mg/dl oder Übelkeit) ist bei T1DM im Krankheitsfall obligat. Blutketone > 1,5 mmol/L (klinisch signifikante Ketonämie) erfordern Korrekturboli, Flüssigkeitszufuhr und ggf. stationäre Einweisung. Orale Rehydratation: zuckerhaltige Lösungen bei BZ < 70 mg/dl, zuckerfreie Elektrolytlösungen bei Hyperglykämie."),
                LessonPage(id: UUID(), heading: "Wann du Hilfe holst",
                    body: "Bei anhaltend sehr hohen Werten, starkem Erbrechen oder wenn du dich sehr unwohl fühlst: Kontaktiere dein Behandlungsteam oder geh in die Notaufnahme. Lieber einmal zu viel nachfragen als einmal zu wenig.",
                    illustrationName: "cross.circle.fill",
                    sciHeading: "Medizinische Interventionskriterien",
                    sciBody: "Sofortige medizinische Vorstellung bei: BZ > 300 mg/dl trotz Korrekturboli, Blutketone > 3 mmol/L, pH < 7,3 (Azidose), Erbrechen mit Unfähigkeit zur oralen Rehydratation, Bewusstseinstrübung. Medikamenteninteraktionen beachten: Fluorochinolone (Hypoglykämierisiko), Betablocker (Maskierung adrenerger Symptome), Kortikosteroide (massive BZ-Erhöhung).")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .dailyLife,
            title: "Gefühle & T1D",
            emoji: "💙",
            shortDescription: "Trauer, Wut, Erschöpfung – deine Emotionen sind genauso wichtig wie dein Blutzucker.",
            pages: [
                LessonPage(id: UUID(), heading: "Emotionen sind Teil der Erkrankung",
                    body: "T1D betrifft nicht nur deinen Körper – es beeinflusst auch, wie du dich fühlst. Trauer, Wut, Angst, Erschöpfung – das alles ist völlig normal. Du bist kein schwacher Mensch, wenn du damit kämpfst.",
                    illustrationName: "heart.fill",
                    sciHeading: "Psychische Komorbiditäten bei T1DM",
                    sciBody: "Major Depression tritt bei T1DM 2–3× häufiger auf als in der Allgemeinbevölkerung (Prävalenz 15–20 %). Generalisierte Angststörung betrifft 20–30 % der Betroffenen, oft als Fear of Hypoglycemia (FOH) oder Fear of Complications. Diabetes Distress (DD) ist konzeptionell von klinischer Depression zu unterscheiden und mit spezifischen Messinstrumenten (PAID, DASS-21) zu erfassen."),
                LessonPage(id: UUID(), heading: "T1D-Burnout",
                    body: "Burnout bei Diabetes bedeutet: Du bist es leid, jeden Tag, 24 Stunden, an T1D zu denken. Das Monitoring, die Entscheidungen, die Anpassungen – es ist erschöpfend. Das ist eine anerkannte Erfahrung, kein persönliches Versagen.",
                    illustrationName: "flame.fill",
                    sciHeading: "Diabetes Distress und Therapieadhärenz",
                    sciBody: "Diabetes Burnout beschreibt emotionale Erschöpfung durch chronische Therapieanforderungen mit Rückzug vom Selbstmanagement und sinkender Adhärenz. Empirische Daten zeigen HbA1c-Anstieg um 0,3–0,5 % bei klinisch relevantem DD. Technologische Entlastung durch HCL-Systeme reduziert DD-Scores in RCTs signifikant (DiaCCESS-Studie); Kombination mit psychologischen Interventionen (ACT, Peer-Support) zeigt synergistische Effekte."),
                LessonPage(id: UUID(), heading: "Unterstützung finden",
                    body: "Rede mit jemandem – einem Freund, deiner Familie, einem Psychologen oder deinem Behandlungsteam. Auch Online-Communities für junge Menschen mit T1D können eine große Hilfe sein. Du musst das nicht allein tragen.",
                    illustrationName: "hand.raised.fill",
                    sciHeading: "Integrierte Diabetesversorgung",
                    sciBody: "Leitlinienempfehlungen (DDG, ADA) fordern integrierte psychosoziale Versorgung als Standardbestandteil der Diabetesbehandlung. Diabetes-Psychologie, strukturierte Patientenschulungsprogramme (DAFNE, PRIMAS, HyPOS) und zertifizierte Selbsthilfegruppen (DDB, JDRF) verbessern nachweislich Lebensqualität (DQOL-Scores) und Glukosekontrolle. Telemedizinische Angebote verbessern den Zugang zu spezialisierten Versorgungsstrukturen."),
                LessonPage(id: UUID(), heading: "Du bist mehr als T1D",
                    body: "T1D ist ein Teil von dir – aber nicht alles. Du bist eine Person mit Träumen, Stärken und einer Zukunft, die weit über die Erkrankung hinausgeht. Lass T1D nicht deine gesamte Identität bestimmen.",
                    illustrationName: "star.fill",
                    sciHeading: "Resilienz und Lebensqualität bei T1DM",
                    sciBody: "Studien zur gesundheitsbezogenen Lebensqualität (HRQOL) bei T1DM zeigen, dass psychologische Resilienz, soziale Unterstützung und krankheitsakzeptierendes Coping stärkere Prädiktoren für HRQOL sind als der HbA1c-Wert. Empowerment-basierte Schulungskonzepte (PRIMAS, DAFNE) fördern Selbstwirksamkeit und sind in RCTs mit verbesserter Glukosekontrolle und reduziertem Diabetes Distress assoziiert.")
            ],
            estimatedMinutes: 3
        )
    ]

    // MARK: - Ernährung & Kohlenhydrate (7 Lektionen)

    static let foodCarbs: [Lesson] = [

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Kohlenhydrate 101",
            emoji: "🍞",
            shortDescription: "Kohlenhydrate sind nicht der Feind – hier ist, was du wirklich wissen musst.",
            pages: [
                LessonPage(id: UUID(), heading: "Kohlenhydrate sind einfach Energie",
                    body: "Kohlenhydrate sind in Brot, Reis, Nudeln, Obst, Milchprodukten und vielen anderen Lebensmitteln enthalten. Bei der Verdauung werden sie in Glukose umgewandelt – den Haupttreibstoff deines Körpers. Sie sind nicht schlecht. Sie müssen nur berücksichtigt werden.",
                    illustrationName: "leaf.fill",
                    sciHeading: "Chemische Klassifikation der Kohlenhydrate",
                    sciBody: "Kohlenhydrate werden nach chemischer Struktur klassifiziert: Monosaccharide (Glukose, Fruktose, Galaktose), Disaccharide (Saccharose, Laktose, Maltose), Oligosaccharide und Polysaccharide (Stärke, Glykogen, Cellulose). Für die Insulindosierung relevant sind ausschließlich resorbierbare KH; Ballaststoffe (nicht-resorbierbare Polysaccharide) haben keinen direkten glykämischen Effekt."),
                LessonPage(id: UUID(), heading: "Nicht alle Kohlenhydrate sind gleich",
                    body: "Einfache Kohlenhydrate (wie zuckerhaltige Getränke oder Weißbrot) erhöhen den Blutzucker schnell. Komplexe Kohlenhydrate (wie Haferflocken, Hülsenfrüchte oder Gemüse) erhöhen ihn langsamer. Das beeinflusst, wie du dich nach dem Essen fühlst.",
                    illustrationName: "chart.bar.xaxis",
                    sciHeading: "Glykämischer Index und glykämische Last",
                    sciBody: "Der glykämische Index (GI) quantifiziert den BZ-Anstieg eines Lebensmittels relativ zu reiner Glukose (GI = 100). Niedrig-GI-Lebensmittel (< 55): Hülsenfrüchte, Hafer, Vollkornprodukte. Die glykämische Last (GL = GI × KH-Menge/100) berücksichtigt die Portionsgröße und ist ein praktischeres Maß für den tatsächlichen postprandialen Glukoseeffekt. Ballaststoffe, Fett und Protein senken den GI einer Mahlzeit."),
                LessonPage(id: UUID(), heading: "Kohlenhydrate zählen ist ein Werkzeug, keine Regel",
                    body: "Viele Menschen mit T1D lernen, die Kohlenhydrate in ihren Mahlzeiten abzuschätzen. Es ist eine Fähigkeit, die mit der Übung einfacher wird. Dein Behandlungsteam oder ein Ernährungsberater kann dir helfen, diese Fähigkeit auf eine Weise zu entwickeln, die zu deinem Leben passt.",
                    illustrationName: "number.circle.fill",
                    sciHeading: "Kohlenhydratcounting-Methodik",
                    sciBody: "KH-Counting (structured carbohydrate counting) ist die evidenzbasierte Methode zur prandialem Insulindosierung bei T1DM (ADA/EASD 2023). 1 KE = 10–12 g verwertbare KH (Deutschland), 1 BE (Broteinheit) = 12 g KH. Der individuelle KE-Faktor (U Insulin/KE) wird durch strukturierte Protokolle empirisch bestimmt und variiert tageszeit- und aktivitätsabhängig.")
            ],
            estimatedMinutes: 3
        ),

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Nährwertangaben lesen",
            emoji: "🏷️",
            shortDescription: "Wisse, worauf du achten musst – ohne jede Zahl zu besessen.",
            pages: [
                LessonPage(id: UUID(), heading: "Die drei wichtigsten Angaben",
                    body: "Wenn du ein Nährwertetikett betrachtest, sind die drei nützlichsten Zahlen für das T1D-Bewusstsein: Gesamtkohlenhydrate, Ballaststoffe und Zucker. Der Rest ist Kontext.",
                    illustrationName: "doc.text.magnifyingglass",
                    sciHeading: "EU-Lebensmittelkennzeichnung (VO 1169/2011)",
                    sciBody: "Die EU-Verordnung 1169/2011 schreibt die Pflichtdeklaration von Gesamtkohlenhydraten und Zuckeranteil pro 100 g und pro Portion vor. 'Kohlenhydrate, davon Zucker' umfasst Mono- und Disaccharide. Ballaststoffe und Zuckeralkohole (Sorbit, Maltit, Xylit) werden separat deklariert; letztere haben reduzierten glykämischen Effekt (GI 9–35) aber kalorischen Beitrag (2 kcal/g)."),
                LessonPage(id: UUID(), heading: "Ballaststoffe sind dein Freund",
                    body: "Ballaststoffe verlangsamen die Verdauung, was einen langsameren Anstieg des Blutzuckers bedeutet. Lebensmittel mit hohem Ballaststoffgehalt sind tendenziell sättigender und haben weniger dramatische Auswirkungen auf die Glukose. Denke an Gemüse, Hülsenfrüchte, Vollkorn.",
                    illustrationName: "arrow.down.to.line",
                    sciHeading: "Saccharidnomenklatur auf Lebensmitteletiketten",
                    sciBody: "Saccharose, Fruktose, Glukosesirup, Maltodextrin, Dextrose, Agavendicksaft und Invertzucker sind verschiedene Deklarationsformen für resorbierbare Zucker. Maltodextrin (GI 85–110) hat höheren GI als Saccharose (GI 65). Fruktose (GI 23) hat niedrigeren akuten BZ-Effekt, erhöht aber bei chronisch hohem Konsum hepatische Lipogenese und Triglyceridspiegel (NAFLD-Risiko)."),
                LessonPage(id: UUID(), heading: "Strebe keine Perfektion an",
                    body: "Etiketten zu lesen ist eine Fähigkeit, kein Test. Du musst nicht bei jeder Mahlzeit perfekt zählen. Das Ziel ist, mit der Zeit zu lernen, angeleitet von deinem Behandlungsteam. Essen soll noch Freude machen.",
                    illustrationName: "checkmark.seal.fill",
                    sciHeading: "Portionsgrößen und interindividuelle Variabilität",
                    sciBody: "Portionsgrößenangaben auf Etiketten entsprechen oft nicht realen Verzehrmengen (Studiendaten: 1,5–2,5× Überschreitung der deklarierten Portion beim Außer-Haus-Essen). Für präzises KH-Counting empfehlen Leitlinien Küchenwaagen (±2 g Genauigkeit). Apps mit Barcode-Scanner (mySugr, Carbs & Cals) verbessern die Schätzgenauigkeit signifikant vs. visuelle Schätzung.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Zucker & Süßungsmittel",
            emoji: "🍬",
            shortDescription: "Zucker ist nicht verboten – hier ist, was du wirklich wissen musst.",
            pages: [
                LessonPage(id: UUID(), heading: "Zucker ist nicht dein Feind",
                    body: "Zucker ist für Menschen mit T1D nicht verboten. Es geht darum, ihn einzuplanen – wie jede andere Kohlenhydratquelle. Ein Stück Schokolade oder ein Dessert ist mit dem richtigen Insulin-Management absolut möglich.",
                    illustrationName: "cube.fill",
                    sciHeading: "Saccharosemetabolismus und glykämische Wirkung",
                    sciBody: "Saccharose (Glukose-Fruktose-Disaccharid) wird durch intestinale Saccharase hydrolysiert. Glukose wird über SGLT1 resorbiert und löst unmittelbaren postprandialen BZ-Anstieg aus. Fruktose wird über GLUT5 resorbiert, primär hepatisch metabolisiert (Fruktose-1-Phosphat-Weg) ohne direkten Insulinbedarf; bei übermäßigem Konsum De-novo-Lipogenese und Urikaterhöhung."),
                LessonPage(id: UUID(), heading: "Natürlicher vs. zugesetzter Zucker",
                    body: "Natürlicher Zucker kommt in Obst, Milch und anderen Lebensmitteln vor. Zugesetzter Zucker wird bei der Verarbeitung hinzugefügt – in Softdrinks, Süßigkeiten, vielen Fertigprodukten. Beides erhöht den Blutzucker, aber der Kontext (Ballaststoffe, Fett) macht einen Unterschied.",
                    illustrationName: "chart.bar.fill",
                    sciHeading: "EFSA-zugelassene Süßungsmittel",
                    sciBody: "EFSA-zugelassene intensive Süßungsmittel (Steviosylglycoside, Aspartam, Sucralose, Acesulfam-K, Saccharin) sind bei ADI-gerechtem Konsum sicher und haben vernachlässigbaren glykämischen Effekt. Stevia-Extrakte (Rebaudioside A/M) sind 200–400× süßer als Saccharose. Meta-Analysen zeigen bei moderatem Konsum keine negativen Auswirkungen auf Glukosestoffwechsel oder Mikrobiom."),
                LessonPage(id: UUID(), heading: "Zuckerersatzstoffe",
                    body: "Süßungsmittel wie Stevia oder Erythrit haben kaum Einfluss auf den Blutzucker. Für manche Menschen mit T1D können sie eine hilfreiche Option sein. Sie sind kein Muss – aber eine Möglichkeit, die existiert.",
                    illustrationName: "leaf.fill",
                    sciHeading: "Zuckeraustauschstoffe und natürliche Süßungsmittel",
                    sciBody: "Zuckeralkohole (Sorbit, Xylit, Erythrit, Maltit) haben GI 0–35 und reduzierte Kaloriengehalte (0,2–2,4 kcal/g). Bei hohem Konsum (> 30–50 g/Tag): osmotische Diarrhö durch inkomplette Resorption im Dünndarm. Agavensirup/Honig bestehen vorwiegend aus Fruktose/Saccharose und haben ähnliche glykämische Effekte wie Haushaltszucker; sind keine 'diabetesgeeigneten' Alternativen.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Essen gehen & T1D",
            emoji: "🍽️",
            shortDescription: "Restaurants müssen kein Stressfaktor sein – mit der richtigen Einstellung nicht.",
            pages: [
                LessonPage(id: UUID(), heading: "Restaurants sind kein Problem",
                    body: "Essen gehen mit T1D ist absolut machbar. Es braucht etwas Übung im Schätzen von Portionsgrößen und Kohlenhydraten – aber das wird mit der Zeit leichter. Und Genuss ist ein wichtiger Teil des Lebens.",
                    illustrationName: "fork.knife",
                    sciHeading: "Glykämische Variabilität bei Außer-Haus-Ernährung",
                    sciBody: "Restaurantmahlzeiten verursachen im Vergleich zu Heimmahlzeiten signifikant größere intraindividuelle Glukosevariabilität (CV-Anstieg um 15–25 %). Faktoren: unpräzise Portionsgrößen, versteckte KH (Saucen, Panierungen), variable Kochtemperatur und -methode beeinflussen GI. Fettreiche Gerichte verzögern Magenentleerung (Gastroparesis-ähnlicher Effekt) und erzeugen biphasische postprandiale Glukosekurven."),
                LessonPage(id: UUID(), heading: "Schätzen statt Stress",
                    body: "Du wirst nicht immer perfekt schätzen – und das ist okay. Mit der Zeit entwickelst du ein Gefühl für typische Gerichte. Dein Behandlungsteam oder ein Ernährungsberater kann dir helfen, Schätzstrategien zu entwickeln.",
                    illustrationName: "eye.fill",
                    sciHeading: "Präprandiale Bolusstrategie bei komplexen Mahlzeiten",
                    sciBody: "Dual-Wave-/Multiwave-Bolus (CSII) kombiniert sofortigen Anteil (50–70 %) mit verzögerter Infusion über 1–3 h für fettreiche/proteinreiche Mahlzeiten. Bei ICT (MDI): Split-Bolus-Strategie (60 % präprandial, 40 % 30–60 min postprandial). Evidenz für signifikante TIR-Verbesserung bei strukturierter Bolusstrategie für Pizza, asiatische Gerichte, Fastfood (BZ-Varianz −20–30 %)."),
                LessonPage(id: UUID(), heading: "Fast Food & Takeaway",
                    body: "Fast Food ist ab und zu okay – kein Essen ist per se verboten. Die Herausforderung ist, dass Portionsgrößen und Zutaten variieren können. Viele Ketten veröffentlichen Nährwertangaben – das kann als Orientierung dienen.",
                    illustrationName: "bag.fill",
                    sciHeading: "Alkohol-Mahlzeit-Interaktion bei T1DM",
                    sciBody: "Ethanol inhibiert hepatische Glukoneogenese kompetitiv (NADH-Akkumulation). Combinierte Alkohol-Mahlzeit-Situationen: KH-Anteil kann initialen BZ-Anstieg bewirken, gefolgt von prolongierter Hypoglykämie 4–8 h postprandial durch Ethanol-mediierte Glukoneogenesehemmung. Empfehlung: Keine Korrekturboli für alkohol-assoziierte Hyperglykämien; nächtliche CGM-Alarmierung.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Snacks & Zwischenmahlzeiten",
            emoji: "🥜",
            shortDescription: "Wann Snacks sinnvoll sind – und welche Kombinationen gut funktionieren.",
            pages: [
                LessonPage(id: UUID(), heading: "Snacks strategisch einsetzen",
                    body: "Snacks können bei T1D verschiedene Rollen spielen: Energie für Sport, Vorbeugung einer Unterzuckerung oder einfach weil man Hunger hat. Nicht jeder mit T1D muss zu festen Zeiten snacken – das hängt von deinem persönlichen Management ab.",
                    illustrationName: "clock.fill",
                    sciHeading: "Evidenz für Snacks bei T1DM",
                    sciBody: "Aus metabolisch-klinischer Perspektive sind Snacks bei optimierter Insulintherapie und stabiler CGM-Kurve nicht obligatorisch. Indikationen: präventive KH-Supplementation bei körperlicher Aktivität, reaktive Hypoglykämiebehandlung (15-15-Regel), Pufferung bei fallendem Glukosetrend (< 90 mg/dl, fallend > 1 mg/dl/min) und aktivem Restinsulin (IOB). Strukturierte Snack-Protokolle reduzieren die nächtliche Hypoglykämierate."),
                LessonPage(id: UUID(), heading: "Gute Snack-Kombinationen",
                    body: "Kombinationen aus Protein, Fett und moderaten Kohlenhydraten wirken oft stabiler auf den Blutzucker als reine Zuckerquellen. Beispiele: Nüsse mit Apfel, Hüttenkäse mit Beeren oder Vollkorncracker mit Hummus.",
                    illustrationName: "checkmark.circle.fill",
                    sciHeading: "Makronährstoffe und postprandialer Glukoseverlauf",
                    sciBody: "Proteinreiche Snacks (> 10 g Protein) können verzögerten glukogenen Effekt durch Aminosäure-stimulierte Glukagonsekretion und hepatische Glukoneogenese verursachen (Onset 1–3 h). Fett-KH-Kombinationen (Nüsse mit Obst) verlängern die Resorptionszeit. 'Treat to Target'-Prinzip: Snackgröße wird durch aktuellen BZ-Wert, Trend-Arrow und aktiv wirksames Insulin (IOB) bestimmt."),
                LessonPage(id: UUID(), heading: "Snacks bei Unterzuckerungen",
                    body: "Bei einer Hypo braucht es schnell verfügbare Kohlenhydrate: Traubenzucker, Fruchtsaft oder Gummibärchen. Nüsse oder Käse allein helfen hier nicht – sie enthalten kaum Kohlenhydrate. Immer einen schnellen Kohlenhydrat-Snack dabei haben.",
                    illustrationName: "bolt.fill",
                    sciHeading: "Insulindosierung bei proteinreichen Snacks",
                    sciBody: "Für reine Proteinsnacks (< 5 g KH, > 15 g Protein) empfehlen einige Experten 50 % des 'Protein-KH-Äquivalents' als Korrektivbolus (1 g Protein ≈ 0,5 g KH für Dosierungszwecke). Diese Empfehlung ist nicht leitliniengerecht, sondern erfahrungsbasiert. CGM-Trendanalyse 1–3 h post-Snack ist zur individuellen Kalibrierung dieser Strategie sinnvoll.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Trinken & T1D",
            emoji: "💧",
            shortDescription: "Von Wasser bis Kaffee – was Getränke mit deinem Blutzucker machen.",
            pages: [
                LessonPage(id: UUID(), heading: "Wasser – dein bester Freund",
                    body: "Ausreichend Wasser zu trinken ist für alle wichtig – für Menschen mit T1D besonders. Dehydration kann den Blutzucker erhöhen. Wasser hat keine Kohlenhydrate und ist die beste Wahl für die tägliche Hydration.",
                    illustrationName: "drop.fill",
                    sciHeading: "Hydratation und Glukosekonzentration",
                    sciBody: "Hyperglykämie induziert osmotische Diurese durch renale Glukosurie (Nierenschwelle 180 mg/dl), mit Verlust von Wasser und Elektrolyten (Natrium, Kalium, Phosphat). Dehydratation erhöht die Blutglukosekonzentration durch Hämokonzentration und verminderte renale Clearance. Adäquate Hydratation (2–3 L/Tag) verbessert die CGM-Sensorgenauigkeit und die glykämische Kontrolle."),
                LessonPage(id: UUID(), heading: "Zuckerhaltige Getränke",
                    body: "Softdrinks, Fruchtsäfte und Energy Drinks enthalten viel Zucker und lassen den Blutzucker schnell steigen. Das kann bei einer Hypo nützlich sein – im Alltag lohnt es sich aber, sie zu begrenzen oder zuckerfreie Alternativen zu wählen.",
                    illustrationName: "cup.and.saucer.fill",
                    sciHeading: "Glykämischer Effekt von Getränken",
                    sciBody: "Zuckergesüßte Getränke (SSB) haben aufgrund gelöster Monosaccharide ohne Magenentleerungsverzögerung höchste GI-Werte (GI 68–109). 500 ml Limonade (≈ 50 g Saccharose) kann Plasmaglukose innerhalb 30–45 min um > 100 mg/dl ansteigen lassen. Fruchtsäfte (konzentrierte Fruktose/Glukose) haben vergleichbares glykämisches Profil trotz naturalem Image."),
                LessonPage(id: UUID(), heading: "Kaffee, Tee & Alkohol",
                    body: "Kaffee und Tee ohne Zucker haben kaum Einfluss auf den Blutzucker. Alkohol ist komplexer – er kann den Blutzucker zunächst senken und später ansteigen lassen. Wenn du Alkohol trinkst, sprich mit deinem Behandlungsteam über Sicherheitsstrategien.",
                    illustrationName: "info.circle.fill",
                    sciHeading: "Koffein, Kortisol und Insulinsensitivität",
                    sciBody: "Koffein steigert kurzfristig Kortisol- und Katechaminspiegel, was die hepatische Glukoseproduktion erhöht und die Insulinsensitivität transient vermindert. Individuelle BZ-Reaktionen auf Koffein variieren stark (Pharmakogenomik: CYP1A2-Polymorphismus). Chronischer Kaffeekonsum (> 3 Tassen/Tag) ist epidemiologisch mit reduziertem T2DM-Risiko assoziiert (Polyphenole, Chlorogensäure); für T1DM-Prävention nicht relevant.")
            ],
            estimatedMinutes: 2
        ),

        Lesson(
            id: UUID(),
            category: .foodCarbs,
            title: "Mahlzeiten planen",
            emoji: "🗓️",
            shortDescription: "Einfache Planung kann einen großen Unterschied im Alltag machen.",
            pages: [
                LessonPage(id: UUID(), heading: "Warum Planung helfen kann",
                    body: "Mahlzeiten im Voraus zu planen gibt dir mehr Kontrolle und weniger Stress rund ums Essen. Du weißt, was du essen wirst, kannst Zutaten besorgen und musst weniger spontan improvisieren. Das erleichtert das Insulin-Management.",
                    illustrationName: "calendar",
                    sciHeading: "Strukturierte Mahlzeitenplanung und glykämische Kontrolle",
                    sciBody: "Strukturierte Ernährungsprogramme für T1DM (DAFNE, PRIMAS) zeigen in RCTs HbA1c-Senkung um 0,3–0,5 % und signifikante Verbesserung der Lebensqualität. Mahlzeitenplanung integriert präzises KH-Counting mit Berücksichtigung von GI, Fett-/Proteingehalt und circadianem Insulinsensitivitätsmuster (höchste IS am Morgen, niedrigste am frühen Nachmittag)."),
                LessonPage(id: UUID(), heading: "Einfach starten",
                    body: "Du musst nicht jeden Tag perfekt planen. Schon das Vorbereiten von 2–3 Mahlzeiten pro Woche macht einen Unterschied. Meal Prep muss auch nicht bedeuten, stundenlang zu kochen – einfache Gerichte mit wenigen Zutaten reichen völlig aus.",
                    illustrationName: "list.bullet",
                    sciHeading: "Evidenzbasierte Ernährungsmuster",
                    sciBody: "Mediterranean Diet und DASH-Diät werden von ADA/EASD als geeignete Ernährungsmuster bei T1DM eingestuft: reich an Ballaststoffen (> 25 g/Tag), ungesättigten Fettsäuren (Omega-3, MUFA), Polyphenolen; arm an raffinierter Stärke und Transfettsäuren. Meta-Analysen zeigen reduzierte kardiovaskuläre Mortalität und verbesserte Lipidprofile."),
                LessonPage(id: UUID(), heading: "Flexibel bleiben",
                    body: "Ein Plan ist ein Hilfsmittel, keine Pflicht. Das Leben ist unberechenbar – und das ist okay. Sei nicht zu hart zu dir selbst, wenn Dinge nicht nach Plan laufen. Flexibilität und Selbstmitgefühl sind genauso wichtig wie gute Vorbereitung.",
                    illustrationName: "arrow.triangle.2.circlepath",
                    sciHeading: "Flexible vs. rigide Insulintherapie",
                    sciBody: "Flexible intensivierte Insulintherapie (FIIT) erlaubt spontane Mahlzeitenauswahl durch bedarfsgerechte Bolusberechnung (KH-Counting + Korrekturfaktor). Im Vergleich zu fixen Diätplänen zeigt FIIT überlegene Lebensqualität (DQOL) bei vergleichbarer HbA1c-Kontrolle. CGM-Integration ermöglicht postprandiales Feedback und kontinuierliche Optimierung der individuellen KE-Faktoren.")
            ],
            estimatedMinutes: 2
        )
    ]
}
