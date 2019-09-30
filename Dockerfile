FROM marriott-eap-demo/eap-cd-openshift:17.0
MAINTAINER Mark Cheung mcheung@redhat.com


USER root

#COPY modules/ /modules
COPY configuration/ /opt/eap/standalone/configuration
COPY deployments/*.ear /opt/eap/standalone/deployments
RUN chown jboss:jboss /opt/eap/standalone/configuration/marriott-standalone-openshift.xml
RUN chown jboss:jboss /opt/eap/standalone/configuration/runtime.properties
RUN chown jboss:jboss /opt/eap/standalone/deployments/*.ear

USER jboss

CMD ["/opt/eap/bin/standalone.sh", "-b", "0.0.0.0", "-P", "/opt/eap/standalone/configuration/runtime.properties", "-c", "marriott-standalone-openshift.xml"]
