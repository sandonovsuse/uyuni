/*
 * Copyright (c) 2019 SUSE LLC
 *
 * This software is licensed to you under the GNU General Public License,
 * version 2 (GPLv2). There is NO WARRANTY for this software, express or
 * implied, including the implied warranties of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
 * along with this software; if not, see
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
 *
 * Red Hat trademarks are not licensed under GPLv2. No permission is
 * granted to use or replicate Red Hat trademarks that are incorporated
 * in this software or its documentation.
 */
package com.suse.manager.webui.controllers.contentmanagement.response;

/**
 * JSON response wrapper for a content filter resume.
 */
public class ProjectFilterResponse {

    private Long id;
    private String name;
    private String entityType;
    private String matcher;
    private String criteriaKey;
    private String criteriaValue;
    private String rule;
    private String state;

    public void setId(Long idIn) {
        this.id = idIn;
    }

    public void setMatcher(String matcherIn) {
        this.matcher = matcherIn;
    }

    public void setEntityType(String entityTypeIn) {
        this.entityType = entityTypeIn;
    }

    public void setCriteriaKey(String criteriaKeyIn) {
        this.criteriaKey = criteriaKeyIn;
    }

    public void setCriteriaValue(String criteriaValueIn) {
        this.criteriaValue = criteriaValueIn;
    }

    public void setRule(String ruleIn) {
        this.rule = ruleIn;
    }

    public void setName(String nameIn) {
        this.name = nameIn;
    }

    public void setState(String stateIn) {
        this.state = stateIn;
    }
}
