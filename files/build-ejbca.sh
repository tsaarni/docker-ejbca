#!/bin/bash

set -x -e

#
# Start JBoss
#
sed -i 's/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:0.0.0.0/' $APPSRV_HOME/standalone/configuration/standalone.xml
$APPSRV_HOME/bin/standalone.sh &

#
# Build EJBCA
#
cd $EJBCA_HOME

# Setup ant input handler and default values for non-interactive
# install
export ANT_OPTS="-Dant.input.properties=/default.properties"
export ANT_ARGS="-inputhandler org.apache.tools.ant.input.PropertyFileInputHandler"

# The build uses non-default handler in some cases.  Remove these so we
# can run fully non-interactively build with PropertyFileInputHandler
sed -i '/SecureInputHandler/d' bin/cli.xml

ant deploy
ant install

# Link generated admin credentials to / for easier access 
ln -s $EJBCA_HOME/p12/superadmin.p12 /

# Link ejbca.sh command to allow access via PATH
ln -s $EJBCA_HOME/bin/ejbca.sh /usr/bin/ejbca.sh
