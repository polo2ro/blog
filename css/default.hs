{-# LANGUAGE OverloadedStrings #-}
import Clay
import qualified Clay.Media as Media
import Prelude (IO)


bgColor, textColor, panelBgColor, textPanelColor, flashy1BgColor, flashy2BgColor :: Color

bgColor = "#dfe3e9"
textColor = "#383838"
panelBgColor = "#527883"
textPanelColor = "#FFFFFF"
flashy1BgColor = "#efd117"
flashy2BgColor = "#f07135"


contentSideMargin = em 0.7
strokeWidth = px 4

baseLink :: Css
baseLink = do
    color panelBgColor
    fontWeight bold
    textDecoration none



htmlbody :: Css
htmlbody = body ? do
    background  bgColor
    color       textColor
    fontSize    (px 16)
    margin      (px 0) auto (px 0) auto
    fontFamily  ["Questrial"] [sansSerif]

    "#header" ? do
        background  (setA 0.6 panelBgColor)
        nav ? do
            background      panelBgColor
            borderBottom    solid strokeWidth flashy2BgColor
            padding         (em 3) contentSideMargin (em 0.5) (em 0)
            textAlign       (alignSide sideRight)
            a ? do
                baseLink
                color           textPanelColor
                marginRight     (em 1.5)
                fontSize        (px 20)
                transitions     [("color", sec 0.2, ease, sec 0)]
                hover &         color black

    "#logo" ** a ? do
        ".fa-circle" ? color (setA 0.3 "#fff")
        ".fa-home"   ? color flashy1BgColor
        float       floatLeft
        fontSize    (px 14)
        marginTop   (px 32)
        marginLeft  contentSideMargin
        hover & ".fa-circle" ? color (setA 0.7 "#fff")
        hover & ".fa-home"   ? color "#000"

    section # "#content" ? do
        background  (setA 0.2 textPanelColor)
        ".row" ? do
            background     (setA 0.3 textPanelColor)
            borderBottom   solid strokeWidth flashy1BgColor

    section # "#footer" ? do

        color       "#555"
        fontSize    (px 12)
        padding     (em 2) contentSideMargin (em 7) contentSideMargin
        textAlign   (alignSide sideRight)

    h1 ? fontSize (px 24)

    h2 ? fontSize (px 20)

    a ? do
        baseLink
        transitions     [("color", sec 0.2, ease, sec 0)]
        hover &         color black

    article |> ".info" ? do
        color       "#555"
        fontSize    (px 14)
        fontStyle   italic

    ".social" ? do
        textAlign   center
        a # ".icon" ? do
            fontSize    (px 20)
            color       flashy2BgColor
            display     inlineBlock
            marginLeft  (px 10)
            marginRight (px 10)
            position    relative
            transitions  [("color", sec 0.2, ease, sec 0), ("background-color", sec 0.2, ease, sec 0)]
        a # ".icon" # hover ? do
            color "#000"
            after & do
                right       (pct (- 50))
                top         (px (- 41))
                color       white
                backgroundColor "#333"
                fontSize   (px 14)
                content    (attrContent "title")
                display     block
                padding     (px 5) (px 15) (px 5) (px 15)
                position    absolute
                whiteSpace  nowrap
                borderRadius (px 2) (px 2) (px 2) (px 2)
                boxShadow   0 0 (px 2) (rgba 0 0 0 0.2)
                zIndex      1
            before & do
                top (px (- 14))
                right (px 8)
                borderStyle solid
                borderColor4 "#333" transparent "#333" transparent
                borderWidth4 (px 5) (px 5) 0 (px 5)
                content (stringContent "")
                display block
                position absolute
                zIndex 2

    ".clear" ? clear both

main :: IO ()
main = putCss htmlbody
