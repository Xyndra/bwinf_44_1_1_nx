#import "template.typ": conf
#show link:underline
#show: conf.with(
  title: "Junioraufgabe 1: Bällebad",
  team-id: "00559/80780",
  team-name: "Sammy JWINF/BWINF",
  authors: (
    "Sammy Hamdani",
  ),
)

= Lösungsidee

Die Lösungsidee basiert darauf, für jeden Tag die Zeitspannen der Klassen zu vergleichen und die
Zeitspanne mit der höchsten benötigten Ballzahl zu finden. Hierfür teilt man die Klassen nach
Tag auf, nimmt sich die Start- und Endzeiten in eine Liste ohne Duplikate und sortiert diese.

Dann kann man für jede dieser Zeitspannen die Klassen und somit die benötigte Ballzahl berechnen.
Diese muss man dann einfach miteinander vergleichen und die größte Zahl auswählen.

= Umsetzung

Zuerst werden die Klassen eingelesen und für jeden Tag in eine Liste gespeichert.
Anschließend werden die Start- und Endzeiten in ein Set gespeichert und sortiert.
Für jede Zeitspanne wird geprüft, ob eine Klasse in diesem Zeitraum Unterricht hat.
Wenn ja, wird sie dieser Zeitspanne zugeordnet.

Wenn dies für alle Zeitspannen durchgeführt wurde, geht man alle Zeitspannen für alle Tage
durch und berechnet die benötigte Ballzahl für jede Zeitspanne. Wenn diese Zahl größer als die
größte Vorherige ist, wird die neue Größte mit ihrer Zeitspanne gespeichert.

Am Ende wird die größte Zeitspanne inklusive Klassen und Ballzahl ausgegeben.

#pagebreak()

= Werkzeuge

- #link("https://vlang.io")[V Programmiersprache]
- Typst
- Github Copilot Autovervollständigung
- Git VCS
- Zed Editor

= Beispiele

#{
  let files = ()
  for i in range(8) {
    let num = if i < 10 { "0" + str(i) } else { str(i) }
    files.push("../resources/ball" + num + ".out")
  }

  for file in files {
    heading(level: 3, file.replace(".out", ".txt").replace("../resources/", ""))
    rect(raw(read(file), block: true))
  }
}


= Quellcode

#{
    let files = ("../main.v", "../parser.v", "../logic.v")

    for file in files {
        heading(level: 3, file.replace("../", ""))
        rect(raw(read(file), block: true, lang: "v"))
    }
}
