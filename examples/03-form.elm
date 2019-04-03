import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String
import Char exposing (isDigit, isUpper, isLower)

-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { name : String
  , age : String
  , password : String
  , passwordAgain : String
  }


init : Model
init =
  Model "" "" "" ""



-- UPDATE


type Msg
  = Name String
  | Age String
  | Password String
  | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Age age ->
      { model | age = age }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "text" "Age" model.age Age
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
  if model.password /= model.passwordAgain then
    div [ style "color" "red" ] [ text "Passwords do not match!" ]
  else if String.length model.password < 8 then
    div [ style "color" "red" ] [ text "Password less than 8 characters!" ]
  else if not (String.all isDigit model.age) then
    div [ style "color" "red" ] [ text "Age invalid!" ]
  else if not (String.any isLower model.password) then
    div [ style "color" "red" ] [ text "Password must include at least one lowercase letter!" ]
  else if not (String.any isUpper model.password) then
    div [ style "color" "red" ] [ text "Password must include at least one uppercase letter!" ]
  else if not (String.any isDigit model.password) then
    div [ style "color" "red" ] [ text "Password must include at least one number!" ]
  else
    div [ style "color" "green" ] [ text "OK" ]




