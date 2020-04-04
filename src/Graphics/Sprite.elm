module Graphics.Sprite exposing (..)

import Array exposing (Array)
import Maybe exposing (withDefault)
import Utility exposing (..)


type Displacement
    = Disp_Linear LinearDisplacement
    | Disp_Const ConstDisplacement


type alias ConstDisplacement =
    { point : Coordinate
    }


type alias LinearDisplacement =
    { startPoint : Coordinate
    , endPoint : Coordinate
    }


calcDisp : Float -> Int -> Displacement -> Vector
calcDisp ticks duration disp =
    case disp of
        Disp_Const d ->
            d.point

        Disp_Linear d ->
            let
                progress =
                    toFloat duration / ticks
            in
            { x =
                d.endPoint.x
                    - d.startPoint.x
                    |> toFloat
                    |> (*) progress
                    |> round
                    |> (+) d.startPoint.x
            , y =
                d.endPoint.y
                    - d.startPoint.y
                    |> toFloat
                    |> (*) progress
                    |> round
                    |> (+) d.startPoint.y
            }


type alias Frame =
    { drawPos : Coordinate
    , drawSize : Vector
    , duration : Int
    , disp : Displacement
    }


type alias Animation =
    { frames : Array Frame
    , isLoop : Bool
    }


type alias Sprite =
    { sheetFile : String
    , animations : Array Animation
    , state : SpriteState
    }


type alias SpriteState =
    { animation : Int
    , frame : Int
    , ticks : Float
    }


type alias SpriteDrawState =
    { drawPos : Coordinate
    , drawSize : Vector
    , disp : Vector
    }


getSpriteDrawState : Sprite -> SpriteDrawState
getSpriteDrawState sprite =
    let
        frame =
            getSpriteFrame sprite
    in
    { drawPos = frame.drawPos
    , drawSize = frame.drawSize
    , disp = calcDisp sprite.state.ticks frame.duration frame.disp
    }


advanceAnimation : Float -> Sprite -> Sprite
advanceAnimation speed sprite =
    let
        currentAnimation =
            getSpriteAnimation sprite

        currentFrame =
            getSpriteFrame sprite
    in
    if currentFrame.duration <= (sprite.state.ticks + speed |> round) then
        if Array.length currentAnimation.frames <= sprite.state.frame + 1 then
            if currentAnimation.isLoop then
                { sprite
                    | state =
                        { animation = sprite.state.animation
                        , frame = 0
                        , ticks = 0
                        }
                }

            else
                { sprite
                    | state =
                        { animation = 0
                        , frame = 0
                        , ticks = 0
                        }
                }

        else
            { sprite
                | state =
                    { animation = sprite.state.animation
                    , frame = sprite.state.frame + 1
                    , ticks = 0
                    }
            }

    else
        { sprite
            | state =
                { animation = sprite.state.animation
                , frame = sprite.state.frame
                , ticks = sprite.state.ticks + 1
                }
        }


enterAnimation : Int -> Sprite -> Sprite
enterAnimation id sprite =
    { sprite
        | state =
            { animation = id
            , frame = 0
            , ticks = 0
            }
    }


getSpriteAnimation : Sprite -> Animation
getSpriteAnimation sprite =
    Array.get sprite.state.animation sprite.animations
        |> withDefault (Animation Array.empty True)


getSpriteFrame : Sprite -> Frame
getSpriteFrame sprite =
    let
        currentAnimation =
            getSpriteAnimation sprite
    in
    Array.get sprite.state.frame currentAnimation.frames
        |> withDefault
            (Frame
                { x = 0, y = 0 }
                zeroVector
                0
                (Disp_Linear
                    (LinearDisplacement
                        (Coordinate 0 0)
                        (Coordinate 0 0)
                    )
                )
            )
