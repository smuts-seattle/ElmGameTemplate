module Graphics.SpriteEngine exposing (..)

import Graphics.Sprite exposing (..)
import Html exposing (Html)
import Html.Attributes exposing (style)
import String
import Utility exposing (..)


type DrawOption
    = DrawOption_FlipHorizontal
    | DrawOption_FlipVertical


drawStaticSprite : String -> Coordinate -> Vector -> Int -> List DrawOption -> Html msg
drawStaticSprite image position size rotation options =
    Html.div
        (List.append
            [ style "background-image" ("url(" ++ image ++ ")")
            , style "background-size" "contain"
            , style "background-repeat" "no-repeat"
            , style "position" "absolute"
            , style "left" (String.fromInt position.x ++ "px")
            , style "top" (String.fromInt position.y ++ "px")
            , style "width" (String.fromInt size.x ++ "px")
            , style "height" (String.fromInt size.y ++ "px")
            , style "transform" ("rotate(" ++ String.fromInt rotation ++ "deg)")
            ]
            (ifThenElse
                (List.member
                    DrawOption_FlipHorizontal
                    options
                )
                flipHorizontal
                []
            )
        )
        []


drawSprite : Sprite -> Coordinate -> Int -> List DrawOption -> Html msg
drawSprite sprite position rotation options =
    let
        spriteState =
            getSpriteDrawState sprite
    in
    Html.div
        (List.append
            [ style "background-image" ("url(" ++ sprite.sheetFile ++ ")")
            , style "background-repeat" "no-repeat"
            , style "background-position"
                (String.fromInt (spriteState.drawPos.x * -1)
                    ++ "px "
                    ++ String.fromInt (spriteState.drawPos.y * -1)
                    ++ "px"
                )
            , style "position" "absolute"
            , style "left" (String.fromInt position.x ++ "px")
            , style "top" (String.fromInt position.y ++ "px")
            , style "width" (String.fromInt spriteState.drawSize.x ++ "px")
            , style "height" (String.fromInt spriteState.drawSize.y ++ "px")
            , style "transform" ("rotate(" ++ String.fromInt rotation ++ "deg)")
            ]
            (ifThenElse
                (List.member
                    DrawOption_FlipHorizontal
                    options
                )
                flipHorizontal
                []
            )
        )
        []


drawEmpty : Html msg
drawEmpty =
    Html.div [] []


drawFrame : Vector -> List (Html msg) -> Html msg
drawFrame size sprites =
    Html.div
        [ style "position" "absolute"
        , style "width" (String.fromInt size.x ++ "px")
        , style "height" (String.fromInt size.y ++ "px")
        , style "left" "20px"
        , style "top" "20px"
        ]
        sprites


flipHorizontal : List (Html.Attribute msg)
flipHorizontal =
    [ style "-moz-transform" "scaleX(-1)"
    , style "-o-transform" "scaleX(-1)"
    , style "-webkit-transform" "scaleX(-1)"
    , style "transform" "scaleX(-1)"
    , style "filter" "FlipH"
    , style "-ms-filter" "FlipH"
    ]
