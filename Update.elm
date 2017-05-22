module Update exposing (..)

import Model exposing (..)
import TEMPLATEScene.Update.SceneUpdate exposing (..)
-- Add more scenes here
import Platform.Sub


-- The different categories of messages.
-- Each scene has its own subset of messages that can apply to it.
type Msg
    = TEMPLATEMsg TEMPLATESceneMsg
    | UnknownMsg


-- The game's current subscriptions, i.e. the subscriptions of the current scene.
subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        TEMPLATEModel templateModel ->
            (templateSceneSubscriptions templateModel) |> (Sub.map (\sub -> TEMPLATEMsg sub))


-- Updates the state of the current scene and handles any scene transitions if necessary.
update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case model of
        TEMPLATEModel templateModel ->
            case msg of
                TEMPLATEMsg templateMsg ->
                    let
                        ( updatedTEMPLATEModel, cmd, transition ) =
                            updateTEMPLATEScene templateMsg templateModel
                    in
                        case transition of
                            _ ->
                                ( TEMPLATEModel updatedTEMPLATEModel, cmd )

                _ ->
                    ( model, Cmd.none )
