module Users exposing (..)

import Html exposing (..)
import Http
import Json.Decode exposing (Decoder, list, succeed)


type alias User =
    { name : String
    }


type Users
    = Loading
    | Loaded (List User)
    | Errored String


type Msg
    = GotUsers (Result Http.Error (List User))


type alias Model =
    { users : Users
    }


init : ( Model, Cmd Msg )
init =
    let
        userDecoder : Decoder User
        userDecoder =
            succeed (User "lol")
    in
    ( Model Loading
    , Http.get
        { url = "https://jsonplaceholder.typicode.com/users"
        , expect = Http.expectJson GotUsers (list userDecoder)
        }
    )


view : Model -> Html Msg
view model =
    case model.users of
        Loading ->
            h3 [] [ text "Loading" ]

        Loaded users ->
            div []
                [ h3 [] [ text "Users: " ]
                , ul []
                    (users |> List.map (\user -> li [] [ text user.name ]))
                ]

        Errored err ->
            h3 [] [ text ("Error: " ++ err) ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotUsers (Ok users) ->
            ( { model | users = Loaded users }, Cmd.none )

        GotUsers (Err _) ->
            ( { model | users = Errored "Failed to fetch users!" }, Cmd.none )
