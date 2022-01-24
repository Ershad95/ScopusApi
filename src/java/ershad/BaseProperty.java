/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ershad;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 *
 * @author Ershad
 */
public abstract class BaseProperty {

    @JsonProperty("@_fa")
    private String fa;

    @JsonProperty("@_fa")
    public String getFa() {
        return fa;
    }

    @JsonProperty("@_fa")
    public void setFa(String fa) {
        this.fa = fa;
    }

    public abstract boolean NotInit();

}
