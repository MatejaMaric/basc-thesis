module Count exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int
    , text : String
    }


type Msg
    = Plus
    | Minus


init : ( Model, Cmd Msg )
init =
    ( { count = 0
      , text = "Count is: "
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text model.text, text (String.fromInt model.count) ]
        , button [ onClick Plus ] [ text "Increase" ]
        , button [ onClick Minus ] [ text "Decrease" ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Plus ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Minus ->
            ( { model | count = model.count - 1 }, Cmd.none )
