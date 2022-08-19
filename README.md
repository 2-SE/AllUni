This is an extension of the Main project.
Included so far are:

A SingUpInOut page containing all simplified utilities provided by AWS_Auth_cognito
-usable by: import 'package:navigation_drawer_test/Utils/SignUpInOut.dart' and then SignUpInOut().function

The full model integration using AWS Datastore and/or AWS API:
-models contains the Event model obtained by codegen
-Providers contains the generated ModelProvider and EventProvider
--EvenProvider contains CRUD utilities for our Event model

In order to use the project:

in PS terminal:
$amplify pull --appId d3u5nokauuvgu --envName staging /// to connect to the backend with our 
        defined models and tables
$amplify codegen models ///generates the models established by our backend