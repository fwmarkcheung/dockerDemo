FROM marriott-eap-demo/eap-cd-openshift:17.0
MAINTAINER Mark Cheung mcheung@redhat.com


USER root

#COPY modules/ /modules
COPY configuration/ $JBOSS_HOME/standalone/configuration
COPY deployments/*.ear $JBOSS_HOME/standalone/deployments
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/marriott-standalone-openshift.xml
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/runtime.properties
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/*.ear

USER jboss

CMD ["$JBOSS_HOME/bin/standalone.sh", "-b", "0.0.0.0", "-P", "$JBOSS_HOME/standalone/configuration/runtime.properties", "-c", "marriott-standalone-openshift.xml"]
