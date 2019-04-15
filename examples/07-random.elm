import Browser
import Html.Attributes exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Random



-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type alias Model =
  { dieFace : (Int, Int)
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model (1, 1)
  , Cmd.none
  )



-- UPDATE


type Msg
  = Roll
  | NewFace (Int, Int)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      ( model
      , Random.generate NewFace (Random.pair (Random.int 1 6) (Random.int 1 6))
      )

    NewFace newFace ->
      ( Model newFace
      , Cmd.none
      )


getDie1Face : (Int, Int) -> String
getDie1Face face =
  case Tuple.first face of
    1 ->
      "https://upload.wikimedia.org/wikipedia/commons/2/2c/Alea_1.png"
    2 ->
      "https://upload.wikimedia.org/wikipedia/commons/b/b8/Alea_2.png"
    3 ->
      "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alea_3.png"
    4 ->
      "https://upload.wikimedia.org/wikipedia/commons/8/8d/Alea_4.png"
    5 ->
      "https://upload.wikimedia.org/wikipedia/commons/5/55/Alea_5.png"
    6 ->
      "https://upload.wikimedia.org/wikipedia/commons/f/f4/Alea_6.png"
    _ ->
      ""
getDie2Face : (Int, Int) -> String
getDie2Face face =
  case Tuple.second face of
    1 ->
      "https://upload.wikimedia.org/wikipedia/commons/2/2c/Alea_1.png"
    2 ->
      "https://upload.wikimedia.org/wikipedia/commons/b/b8/Alea_2.png"
    3 ->
      "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alea_3.png"
    4 ->
      "https://upload.wikimedia.org/wikipedia/commons/8/8d/Alea_4.png"
    5 ->
      "https://upload.wikimedia.org/wikipedia/commons/5/55/Alea_5.png"
    6 ->
      "https://upload.wikimedia.org/wikipedia/commons/f/f4/Alea_6.png"
    _ ->
      ""


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ img [ src (getDie1Face model.dieFace) ] []
    , img [ src (getDie2Face model.dieFace) ] []
    , div []
    [ button [ onClick Roll ] [ text "Roll" ] ]
    ]