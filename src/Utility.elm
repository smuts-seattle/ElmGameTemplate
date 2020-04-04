module Utility exposing (..)

import List


ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase

    else
        falseCase


type alias Coordinate =
    { x : Int, y : Int }


coordinateDistance : Coordinate -> Coordinate -> Float
coordinateDistance a b =
    let
        x =
            a.x - b.x

        y =
            a.y - b.y
    in
    (x * x) + (y * y) |> toFloat |> sqrt


type alias Vector =
    { x : Int, y : Int }


zeroVector : Vector
zeroVector =
    Vector 0 0


reverseVector : Vector -> Vector
reverseVector v =
    scaleVector v -1


scaleVector : Vector -> Int -> Vector
scaleVector v n =
    Vector (v.x * n) (v.y * n)


filterMaybe : List (Maybe a) -> List a
filterMaybe list =
    List.foldr
        (\elem acc ->
            case elem of
                Nothing ->
                    acc

                Just e ->
                    e :: acc
        )
        []
        list


findFirst : (a -> Bool) -> List a -> Maybe a
findFirst filter l =
    List.map
        (\e ->
            if filter e then
                Just e

            else
                Nothing
        )
        l
        |> filterMaybe
        |> List.head



--Tests if a list contains a specific element using the
-- '==' comparator


listContains : List a -> a -> Bool
listContains l e =
    List.any (\b -> e == b) l



--Removes all instances of element 'e' from list 'l'


listRemove : List a -> a -> List a
listRemove l e =
    List.filter (\b -> e /= b) l


listUpdate : (a -> Bool) -> List a -> a -> List a
listUpdate identifier l e =
    e
        :: List.filter
            (\i -> not (identifier i))
            l
