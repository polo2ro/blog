{-# LANGUAGE OverloadedStrings #-}
import           Clay

htmlbody :: Css
htmlbody = body ? do
    background  white
    color       black
    fontSize    (px 12)


main :: IO ()
main = putCss test
