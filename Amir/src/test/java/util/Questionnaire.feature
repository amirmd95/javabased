Feature: Fetch Questions

Background:
    * url 'https://icrreg2.rnd.metricstream.com/'
    * def signIn = callonce read('util/signin.feature')
    * def cooky = signIn.cooky
    * def db = signIn.db
    * def contactName = signIn.contactName
    * configure cookies = cooky
    

Scenario: TC01 Get Questions
    Given path '/metricstream/api/7.0/icr/questionnaire/Questionnaire-100200'
    #And print "Cookey value = ", cooky
    When method Get
    Then status 200
    # min 1 question should be there
    # mandatory fields - Ques ID, Ques Name, Ques rank
    # structure of a json
    And match response $.sectionList[*].questionList[*].questionId contains {'QUESTION-100200','QUESTION-100201','QUESTION-100202','QUESTION-100203'}
    And match response $.sectionList[*].questionList[*].questionRank contains "1"

 Scenario: TC02 wrong question
    Given path '/metricstream/api/7.0/icr/questionnaire/Questionnaire-100200'
    #And print "Cookey value = ", cooky
    When method Get
    Then status 200
    # min 1 question should be there
    # mandatory fields - Ques ID, Ques Name, Ques rank
    # structure of a json
    And match response $.sectionList[*].questionList[*].questionId contains {'QUESTION-100200','QUESTION-100201','QUESTION-100202','QUESTION-100203'}
    And match response $.sectionList[*].questionList[*].questionRank contains "2"

Scenario: TC03 Sending blank cooky
configure cookies = ""
Given path '/metricstream/api/7.0/icr/questionnaire/Questionnaire-100200'
#And print "Cookey value = ", cooky
When method Get
Then status 200
# min 1 question should be there
# mandatory fields - Ques ID, Ques Name, Ques rank
# structure of a json
And match response $.sectionList[*].questionList[*].questionId contains {'QUESTION-100200','QUESTION-100201','QUESTION-100202','QUESTION-100203'}
And match response $.sectionList[*].questionList[*].questionRank contains "4"

Scenario: TC04 validation of the data
* def expectedOutput=read('Question.json')
Given path '/metricstream/api/7.0/icr/questionnaire/Questionnaire-100200'
When method GET
Then status 200
Then print response
And match response == expectedOutput
And match response.sectionList.questionId==QUESTION-100200

Scenario: TC05 wrong question2
* def expectedOutput=read('Question.json')
Given path '/metricstream/api/7.0/icr/questionnaire/Questionnaire-100200'
When method GET
Then status 200
Then print response
And match response == expectedOutput
And match response.sectionList.questionId==QUESTION-20000


Scenario: TC05 Logout of the application
    Given path '/metricstream/auth/logout'
    When method Get
    Then status 200
    And match responseCookies !contains { JSESSION_ID: "#notnull" }