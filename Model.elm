module Model exposing (..)

import TEMPLATEScene.Model.Models exposing (..)
-- Add more scenes here


-- The possible scenes of the model.
-- Different scenes (such as title, play, and credits)
-- may require different state to be tracked.
type Model
    = TEMPLATEModel TEMPLATESceneState


-- The initial state of the game.
-- This should be the initial state of your first scene.
initModel : Model
initModel =
    TEMPLATEModel initialTEMPLATESceneState
