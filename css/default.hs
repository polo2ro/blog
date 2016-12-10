{-# LANGUAGE OverloadedStrings #-}
import Clay
import qualified Clay.Media as Media
import Prelude (IO)


bgColor, textColor, panelBgColor, textPanelColor, flashyColor1, flashyColor2 :: Color

bgColor             = "#dfe3e9"
textColor           = "#4a4a4a"
panelBgColor        = "#527883"
textPanelColor      = "#FFFFFF"
flashyColor1        = "#efd117"
flashyColor2        = "#f07135"


contentSideMargin   = em 0.7
strokeWidth         = px 4

baseLink :: Css
baseLink = do
    color panelBgColor
    textDecoration none



htmlbody :: Css
htmlbody = body ? do
    background                  bgColor
    color                       textColor
    fontSize                    (px 16)
    margin                      (px 0) auto (px 0) auto
    fontFamily                  ["Questrial"] [sansSerif]
    lineHeight                  (em 1.6)

    "#header" ? do
        background              (setA 0.6 panelBgColor)
        nav ? do
            background          panelBgColor
            borderBottom        solid strokeWidth flashyColor2
            padding             (em 3) contentSideMargin (em 0.5) (em 0)
            textAlign           (alignSide sideRight)
            a ? do
                baseLink
                color           textPanelColor
                marginRight     (em 1.5)
                fontSize        (px 20)
                transitions     [("color", sec 0.2, ease, sec 0)]
                hover & color   black

    "#logo" ** a ? do
        ".fa-circle" ?          color (setA 0.7 "#fff")
        ".fa-home"   ?          color "#000"
        float                   floatLeft
        fontSize                (px 14)
        marginTop               (px 35)
        marginLeft              contentSideMargin
        hover & ".fa-home"   ?  color flashyColor2

    section # "#content" ? do
        background  (setA 0.2 textPanelColor)
        ".title" ? background   textPanelColor
        ".content" ? do
            background          (setA 0.7 textPanelColor)
            borderBottom        solid strokeWidth flashyColor1

    section # "#footer" ? do

        color                   "#555"
        fontSize                (px 12)
        padding                 (em 2) contentSideMargin (em 7) contentSideMargin
        textAlign               (alignSide sideRight)

    h1 ? do
        fontSize                (px 38)
        textShadow              (px 3) (px 3) (px 0) (setA 0.22 black)
        lineHeight              (em 1.4)

    h2 ? fontSize               (px 20)

    a ? do
        baseLink
        transitions             [("color", sec 0.2, ease, sec 0)]
        hover & color           black

    article ** ".info" ? do
        color                   "#555"
        fontSize                (px 14)
        fontStyle               italic

    article ** ".caption" ? do
        color                   "#555"
        fontSize                (px 12)
        fontStyle               italic
        textAlign               center
        marginTop               (px 0)

    -- Social icons with custom tooltip
    ".social" ? do
        textAlign               center
        img ? do
            sym borderRadius    (px 3)
            border              solid (px 1) flashyColor2
            sym padding         (px 3)
            backgroundColor     "#fff"
        ".icons" |> a ? do
            fontSize            (px 20)
            color               flashyColor2
            display             inlineBlock
            marginLeft          (px 4)
            marginRight         (px 3)
            position            relative
            transitions         [("color", sec 0.2, ease, sec 0), ("background-color", sec 0.2, ease, sec 0)]
        ".icons" |> a # hover ? do
            color "#000"
            after & do
                right           (pct (- 100))
                top             (px (- 41))
                color           white
                backgroundColor "#333"
                fontSize        (px 14)
                content         (attrContent "title")
                display         block
                padding         (px 5) (px 15) (px 5) (px 15)
                position        absolute
                whiteSpace      nowrap
                sym borderRadius (px 2)
                boxShadow       0 0 (px 4) (rgba 0 0 0 0.5)
                zIndex          1
            before & do
                top             (px (- 6))
                right           (px 4)
                borderStyle     solid
                borderColor4    "#333" transparent "#333" transparent
                borderWidth4    (px 5) (px 5) 0 (px 5)
                content         (stringContent "")
                display         block
                position        absolute
                zIndex          2

    -- Last post list displayed on home page
    ".last-posts" ? do
        marginLeft              (em 1)
        article |> a ? do
            display             block
            marginTop           (em 0.2)
            marginBottom        (em 0.2)
            sym padding         (em 0.5)
            borderStyle         solid
            borderWidth4        0 0 0 (px 4)
            borderColor         transparent
            transitions         [("border-color", sec 0.8, ease, sec 0.2)]
            hover & do
                borderColor     flashyColor2
                h3 ? color      black
                ".info" ? color black

            h3 ? do
                color           flashyColor2
                marginTop       (em 0.3)
                marginBottom    (em 0.3)



main :: IO ()
main = putCss htmlbody
