{-# LANGUAGE OverloadedStrings #-}
import           Clay

htmlbody :: Css
htmlbody = body ? do
    color       black
    fontSize    (px 16)
    margin      (px 0) auto (px 0) auto
    width       (px 600)



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


main :: IO ()
main = putCss htmlbody
