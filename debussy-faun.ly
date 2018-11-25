\version "2.18.2"

\include "functions.ily"

\header {
  tagline = ##f
}

\layout {
  indent = 0 \in
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}


#(set! paper-alist (cons '("size A" . (cons (* 8 in) (* 1.75 in))) paper-alist))
#(set! paper-alist (cons '("size B" . (cons (* 8 in) (* 3 in))) paper-alist))
#(set! paper-alist (cons '("size C" . (cons (* 8 in) (* 3.5 in))) paper-alist))

headMotive = {
  \set subdivideBeams = ##t
  cis4.~ ( cis8 cis16 b \tuplet 3/2 {ais a gis} g8. a16 b bis )
}

excerptA = \relative c'' {
  \clef treble
  \key e \major
  \time 9/8
  \override TupletBracket #'stencil = ##f
  \stemDown
  \set subdivideBeams = ##t
  cis4.~ _\markup { \dynamic p \italic { "  doux et expressiv" } }
  ( cis8 ~ cis16 b \tuplet 3/2 {ais a gis} g8. a16 b bis )
  cis4.~ ( cis8 ~ cis16 b \tuplet 3/2 {ais a gis} g8. a16 b bis )
  \stemNeutral
  cis8 \< ( dis gis e4 gis,8 b4. ~
  b8 \! \> b cis ais4 \! )
}

excerptBRight = \relative c' {
  \key e \major
  <cis e gis ais>1
  <d f aes bes>1
}

excerptBLeft = \relative c, {
  \clef bass
  \key e \major
  s1 |
  <bes f' bes>1
}

excerptC = \relative c''' {
  \key des \major
  \time 3/4
  \autoBeamOff
  aes2 (f4
  es4. des8 ~ des [f,])
  bes'4-> ~ ( bes8 aes4 f8
  es4 ~ es8 des4 ces8 )
}

excerptD = \relative c'' {
  \key e \major
  \time 12/8
  \set subdivideBeams = ##t
  \override TupletBracket #'stencil = ##f
  \stemDown
  cis2. \p \< ~ cis8 \! (cis16 b \tuplet 3/2 {ais a gis)} g8. \< (a16 b bis) |
  \time 9/8
  \set Timing.baseMoment = #(ly:make-moment 1/16)
  \set Timing.beatStructure = #'(6)
  \tuplet 3/2 { cis32 (dis gis }
  \tuplet 3/2 {e cis gis} b8 \! ~ b16 gis)
  \stemNeutral
  \set Timing.baseMoment = #(ly:make-moment 1/8)
  \set Timing.beatStructure = #'(3 3 3)
  fis8 ~ (fis16 gis fis8 ~ fis16 gis dis8. e16)
  \time 12/8
  a2. ~ a8 ~ (a16 gis \tuplet 3/2 { g fis f) } e8. (fis16 g gis) |
  \time 9/8
  \tuplet 3/2 { a16 \< (b a } \tuplet 3/2 {  c d c } e8) ~
  \tuplet 3/2 {e16 (fis e} a8. b16)
  \tuplet 3/2 {e,16 (fis e} a8. b16)
  c4 \! \> (c,8) ~ c b c ~ c b c
  \time 12/8
  cis!2. ~ \p \stopStaff
  \override NoteHead #'transparent = ##t
  \override Stem #'transparent = ##t
  \override Dots #'transparent = ##t
  cis2.
}

excerptERight = \relative c' {
  \key e \major
  \time 12/8
  \partial 4.
  \setAnalysisBracket #blue
  \set subdivideBeams = ##t
  \override Staff.TimeSignature #'stencil = ##f
  eis4 \p \< ^\markup \italic { Clarinet } (fis8) |
  g2. \f \> ~ g4 \! ~ g32 \startGroup \< (fis f e) dis \p \< (e f fis gis fis f e \!) \stopGroup dis16 \> (e)
  \revert Staff.TimeSignature #'stencil
  \time 3/4
  \set Timing.baseMoment = #(ly:make-moment 1/8)
  \set Timing.beatStructure = #'(1 1 2 2)
  f32 \< (g a b cis dis eis dis \!)
  cis8 \> [(\acciaccatura {b16 cis} b8)]
  a \> [(\acciaccatura {g!16 a} g8)] |
  f32 ^\markup {flute} \! \< (g a b cis dis eis dis \!) 
    cis8 \mf [ ( \acciaccatura { b16 cis } b8 ) ]
    \afterGrace a4 \trill { g16 (a) } 
  \time 12/8
  \set beatStructure = #'(3 3 3 3)
  bes2. -> \mf ^\markup { clarinet } ~     
    bes4 ~ bes32 (a aes g) 
  \stopStaff
  \override TextScript #'Y-offset = 0.0
  s4. ^\markup \italic { etc. }
}

excerptELeft = \relative c {
  \clef bass
  \key e \major
  \time 12/8
  \partial 4.
  \set subdivideBeams = ##t
  \override Staff.TimeSignature.stencil = ##f
  s4.
  r4. r8 cis32-. ^\markup \italic cellos \pp cis-. cis-. cis-. cis-. cis-. cis-. cis-.
  cis16 cis-- \< ~cis8 ~ cis16. \< (d32) es16. \p (d32) cis16. (d32) es16. (d32)
  \revert Staff.TimeSignature.stencil
  | cis8-. \stopStaff s8 s2
  \override Staff.BarLine #'stencil = ##f
  s8
}

excerptF = \relative c'' {
  \key e \major
  \time 3/4
  cis8 ^\markup \italic oboe (b16 gis fis4 ~ fis16 b cis gis'
  fis dis e cis b gis fis b cis8 b16 gis)
  gis16 (b16 b8) ~ b16 (d d8) ~ d16 (b cis d)
  gis16 ^\markup \italic violins \cresc (b16 b8) ~ b16 (d d8) ~ d16 (b cis d)
  s \!
}

excerptG = \relative c'' {
  \key e \major
  \time 12/8
  \override TupletBracket #'stencil = ##f
  \set subdivideBeams = ##t
  \stemDown
  cis2. ^\markup \italic "légèrement et expressif [lightly and expressive]" \p \< ~ cis8 \! ~ ( cis16 b \tuplet 3/2 { ais a gis ) }
  g8. \<  ( a16 b bis ) |
  \time 9/8
  \set baseMoment = #(ly:make-moment 1/16)
  \set beatStructure = #'(6 6 6)
  \tuplet 3/2 16 { cis32 (dis gis e cis gis }
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'(3 3 3)
  b8 \! ~ b16 gis)
  \stemNeutral
  fis8 ~ ( fis16 gis fis8 ~ fis16 gis dis8. e16 )
  \time 12/8
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'(3 3 3 3)
  a2. ~ (a8 ~ a16 gis \tuplet 3/2 { g fis f ) } e8. (fis16 g gis) |
  \time 9/8
  \tupletSpan 8
  \tuplet 3/2 { a16 \< (b a c d c } e8) ~ \tuplet 3/2 { e16 (fis e } a8. b16)
  \tuplet 3/2 { e,16 (fis e } a8. b16) |
  c4 \! \> (c,8) ~ c8 b c ~ c b c \! |
}

excerptH = \relative cis'' {
  \key e \major
  \time 12/8
  \override TupletBracket #'stencil = ##f
  \set subdivideBeams = ##t
  \set Timing.beatStructure = #'(3 3 3 3)
  cis2. \p ~ (cis8 ~ cis 16 b \tuplet 3/2 { ais16 a gis ) } g8. (a16 b bis) |
  \time 9/8
  <<
    {
      \setAnalysisBracket #blue
      \slurDown
      \set beatStructure = #'(3 3 3)
      \set subdivideBeams = ##t
      cis32 \startGroup (b a gis g a b c cis b a gis) \stopGroup g16 s16 s8 s8
      \slurUp
      g32 ([a b c!] ) \stemDown cis \< ( b cis e fis e fis gis \! ) 
    } \\
    {
      \set beatStructure = #'(3 3 3)
      \set subdivideBeams = ##t
      s4. \slurUp g,!32 ( a b c cis b a gis g a b c) g16 s s8
    }
  >>
  \time 12/8
  \set subdivideBeams = ##t
  \set beatStructure = #'(3 3 3 3)
  \tuplet 3/2 8 { gis'16 \f (ais gis fis gis fis dis e dis) }
  cis16 (dis ais4) ~ ais8 \tuplet 3/2 8 {
    gis'16 (ais gis fis gis fis )
    dis (e dis)
  } cis (dis ais8) ~
  \time 9/8
  \set beatStructure = #'(3 3 3)
  ais16 \> (b gis8. ais16 fis8. gis16 \! dis8) ~
  \override TextSpanner.bound-details.left.text =
  \markup { \bold \upright "Cédez (Yield)" }
  \tuplet 3/2 { dis16\startTextSpan \> (e gis16 } b8. gis16) \!
  \time 12/8
  b2. \p \> ~ b4 \stopTextSpan \! r8
}

excerptI = \relative gis' {
  \key e \major
  \time 12/8
  \partial 4.
  \setAnalysisBracket #blue
  \set subdivideBeams = ##t
  \override Staff.TimeSignature.stencil = ##f
  eis4 ^\markup {clarinet} \p \< (f8) |
  g2. \f \> ~ g4 \! ~ g32 \startGroup \< (fis f! e) 
    dis \p \< (e f fis g fis f e) \stopGroup dis16 \! \> (e) |
  \revert Staff.TimeSignature.stencil
  \time 3/4
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'(2 2 2)
  f32 \! \< (g a b cis dis eis dis \!) 
    cis8 \> [ ( \acciaccatura { b16 cis } b8 ) ] \!
    a8 \> [ ( \acciaccatura { g16 a } g8 ) ] \! |
  f32 ^\markup {flute} \! \< (g a b cis dis eis dis \!) 
    cis8 \mf [ ( \acciaccatura { b16 cis } b8 ) ]
    \afterGrace a4 \trill { g16 (a) } 
  \time 12/8
  \set beatStructure = #'(3 3 3 3)
  bes2. -> \mf ^\markup { clarinet } ~     
    bes4 ~ bes32 (a aes g) 
  \stopStaff
  \override TextScript #'Y-offset = 0.0
  s4. ^\markup \italic { etc. }
}


scoreA = \score {
  \new Staff \with { midiInstrument = "flute" } \excerptA
  \layout {}
  \midi { \tempo 4. = 44}
}

scoreB = \score {
  \new PianoStaff <<
    \new Staff \with { \remove Time_signature_engraver } \excerptBRight
    \new Staff \with { \remove Time_signature_engraver } \excerptBLeft
  >>
  \layout {}
  \midi {}
}


scoreC = \score {
  \new PianoStaff <<
    \new Staff \with { \remove Time_signature_engraver } \excerptC
  >>
  \layout {}
  \midi { \tempo 4. = 44 }
}


scoreD = \score {
  \new Staff \with { midiInstrument = "flute" } \excerptD
  \layout {}
  \midi { \tempo 4. = 44 }
}

scoreE = \score {
  <<
    \new Staff \with {
      midiInstrument = "acoustic grand"
      midiMaximumVolume = #0.6
    } \excerptERight
    \new Staff \with {
      midiInstrument = "acoustic grand"
      midiMaximumVolume = #0.5
    } \excerptELeft
  >>
  \layout {}
  \midi { \tempo 4. = 44 }
}


scoreF = \score {
  \new Staff \with { \remove Time_signature_engraver } \excerptF
  \layout {}
  \midi { \tempo 4 = 72 }
}

\book {
  \paper {
    ragged-last = ##t
  }
  \scoreA
}


\book {
  \paper {
    ragged-last = ##t
  }
  \scoreB
}


\book {
  \paper {
    ragged-last = ##t
  }
  \scoreC
}


\book {
  \paper {
    ragged-last = ##t
  }
  \scoreD
}


\book {
  \paper {
    ragged-last = ##t
  }
  \scoreE
}


\book {
  \paper {
    ragged-last = ##t
  }
  \scoreF
}

\book {
  \paper {
    ragged-last = ##t
  }
  \score {
    \new Staff \with { midiInstrument = "flute" } \excerptG
    \layout {}
    \midi {}
  }

}

\book {
  \paper {
    ragged-last = ##t
  }
  \score {
    \new Staff \with { midiInstrument = "flute" } \excerptH
    \layout {}
    \midi {}
  }

}


\book {
  \paper {
    ragged-last = ##t
  }
  \score {
    \new Staff \with { midiInstrument = "clarinet" } \excerptI
    \layout {}
    \midi {}
  }

}
