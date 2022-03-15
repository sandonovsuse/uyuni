# Copyright (c) 2022 SUSE LLC
# Licensed under the terms of the MIT license.
#
# The scenarios in this feature are skipped if:
# * there is no proxy ($proxy is nil)
# * there is no scope @scope_containerized_proxy
#
# Alternative: Bootstrap the proxy as a Pod

@scope_containerized_proxy
@proxy
Feature: Setup Containerized Proxy
  In order to use a Containerized Proxy with the server
  As the system administrator
  I want to register the Containerized Proxy on the server

  Scenario: Log in as admin user
    Given I am authorized for the "Admin" section

  Scenario: Pre-requisite: Stop traditional proxy service
    When I stop salt-minion on "proxy"
    And I run "spacewalk-proxy stop" on "proxy"
    And I wait until "squid" service is inactive on "proxy"
    And I wait until "apache2" service is inactive on "proxy"
    And I wait until "jabberd" service is inactive on "proxy"

  Scenario: Generate Containerized Proxy configuration
    When I generate the configuration "/tmp/proxy_container_config.zip" of Containerized Proxy on the server
    And I copy "/tmp/proxy_container_config.zip" file from "server" to "proxy"
    And I run "unzip -qq -o /tmp/proxy_container_config.zip -d /etc/uyuni/proxy/" on "proxy"

  Scenario: Set the Containerized Proxy to use specific container images
    When I set a new value in a configuration file
      | key      | NAMESPACE                                                                      |
      | value    | registry.suse.de/devel/galaxy/manager/test/hexagon/containers/suse/manager/4.3 |
      | filepath | /etc/sysconfig/uyuni-proxy-systemd-services                                    |
      | host     | proxy                                                                          |
    And I add avahi hosts in Containerized Proxy configuration

  Scenario: Start Containerized Proxy services
    When I start "uyuni-proxy-pod" service on "proxy"
    And I wait until "uyuni-proxy-pod" service is active on "proxy"
    And I wait until "uyuni-container-proxy-httpd" service is active on "proxy"
    And I wait until "uyuni-container-proxy-salt-broker" service is active on "proxy"
    And I wait until "uyuni-container-proxy-squid" service is active on "proxy"
    And I wait until "uyuni-container-proxy-ssh" service is active on "proxy"
    And I wait until "uyuni-container-proxy-tftpd" service is active on "proxy"
    And I wait until port "8022" is listening on "proxy"
    And I wait until port "8080" is listening on "proxy"
    And I wait until port "443" is listening on "proxy"

  Scenario: Containerized Proxy should be registered automatically
    When I follow the left menu "Systems > Overview"
    And I wait until I see the name of "containerized_proxy", refreshing the page
