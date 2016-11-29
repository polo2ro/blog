{-# LANGUAGE OverloadedStrings #-}
import Clay
import Prelude (IO)


bgColor, textColor, panelBgColor, textPanelColor :: Color

bgColor = rgb 255 160 50
textColor = rgb 56 135 190
panelBgColor = "#f8f8f8"
textPanelColor = "#f8f8f8"


baseLink :: Css
baseLink = do
    color black
    fontSize (px 18)
    fontWeight bold
    textDecoration none

htmlbody :: Css
htmlbody = body ? do
    color       black
    fontSize    (px 16)
    margin      (px 0) auto (px 0) auto
    maxWidth    (px 1000)
    minWidth    (px 600)

    nav ? do
        borderBottom solid (px 2) black
        marginBottom (px 30)
        padding (px 12) (px 0) (px 12) (px 0)
        textAlign   (alignSide sideRight)
        a ? do
            baseLink
            marginLeft (px 12)
            textTransform uppercase

    "#logo" ** a ? do
        baseLink
        float floatLeft


    section # "#footer" ? do
        borderTop   solid (px 2) black
        color       "#555"
        fontSize    (px 12)
        marginTop   (px 30)
        padding     (px 12) (px 0) (px 12) (px 0)
        textAlign   (alignSide sideRight)

    h1 ? fontSize (px 24)

    h2 ? fontSize (px 20)

    article |> ".info" ? do
        color       "#555"
        fontSize    (px 14)
        fontStyle   italic


main :: IO ()
main = putCss htmlbody
