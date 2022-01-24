
package ershad;

import java.util.HashMap;
import java.util.Map;
import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

/**
 *
 * @author Ershad
 */
@JsonPropertyOrder({
    "@_fa",
    "affilname",
    "affiliation-city",
    "affiliation-country"
})
//ctx
public class Affiliation extends BaseProperty{

    @JsonProperty("affilname")
    private String affilname;
    @JsonProperty("affiliation-city")
    private String affiliationCity;
    @JsonProperty("affiliation-country")
    private String affiliationCountry;
    @JsonIgnore
    private final Map<String, Object> additionalProperties = new HashMap<String, Object>();
    
    @JsonProperty("affilname")
    public String getAffilname() {
        return affilname;
    }

    /**
     *
     * @param affilname
     */
    @JsonProperty("affilname")
    public void setAffilname(String affilname) {
        this.affilname = affilname;
    }

    /**
     *
     * @return
     */
    @JsonProperty("affiliation-city")
    public String getAffiliationCity() {
        return affiliationCity;
    }

    /**
     *
     * @param affiliationCity
     */
    @JsonProperty("affiliation-city")
    public void setAffiliationCity(String affiliationCity) {
        this.affiliationCity = affiliationCity;
    }

    /**
     *
     * @return
     */
    @JsonProperty("affiliation-country")
    public String getAffiliationCountry() {
        return affiliationCountry;
    }

    /**
     *
     * @param affiliationCountry
     */
    @JsonProperty("affiliation-country")
    public void setAffiliationCountry(String affiliationCountry) {
        this.affiliationCountry = affiliationCountry;
    }

    /**
     *
     * @return
     */
    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    /**
     *
     * @param name
     * @param value
     */
    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public boolean NotInit() {
       return affilname.isEmpty() || affiliationCity.isEmpty() || affiliationCountry.isEmpty();
    }

}
