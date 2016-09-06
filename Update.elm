module Update exposing (..)

import Model exposing (..)
import List exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case model of
        Title ->
            updateTitle msg

        Game gameModel ->
            updateGame msg gameModel


updateTitle : Msg -> ( Model, Cmd msg )
updateTitle msg =
    case msg of
        TitleBegin ->
            ( initGameModel, Cmd.none )

        _ ->
            ( Title, Cmd.none )


updateGame : Msg -> GameModel -> ( Model, Cmd msg )
updateGame msg game =
    case msg of
        -- Main game loop
        Tick time ->
            let
                updatedInputState =
                    updateInputState game.inputState game.inputFrame

                updatedGameState =
                    updateGameState game.gameState updatedInputState

                updatedDrawState =
                    updateDrawState game.drawState game.gameState game.inputState
            in
                ( Game
                    { game
                        | inputFrame = newInputFrame
                        , inputState = updatedInputState
                        , gameState = updatedGameState
                        , drawState = updatedDrawState
                    }
                , Cmd.none
                )

        -- Input messages

        _ ->
            ( Game game, Cmd.none )


updateInputState : InputState -> InputFrame -> InputState
updateInputState inputState inputFrame =
    inputState


updateGameState : GameState -> InputState -> GameState
updateGameState gameState inputState =
    gameState


updateDrawState : DrawState -> GameState -> InputState -> DrawState
updateDrawState drawState gameState inputState =
    drawState
