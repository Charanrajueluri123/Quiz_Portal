FROM tomcat:9.0

COPY QuizPortal.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080