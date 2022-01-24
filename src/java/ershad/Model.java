
package ershad;

import java.util.HashMap;
import java.util.Map;
import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;


@JsonPropertyOrder({
    "search-results"
})
public class Model extends BaseProperty{
   
    public Model(){}
    
    
    @JsonProperty("search-results")
    private SearchResults searchResults;
    
    @JsonIgnore
    private final Map<String, Object> additionalProperties = new HashMap<String, Object>();
    
    @JsonProperty("search-results")
    public SearchResults getSearchResults() {
        return searchResults;
    }

    @JsonProperty("search-results")
    public void setSearchResults(SearchResults searchResults) {
        this.searchResults = searchResults;
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
        return false;
    }

}
