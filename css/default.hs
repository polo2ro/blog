{-# LANGUAGE OverloadedStrings #-}
import Clay
import qualified Prelude as P

htmlbody :: Css
htmlbody = body ? do
    color       black
    fontSize    (px 16)
    margin      (px 0) auto (px 0) auto
    width       (px 600)

    "#header" ? do
        borderBottom solid (px 2) black
        marginBottom (px 30)
        padding (px 12) (px 0) (px 12) (px 0)

    "#logo" ** a ? do
        color black
        --float left
        fontSize (px 18)
        fontWeight bold
        textDecoration none

    div # "#header" ** "#navigation" ? do
        textAlign   (alignSide sideRight)
        a ? do
            color black
            fontSize (px 18)
            fontWeight bold
            marginLeft (px 12)
            textDecoration none
            textTransform uppercase


    "#footer" ? do
        borderTop   solid (px 2) black
        color       "#555"
        fontSize    (px 12)
        marginTop   (px 30)
        padding     (px 12) (px 0) (px 12) (px 0)
        textAlign   (alignSide sideRight)

    h1 ? fontSize (px 24)

    h2 ? fontSize (px 20)

    ".info" ? do
        color       "#555"
        fontSize    (px 14)
        fontStyle   italic


main :: P.IO ()
main = putCss htmlbody
