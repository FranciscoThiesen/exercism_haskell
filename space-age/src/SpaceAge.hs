module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune


ageOnEarth :: Float -> Float
ageOnEarth x = x / 31557600

ageOn :: Planet -> Float -> Float
ageOn Mercury x = (/ 0.2408467) $ ageOnEarth x
ageOn Venus x = (/ 0.61519726) $ ageOnEarth x
ageOn Mars x = (/ 1.8808158) $ ageOnEarth x
ageOn Jupiter x = (/ 11.862615) $ ageOnEarth x
ageOn Saturn x = (/ 29.447498) $ ageOnEarth x
ageOn Uranus x = (/ 84.016846) $ ageOnEarth x
ageOn Neptune x = (/ 164.79132) $ ageOnEarth x
ageOn Earth x = ageOnEarth x
