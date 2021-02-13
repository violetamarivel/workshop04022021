Feature: Create Booking
  Este servicio es utilizado para poder crear resevas

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario Outline: Validar peticion correcta para crear una reserva reciba 200
      Given path '/booking'
      And request
      """
      {
    "firstname" : "<firstname>",
    "lastname" : "<lastname>",
    "totalprice" : <totalprice>,
    "depositpaid" : <depositpaid>,
    "bookingdates" : {
        "checkin" : "<checkin>",
        "checkout" : "<checkout>"
    },
    "additionalneeds" : "<additionalneeds>"
}'
      """
      When method POST
      Then status 200
      And match response.booking.firstname == '<firstname>'
      And match response.booking.lastname == '<lastname>'
      And match response.booking.totalprice == <totalprice>
      And match response.booking.depositpaid == <depositpaid>
      And match response.booking.bookingdates.checkin == '<checkin>'
      And match response.booking.bookingdates.checkout == '<checkout>'
      And match response.booking.additionalneeds == '<additionalneeds>'
      And match response.booking.firstname == '#string'
      And match response.booking.lastname == '#string'
      And match response.booking.totalprice == '#number'
      And match response.booking.depositpaid == '#boolean'
      And match response.booking.bookingdates.checkin == '#string'
      And match response.booking.bookingdates.checkout == '#string'

      Examples:
        |firstname|lastname|totalprice|depositpaid| checkin  |checkout  |additionalneeds|
        |Jacy     |Valeria |1         |true       |2020-11-02| 2020-11-02|lunch          |
        |Violeta  |Peña    |3         |false      |2020-11-02| 2020-11-02|dinner         |
        |Mon      |Chanta  |1000      |true       |2021-11-02| 2020-11-02|breakfaast     |
        |Sofia    |Lara    |2000      |false      |1991-11-02| 2020-11-02|dinner         |




  Scenario Outline: Validar peticion correcta para crear una reserva reciba 200
    Given path '/booking'
    And request
      """
      {
    "firstname" : "<firstname>",
    "lastname" : "<lastname>",
    "totalprice" : <totalprice>,
    "depositpaid" : <depositpaid>,
    "bookingdates" : {
        "checkin" : "<checkin>",
        "checkout" : "<checkout>"
    },
    "additionalneeds" : "<additionalneeds>"
}'
      """
    When method POST
    Then status 200
    And match response.booking.firstname == '<firstname>'
    And match response.booking.lastname == '<lastname>'
    And match response.booking.totalprice == <totalprice>
    And match response.booking.depositpaid == <depositpaid>
    And match response.booking.bookingdates.checkin == '<checkin>'
    And match response.booking.bookingdates.checkout == '<checkout>'
    And match response.booking.additionalneeds == '<additionalneeds>'
    And match response.booking.firstname == '#string'
    And match response.booking.lastname == '#string'
    And match response.booking.totalprice == '#number'
    And match response.booking.depositpaid == '#boolean'
    And match response.booking.bookingdates.checkin == '#string'
    And match response.booking.bookingdates.checkout == '#string'

    Examples:
      |read('Data/data.csv')   |

