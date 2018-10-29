django('django') {
    currentBuild.result = "SUCCESS"

    try {

       stage('Test'){

         print "Checking if git is installed"

         sh 'git -v'

       }

       stage('Pull from repository'){

          sh 'cd django-ribbit'
          sh 'git pull origin master'
          sh 'cd ..'

       }

       stage('Build Docker Image'){

          sh 'cd django-ribbit'
          sh 'docker-compose build web'
          sh 'cd ..'
       }

       stage('Deploy'){

         echo 'Push to Repo'
         sh 'cd django-ribbit'
         sh 'git push origin master'
         sh 'heroku login'
         sh 'docker login'
         sh 'heroku container:login'
         sh 'heroku container:push web --app dockeribbit'
         sh 'cd ..'


       }

    }

    catch (err) {

        currentBuild.result = "FAILURE"

        echo 'Build or Deploy failure'
       
        throw err
    }

}