package ershad;
public class Identity extends BaseProperty implements Iidentity
{

    private int _id;

    public Identity() {
        _id=0;
    }
    
    @Override
    public void setID(int id) {
        _id = id;
    }

    @Override
    public int getID() {
        return _id;
    }


    @Override
    public boolean NotInit() {
        return _id == 0;
    }
    
}
