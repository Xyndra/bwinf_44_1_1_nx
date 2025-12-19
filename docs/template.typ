#let conf(
  title: "Titel der Aufgabe",
  team-id: "?????????",
  team-name: "Team-Name",
  authors: ("Author1", "Author2"),
  doc,
) = {
  //Settings
  set text(
    font: "New Computer Modern",
    lang: "de",
    size: 10pt
  )
  set math.equation(numbering: "(1)")
  set par(justify: true)
  set heading(numbering: "1.1")

  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      // Override equation references.
      link(el.location(),numbering(
        el.numbering,
        ..counter(eq).at(el.location())
      ))
    } else {
      // Other references as usual.
      it
    }
  }

  set page(header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 12pt)
      #title
      #h(1fr)
      Team-ID: #team-id
    ]
  })

  set page(footer: context {
    align(center, counter(page).display("1/1", both: true))
  })

  //Title
  set align(center)
  text(20pt, weight: "bold", [#title \ \ ])

  let date = datetime.today()
  let all_months = ("Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember")
  let month = all_months.at(date.month() - 1)

  text(
    size: 15pt,

    [
      Team-ID: #team-id \
      Team-Name: #team-name \
      //Authors
      Bearbeiter/-innen dieser Aufgabe:
      #let count = authors.len()
      #let ncols = calc.min(count, 3)
      #grid(
        columns: (1fr,) * ncols,
        row-gutter: 24pt,
        ..authors.map(author => [
          #author \
        ]),
      )
      //Current Date
      #date.day(). #month #date.year() \
    ]
  )

  //Outline
  set align(left)
  set outline.entry(fill: none)
  show outline.entry.where(
    level: 1
  ): set text(weight: "bold")
  
  outline()
  

  //Document
  doc
}
