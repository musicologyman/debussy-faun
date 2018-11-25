\version "2.18.2"

\layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}

setAnalysisBracket = #(define-music-function
                       (parser location color)
                       (color?)
                       #{
                          \override HorizontalBracket.direction = #UP
                          \override HorizontalBracket.color = #color
                          \override HorizontalBracket.thickness = #3.0
                          \override HorizontalBracket.bracket-flare = #'(0.0 . 0.0)
                          \override HorizontalBracket.padding = #1.0
                       #})

setAnalysisBracketDown = #(define-music-function
                       (parser location color)
                       (color?)
                       #{
                          \override HorizontalBracket.direction = #DOWN
                          \override HorizontalBracket.color = #color
                          \override HorizontalBracket.thickness = #3.0
                          \override HorizontalBracket.bracket-flare = #'(0.0 . 0.0)
                          \override HorizontalBracket.padding = #1.0
                          \override HorizontalBracket.outside-staff-priority = #1000
                       #})


setPassageColor = #(define-music-function
                 (parser location c notes)
                 (color? ly:music?)
                 #{
                   \override NoteHead.color = #c
                   \override Stem.color = #c
                   \override Beam.color = #c
                   \override Slur.color = #c
                   \override Accidental.color = #c
                   \override TextScript.color = #c
                   \override DynamicText.color = #c
                   \override Rest.color = #c
                   \override Tie.color = #c
                   \override Script.color = #c
                   #notes
                   \revert NoteHead.color
                   \revert Stem.color
                   \revert Beam.color
                   \revert Slur.color
                   \revert Accidental.color
                   \revert TextScript.color
                   \revert DynamicText.color
                   \revert Rest.color
                   \revert Tie.color
                   \revert Script.color
                 #})
