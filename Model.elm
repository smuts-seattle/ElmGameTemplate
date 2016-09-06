module Model exposing (..)

type Msg
    = TitleBegin
    | Tick Time


type alias InputFrame =
    { 
    }


type alias InputState =
    { 
    }


type alias GameState =
    { 
    }


type alias DrawState =
    { 
    }


type alias Vector =
    { x : Int
    , y : Int
    }


type Model
    = Title
    | Game GameModel


type alias GameModel =
    { inputFrame : InputFrame
    , inputState : InputState
    , gameState : GameState
    , drawState : DrawState
    }


newInputFrame : InputFrame
newInputFrame =
    { 
    }


initModel : Model
initModel =
    Title


initGameModel : Model
initGameModel =
    Game
        {
        }
