Feature: JSON Parsing Test

  Scenario: Read and print JSON
    * def json =
      """
      [
        { "name": "Tony", "city": "safidon" },
        { "name": "Steve", "city": "mohali" }
      ]
      """
    * print json
    * print json[0]

  Scenario: complex json
    * def complex =
      """
      {"menu": {
      "id": "file",
      "value": "File",
      "popup": {
      "menuitem": [
        {"value": "New", "onclick": "CreateNewDoc()"},
        {"value": "Open", "onclick": "OpenDoc()"},
        {"value": "Close", "onclick": "CloseDoc()"}
      ]
      }
      }}
      """
      * print complex
      * print complex.menu
      * print complex.menu.id
      * print complex.menu.popup
      * print complex.menu.popup.menuitem
      * print complex.menu.popup.menuitem[0]
