Feature: Call Login

Background:
    * url 'https://icrreg2.rnd.metricstream.com/'
    * def config = { username: 'METRICSTREAM', password: 'password', url: 'jdbc:oracle:thin:@DB:10.100.1.77:34355:pdb', driverClassName: 'oracle.jdbc.OracleDriver'}
    * def DbUtils = Java.type('DbUtils')
    * def db = new DbUtils(config)
    #* def db = ""
    * def getRand =
    """
        function(max) {
            return Math.floor(Math.random() * max);
        }
    """
    * def contactName = "Request_MetricStream_Def" + getRand(100)
Scenario: Authentication and login
    Given path '/metricstream/auth/basic'
    And form field username = 'SYSTEMI'
    And form field password = 'welcome*13'
    When method POST
    Then status 200
    Then def cooky = responseCookies
    Then print cooky
   
    
 