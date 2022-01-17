PROJECT = rabbitmq_stamp
PROJECT_DESCRIPTION = RabbitMQ Exchange to provide unique incrementing identifiers for messages sent to it.
PROJECT_MOD = rabbit_stamp

define PROJECT_APP_EXTRA_KEYS
	{broker_version_requirements, ["3.8.0", "3.9.0"]}
endef

define PROJECT_ENV
[
	    {exchange, <<"rabbitmq_stamp">>}
	  ]
endef

DEPS = rabbit_common rabbit amqp_client
TEST_DEPS = ct_helper rabbitmq_ct_helpers rabbitmq_ct_client_helpers amqp_client
dep_ct_helper = git https://github.com/extend/ct_helper.git master

DEP_EARLY_PLUGINS = rabbit_common/mk/rabbitmq-early-plugin.mk
DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk

