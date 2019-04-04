import Browser
import Html exposing (Html, Attribute, span, input, text, div, br)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { inputC : String
  , inputF : String
  , inputI : String
  }


init : Model
init =
  { inputC = ""
  , inputF = ""
  , inputI = ""
  }



-- UPDATE


type Msg
  = ChangeC String
  | ChangeF String
  | ChangeI String


update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeC newInputC ->
      { model | inputC = newInputC }
    ChangeF newInputF ->
      { model | inputF = newInputF }
    ChangeI newInputI ->
      { model | inputI = newInputI }



-- VIEW

viewC : String -> Html Msg
viewC inputC =
  case String.toFloat inputC of
  Just celsius ->
    viewConverter inputC "blue" (String.fromFloat (celsius * 1.8 + 32))

  Nothing ->
    viewConverter inputC "red" "???"

viewF : String -> Html Msg
viewF inputF =
  case String.toFloat inputF of
  Just far ->
    viewConverterF inputF "blue" (String.fromFloat ((far - 32) / 1.8))

  Nothing ->
    viewConverterF inputF "red" "???"

viewI : String -> Html Msg
viewI inputI =
  case String.toFloat inputI of
  Just inches ->
    viewConverterI inputI "blue" (String.fromFloat (inches / 39.3701))

  Nothing ->
    viewConverterI inputI "red" "???"


view : Model -> Html Msg
view model =
  div []
    [ viewC model.inputC
    , viewF model.inputF
    , viewI model.inputI
    ]



viewConverter : String -> String -> String -> Html Msg
viewConverter userInput color equivalentTemp =
  case String.toFloat userInput of
    Just celsius ->
      div []
        [ input [ value userInput, onInput ChangeC, style "width" "40px"] []
        , text "°C = "
        , span [ style "color" color ] [ text equivalentTemp ]
        , text "°F"
        ]

    Nothing ->
      div []
        [ input [ value userInput, onInput ChangeC, style "width" "40px", style "border-color" "red" ] []
        , text "°C = "
        , span [ style "color" color ] [ text equivalentTemp ]
        , text "°F"
        ]

viewConverterF : String -> String -> String -> Html Msg
viewConverterF userInput color equivalentTemp =
  case String.toFloat userInput of
    Just far ->
      div []
        [ input [ value userInput, onInput ChangeF, style "width" "40px"] []
        , text "°F = "
        , span [ style "color" color ] [ text equivalentTemp ]
        , text "°C"
        ]

    Nothing ->
      div []
        [ input [ value userInput, onInput ChangeF, style "width" "40px", style "border-color" "red" ] []
        , text "°F = "
        , span [ style "color" color ] [ text equivalentTemp ]
        , text "°C"
        ]

viewConverterI : String -> String -> String -> Html Msg
viewConverterI userInput color equivalentLength =
  case String.toFloat userInput of
    Just inches ->
      div []
        [ input [ value userInput, onInput ChangeI, style "width" "40px"] []
        , text " inches = "
        , span [ style "color" color ] [ text equivalentLength ]
        , text " meters"
        ]

    Nothing ->
      div []
        [ input [ value userInput, onInput ChangeI, style "width" "40px", style "border-color" "red" ] []
        , text " inches = "
        , span [ style "color" color ] [ text equivalentLength ]
        , text " meters"
        ]




























