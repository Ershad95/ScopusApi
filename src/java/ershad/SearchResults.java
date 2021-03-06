package ershad;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import org.codehaus.jackson.annotate.JsonAnyGetter;
import org.codehaus.jackson.annotate.JsonAnySetter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonPropertyOrder({
    "opensearch:totalResults",
    "opensearch:startIndex",
    "opensearch:itemsPerPage",
    "opensearch:Query",
    "link",
    "entry"
})

public class SearchResults {

    @JsonProperty("opensearch:totalResults")
    private String opensearchTotalResults;
    @JsonProperty("opensearch:startIndex")
    private String opensearchStartIndex;
    @JsonProperty("opensearch:itemsPerPage")
    private String opensearchItemsPerPage;
    @JsonProperty("opensearch:Query")
    private OpensearchQuery opensearchQuery;
    @JsonProperty("link")
    private List<Link> navigation = null;
    @JsonProperty("entry")
    private List<Entry> entry = null;
    @JsonIgnore
    private final Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("opensearch:totalResults")
    public String getOpensearchTotalResults() {
        return opensearchTotalResults;
    }

    @JsonProperty("opensearch:totalResults")
    public void setOpensearchTotalResults(String opensearchTotalResults) {
        this.opensearchTotalResults = opensearchTotalResults;
    }

    @JsonProperty("opensearch:startIndex")
    public String getOpensearchStartIndex() {
        return opensearchStartIndex;
    }

    @JsonProperty("opensearch:startIndex")
    public void setOpensearchStartIndex(String opensearchStartIndex) {
        this.opensearchStartIndex = opensearchStartIndex;
    }

    @JsonProperty("opensearch:itemsPerPage")
    public String getOpensearchItemsPerPage() {
        return opensearchItemsPerPage;
    }

    @JsonProperty("opensearch:itemsPerPage")
    public void setOpensearchItemsPerPage(String opensearchItemsPerPage) {
        this.opensearchItemsPerPage = opensearchItemsPerPage;
    }

    @JsonProperty("opensearch:Query")
    public OpensearchQuery getOpensearchQuery() {
        return opensearchQuery;
    }

    @JsonProperty("opensearch:Query")
    public void setOpensearchQuery(OpensearchQuery opensearchQuery) {
        this.opensearchQuery = opensearchQuery;
    }

    @JsonProperty("link")
    public List<Link> getLink() {
        return navigation;
    }

    @JsonProperty("link")
    public void setLink(List<Link> link) {
        this.navigation = link;
    }

    @JsonProperty("entry")
    public List<Entry> getEntry() {
        return entry;
    }

    @JsonProperty("entry")
    public void setEntry(List<Entry> entry) {
        int id = 0;
        for (ershad.Entry item : entry) {
            switch (item.getSubtype()) {
                case "ar":
                    item.setSubtype("??????????");
                    break;
                case "ab":
                    item.setSubtype("?????????? ??????????");
                    break;
                case "ip":
                    item.setSubtype("??????????");
                    break;
                case "bk":
                    item.setSubtype("????????");
                    break;
                case "bz":
                    item.setSubtype("?????????? ??????????");
                    break;
                case "ch":
                    item.setSubtype("?????????? ???? ????????");
                    break;
                case "cp":
                    item.setSubtype("??????????????");
                    break;
                case "cr":
                    item.setSubtype("??????????????");
                    break;
                case "ed":
                    item.setSubtype("???????????? ??????");
                    break;
                case "le":
                    item.setSubtype("????????");
                    break;
                case "no":
                    item.setSubtype("?????? ??????????");
                    break;
                case "Press Release":
                    item.setSubtype("???????? ????????????????");
                    break;
                case "Review":
                    item.setSubtype("????????");
                    break;
                case "sh":
                    item.setSubtype("???????? ??????????");
                    break;
            }
            item.setID(++id);
        }
        this.entry = entry;
    }
    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

}
