
package ershad;

import java.util.HashMap;
import java.util.Map;
import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;


@JsonPropertyOrder({
    "@_fa",
    "@ref",
    "@href",
    "@type"
})

public class Link extends BaseProperty{

 
    @JsonProperty("@ref")
    private String ref;
    @JsonProperty("@href")
    private String href;
    @JsonProperty("@type")
    private String type;
    @JsonIgnore
    private final Map<String, Object> additionalProperties = new HashMap<String, Object>();

    
    @JsonProperty("@ref")
    public String getRef() {
        return ref;
    }

    @JsonProperty("@ref")
    public void setRef(String ref) {
        this.ref = ref;
    }

    @JsonProperty("@href")
    public String getHref() {
        return href;
    }

    @JsonProperty("@href")
    public void setHref(String href) {
        this.href = href;
    }

    @JsonProperty("@type")
    public String getType() {
        return type;
    }

    @JsonProperty("@type")
    public void setType(String type) {
        this.type = type;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public boolean NotInit() {
        return href.isEmpty();
    }

}
