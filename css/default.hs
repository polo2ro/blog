{-# LANGUAGE OverloadedStrings #-}
import Clay
import qualified Clay.Media as Media
import Prelude (IO)


bgColor, textColor, panelBgColor, textPanelColor, softBgColor :: Color

bgColor = "#cbc2a5"
textColor = "#383838"
panelBgColor = "#527883"
textPanelColor = "#FFFFFF"
flashy1BgColor = "#efd117"
flashy2BgColor = "#f07135"
softBgColor = "#f2f1e7"


contentSideMargin = em 0.7

baseLink :: Css
baseLink = do
    color panelBgColor
    fontWeight bold
    textDecoration none

-- One and two column layouts.

oneColumn :: Css
oneColumn =
  do width (px 550)
     boxSizing borderBox

oneOrTwoColumns :: Css
oneOrTwoColumns =
  do query Clay.all [Media.minWidth 800] twoColumns
     query Clay.all [Media.maxWidth 800] oneColumn

twoColumns :: Css
twoColumns =

  do -- Both columns are have the size of their parent.
     div <?
       do width      (pct 50)
          boxSizing  borderBox

     -- Float first child to the left, second to the right.
     column "1" floatLeft  paddingRight
     column "2" floatRight paddingLeft

     -- Don't float outside the section.
     br ? clear both

  where column i side pad =
          div # nthChild i <?
            do float  side
               pad    (px 30)


htmlbody :: Css
htmlbody = body ? do
    background  bgColor
    color       textColor
    fontSize    (px 16)
    margin      (px 0) auto (px 0) auto
    maxWidth    (px 1000)
    minWidth    (px 600)
    fontFamily  ["Questrial"] [sansSerif]

    "#header" ? borderTop    solid (px 8) "#c9deec"

    nav ? do
        background      panelBgColor
        borderBottom    solid (px 8) flashy2BgColor
        padding         (em 3) contentSideMargin (em 0.5) (em 0)
        textAlign       (alignSide sideRight)
        a ? do
            baseLink
            color           textPanelColor
            marginLeft      (em 2)
            textTransform   uppercase
            fontSize        (px 24)


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
        background  softBgColor
        padding     (em 1.7) contentSideMargin (em 2.7) contentSideMargin


    section # "#footer" ? do
        borderTop   solid (px 8) flashy1BgColor
        color       "#555"
        fontSize    (px 12)
        padding     (em 2) contentSideMargin (em 7) contentSideMargin
        textAlign   (alignSide sideRight)
        background  (vGradient (setA 0.2 flashy1BgColor) (setA 0 flashy1BgColor))

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

    ".two-col" ? oneOrTwoColumns

    ".social" ? do
        textAlign   center
        backgroundColor  "#fff"
        padding     (em 1) contentSideMargin (em 1) contentSideMargin
        fontSize    (px 30)
        a ? do
            color       flashy2BgColor
            display     inlineBlock
            marginLeft  (px 10)
            marginRight (px 10)
            hover & color "#000"

    ".clear" ? clear both

main :: IO ()
main = putCss htmlbody
