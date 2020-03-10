module GeneratedTest exposing (..)

import Expect exposing (Expectation)
import Game
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import Test exposing (Test, describe, test)


type alias TestData =
    { initialModel : String, messages : List String, expectedOutput : String }


type alias ParsedTestData =
    { initialModel : Game.Model, messages : List Game.Msg, expectedOutput : Game.Model }


testData : List TestData
testData =
    [ { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[11,0],\"purses\":[0,2],\"inPenaltyBox\":[true,false],\"popQuestions\":[\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[1,5],\"purses\":[3,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[6,4],\"purses\":[1,1],\"inPenaltyBox\":[true,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[7,1],\"purses\":[2,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,5],\"purses\":[0,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[7,2],\"purses\":[1,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[5,9],\"purses\":[1,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[9,10],\"purses\":[2,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[6,3],\"purses\":[1,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[7,2],\"purses\":[1,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,11],\"purses\":[3,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[6,3],\"purses\":[2,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[4,3],\"purses\":[1,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[5,6],\"purses\":[0,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,3],\"purses\":[3,3],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[4,2],\"purses\":[3,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,5],\"purses\":[1,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[1,11],\"purses\":[3,3],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[8,6],\"purses\":[0,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[11,9],\"purses\":[3,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,2],\"purses\":[1,2],\"inPenaltyBox\":[true,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[6,2],\"purses\":[1,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[1,11],\"purses\":[3,1],\"inPenaltyBox\":[false,true],\"popQuestions\":[],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,2],\"purses\":[1,1],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[2,9],\"purses\":[0,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[1,4],\"purses\":[3,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,11],\"purses\":[2,1],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[4,6],\"purses\":[2,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[10,10],\"purses\":[3,3],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[11,0],\"purses\":[1,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[4,6],\"purses\":[1,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[9,1],\"purses\":[2,2],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[5,9],\"purses\":[1,3],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[10,6],\"purses\":[1,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[8,3],\"purses\":[1,1],\"inPenaltyBox\":[true,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[11,6],\"purses\":[2,2],\"inPenaltyBox\":[true,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,7],\"purses\":[0,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[9,8],\"purses\":[1,1],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[8,8],\"purses\":[1,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[8,4],\"purses\":[2,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,6],\"purses\":[3,1],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[10,4],\"purses\":[2,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[7,6],\"purses\":[2,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[4,5],\"purses\":[0,0],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[3,6],\"purses\":[2,2],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":true,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[11,2],\"purses\":[2,1],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":3,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[5,7],\"purses\":[0,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[5,1],\"purses\":[0,1],\"inPenaltyBox\":[true,false],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":5,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":true}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[2,6],\"purses\":[4,0],\"inPenaltyBox\":[false,true],\"popQuestions\":[\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":1,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    , { initialModel =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[0,0],\"purses\":[0,0],\"inPenaltyBox\":[false,false],\"popQuestions\":[\"Pop Question 1\",\"Pop Question 2\",\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 1\",\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 1\",\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      , messages =
            [ "{\"type\":\"DiceRolled\",\"rollValue\":1,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":2,\"didWin\":true}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":6,\"didWin\":false}"
            , "{\"type\":\"DiceRolled\",\"rollValue\":4,\"didWin\":false}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            , "{\"type\":\"NewTurn\"}"
            ]
      , expectedOutput =
            "{\"players\":[\"Chet\",\"cynthia\"],\"places\":[1,6],\"purses\":[0,1],\"inPenaltyBox\":[true,true],\"popQuestions\":[\"Pop Question 3\",\"Pop Question 4\",\"Pop Question 5\"],\"scienceQuestions\":[\"Science Question 2\",\"Science Question 3\",\"Science Question 4\",\"Science Question 5\"],\"sportsQuestions\":[\"Sports Question 2\",\"Sports Question 3\",\"Sports Question 4\",\"Sports Question 5\"],\"rockQuestions\":[\"Rock Question 1\",\"Rock Question 2\",\"Rock Question 3\",\"Rock Question 4\",\"Rock Question 5\"],\"currentPlayer\":0,\"isGettingOutOfPenaltyBox\":false,\"wasCorrectlyAnswered\":false,\"notAWinner\":true}"
      }
    ]


suite : Test
suite =
    List.map decodeTestData testData
        |> List.indexedMap
            (\index result ->
                describe
                    ("Test #" ++ String.fromInt index)
                    [ test "has same final model than before" <|
                        \_ ->
                            case result of
                                Ok data ->
                                    toExpectation data

                                Err _ ->
                                    Expect.fail "Invalid test data format"
                    ]
            )
        |> describe "Tests generated from previous program behaviour"


toExpectation : ParsedTestData -> Expectation
toExpectation parsedTestData =
    let
        finalModel =
            List.foldl
                (\msg model -> Game.update msg model |> Tuple.first)
                parsedTestData.initialModel
                parsedTestData.messages
    in
    Expect.equal parsedTestData.expectedOutput finalModel


decodeTestData : TestData -> Result Decode.Error ParsedTestData
decodeTestData data =
    Result.map3
        ParsedTestData
        (Decode.decodeString modelDecoder data.initialModel)
        (List.map (Decode.decodeString msgDecoder) data.messages
            |> List.reverse
            |> List.foldl (Result.map2 (::)) (Ok [])
        )
        (Decode.decodeString modelDecoder data.expectedOutput)


modelDecoder : Decoder Game.Model
modelDecoder =
    Decode.succeed Game.Model
        |> required "players" (Decode.array Decode.string)
        |> required "places" (Decode.array Decode.int)
        |> required "purses" (Decode.array Decode.int)
        |> required "inPenaltyBox" (Decode.array Decode.bool)
        |> required "popQuestions" (Decode.list Decode.string)
        |> required "scienceQuestions" (Decode.list Decode.string)
        |> required "sportsQuestions" (Decode.list Decode.string)
        |> required "rockQuestions" (Decode.list Decode.string)
        |> required "currentPlayer" Decode.int
        |> required "isGettingOutOfPenaltyBox" Decode.bool
        |> required "wasCorrectlyAnswered" Decode.bool
        |> required "notAWinner" Decode.bool


msgDecoder : Decoder Game.Msg
msgDecoder =
    Decode.field "type" Decode.string
        |> Decode.andThen
            (\type_ ->
                case type_ of
                    "DiceRolled" ->
                        Decode.map2 Game.DiceRolled (Decode.field "rollValue" Decode.int) (Decode.field "didWin" Decode.bool)

                    "NewTurn" ->
                        Decode.succeed Game.NewTurn

                    _ ->
                        Decode.fail "Unknown message"
            )
