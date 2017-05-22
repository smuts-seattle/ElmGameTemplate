module TEMPLATEScene.Update.SceneUpdate exposing (..)

import TEMPLATEScene.Model.Models exposing (..)
import TEMPLATEScene.Update.InputUpdate exposing (..)
import TEMPLATEScene.Update.GameUpdate exposing (..)
import TEMPLATEScene.Update.ViewUpdate exposing (..)
import Time exposing (Time)


-- Transitions that this scene can make to other scenes.
-- Return one of these from the Update method to signal
-- the main game loop to switch scenes.
type TEMPLATESceneTransition
    = NoTransition


-- Messages that can apply to this scene
type TEMPLATESceneMsg
    = Tick Time
    | Ignored


-- Subscriptions that this scene sets up.
templateSceneSubscriptions : TEMPLATESceneState -> Sub TEMPLATESceneMsg
templateSceneSubscriptions model =
    Sub.batch
        [ Time.every (33 * Time.millisecond) Tick ]


-- Updates the scene in stages, by first updating the Input state,
-- then the Game state, then the Draw state. Segregating the update logic
-- like this produces simpler, more reliable code.
updateTEMPLATEScene : TEMPLATESceneMsg -> TEMPLATESceneState -> ( TEMPLATESceneState, Cmd msg, TEMPLATESceneTransition )
updateTEMPLATEScene msg model =
    case msg of
        -- Main game loop
        Tick time ->
            let
                modelWithUpdatedInput =
                    updateInputState model

                modelWithUpdatedGame =
                    updateGameState modelWithUpdatedInput

                modelWithUpdatedView =
                    updateDrawState modelWithUpdatedGame
            in
                ( modelWithUpdatedView
                , Cmd.none
                , NoTransition
                )

        -- Input messages

        -- Unrecognized message
        _ ->
            ( model, Cmd.none, NoTransition )