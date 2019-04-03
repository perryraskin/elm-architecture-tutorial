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
  }


init : Model
init =
  { inputC = ""
  , inputF = ""
  }



-- UPDATE


type Msg
  = ChangeC String
  | ChangeF String


update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeC newInputC ->
      { model | inputC = newInputC }
    ChangeF newInputF ->
      { model | inputF = newInputF }



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


view : Model -> Html Msg
view model =
  div []
    [ viewC model.inputC
    , viewF model.inputF
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





























