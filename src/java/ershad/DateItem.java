package ershad;
import java.io.IOException;
import java.net.URL;
import org.codehaus.jackson.map.ObjectMapper;

public class DateItem extends Thread{
    private Model _m;
    private String _url;

    public DateItem() {
        _m=null;
    }
    
    public DateItem(String url){
        _url = url;
    }
    @Override
    public void run() {
        ObjectMapper mapper = new ObjectMapper();
        Model model=new Model();
        try {
            model = mapper.readValue(new URL(_url), Model.class);
        } catch (IOException ex) {
           
        }
        _m = model;
    }
    public int getResult()
    {
        return Integer.valueOf(_m.getSearchResults().getOpensearchTotalResults());
    }
    public void setURL(String url)
    {
        _url = url;
    }

}
