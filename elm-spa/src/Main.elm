module Main exposing (..)

import Browser
import Browser.Navigation
import Count
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser
import Users


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


{-| We are using a separate Route type because we don't want parser to handle page's model
-}
type Route
    = Home
    | Users
    | About


{-| Our Page type keeps Models of coresponding pages.
Since only one page can be displayed at a time, only one model can be kept in memory.
In other words, state of the page is lost when we navigate away from it.
-}
type Page
    = CountPage Count.Model
    | UsersPage Users.Model
    | AboutPage


{-| State of the entire application
-}
type alias Model =
    { page : Page -- Current page
    , key : Browser.Navigation.Key -- Needed by Elm for internal navigation, not important for us
    }


{-| All messages we handle
-}
type Msg
    = LinkClicked Browser.UrlRequest -- When the link is clicked we need to see if it's internal or external and decide what to do next
    | UrlChanged Url.Url -- If the link is internal we need to handle the page change
    | GotCountMsg Count.Msg -- If we get a Msg from Count page we need to map it to main Msg and change the page model
    | GotUsersMsg Users.Msg


{-| We need to initialize the application for every url/page, that's why we use changePage function
-}
init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model : Model
        model =
            { page = AboutPage
            , key = key
            }
    in
    changePage url model


{-| Render the application
-}
view : Model -> Browser.Document Msg
view model =
    { title = "Elm SPA"
    , body =
        let
            content =
                case model.page of
                    CountPage countModel ->
                        Count.view countModel |> Html.map GotCountMsg

                    UsersPage usersModel ->
                        Users.view usersModel |> Html.map GotUsersMsg

                    AboutPage ->
                        h3 [] [ text "About" ]
        in
        [ h2 [] [ text "Elm SPA" ]
        , nav []
            [ ul []
                [ li [] [ a [ href "/" ] [ text "Home" ] ]
                , li [] [ a [ href "/users" ] [ text "Users" ] ]
                , li [] [ a [ href "/about" ] [ text "About Page" ] ]
                ]
            ]
        , hr [] []
        , content
        ]
    }


{-| Update the model depending on the recived message
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked req ->
            case req of
                Browser.External href ->
                    ( model, Browser.Navigation.load href )

                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

        UrlChanged url ->
            changePage url model

        GotCountMsg count_msg ->
            case model.page of
                CountPage count_model ->
                    Count.update count_msg count_model |> mapCount model

                _ ->
                    ( model, Cmd.none )

        GotUsersMsg users_msg ->
            case model.page of
                UsersPage users_model ->
                    Users.update users_msg users_model |> mapUsers model

                _ ->
                    ( model, Cmd.none )


{-| changePage is used when initializing the application (init) and changing pages (update)
-}
changePage : Url.Url -> Model -> ( Model, Cmd Msg )
changePage url model =
    let
        parser : Url.Parser.Parser (Route -> a) a
        parser =
            Url.Parser.oneOf
                [ Url.Parser.map Home Url.Parser.top
                , Url.Parser.map Users (Url.Parser.s "users")
                , Url.Parser.map About (Url.Parser.s "about")
                ]
    in
    case Url.Parser.parse parser url of
        Just Home ->
            Count.init |> mapCount model

        Just Users ->
            Users.init |> mapUsers model

        Just About ->
            ( { model | page = AboutPage }, Cmd.none )

        Nothing ->
            ( { model | page = AboutPage }, Cmd.none )


{-| mapCount is used to change the page model when we recive a Msg from the page (update)
mapCount is also used by changePage to initialize the page model
-}
mapCount : Model -> ( Count.Model, Cmd Count.Msg ) -> ( Model, Cmd Msg )
mapCount model ( count_model, count_msg ) =
    ( { model | page = CountPage count_model }
    , Cmd.map GotCountMsg count_msg
    )


mapUsers : Model -> ( Users.Model, Cmd Users.Msg ) -> ( Model, Cmd Msg )
mapUsers model ( users_model, users_msg ) =
    ( { model | page = UsersPage users_model }
    , Cmd.map GotUsersMsg users_msg
    )
