--
-- Copyright (c) 2008 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--


CREATE TABLE rhnProxyInfo
(
    server_id     NUMERIC NOT NULL
                      CONSTRAINT rhn_proxy_info_sid_fk
                          REFERENCES rhnServer (id),
    proxy_evr_id  NUMERIC
                      CONSTRAINT rhn_proxy_info_peid_fk
                          REFERENCES rhnPackageEVR (id),
    ssh_port      NUMERIC,
    created             TIMESTAMPTZ
                            DEFAULT (current_timestamp) NOT NULL,
    modified            TIMESTAMPTZ
                            DEFAULT (current_timestamp) NOT NULL
)

;

CREATE UNIQUE INDEX rhn_proxy_info_sid_unq
    ON rhnProxyInfo (server_id);

