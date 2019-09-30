USER jboss

#COPY modules/ /modules
COPY configuration/ $JBOSS_HOME/standalone/configuration
COPY deployments/*.ear $JBOSS_HOME/standalone/deployments
RUN chown jboss:jboss $JBOSS_HOME/standalone/deployments/*.ear

CMD ["$JBOSS_HOME/bin/standalone.sh", "-b", "0.0.0.0", "-P, "$JBOSS_HOME/standalone/configuration/runtime.properties"]
