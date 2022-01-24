/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ershad;

/**
 *
 * @author Ershad
 */
public class Navigation extends Link implements IUrl {

   private String _nextUrl;
   private String _prevUrl;
   private String _lastUrl;
   private String _firstUrl;

    public Navigation() {
        _firstUrl = new String();
        _lastUrl = new String();
        _prevUrl = new String();
        _nextUrl = new String();
    }

    @Override
    public void SetNextUrl(String url) {
        _nextUrl = url.substring(45);
        if (!_nextUrl.contains("&pagin=1")) {
            _nextUrl = _nextUrl + "&pagin=1";
        }
    }

    @Override
    public void SetPreUrl(String url) {
        _prevUrl = url.substring(45);
        if (!_prevUrl.contains("&pagin=1")) {
            _prevUrl = _prevUrl + "&pagin=1";
        }
    }

    @Override
    public void SetFirstUrl(String url) {
        _firstUrl = url.substring(45);
        if (!_firstUrl.contains("&pagin=1")) {
            _firstUrl = _firstUrl + "&pagin=1";
        }
    }

    @Override
    public void SetLastUrl(String url) {
        _lastUrl = url.substring(45);
        if (!_lastUrl.contains("&pagin=1")) {
            _lastUrl = _lastUrl + "&pagin=1";
        }
    }

    @Override
    public String GetNextUrl() {
        return _nextUrl;
    }

    @Override
    public String GetPreUrl() {
        return _prevUrl;
    }

    @Override
    public String GetFirstUrl() {
        return _firstUrl;
    }

    @Override
    public String GetLastUrl() {
        return _lastUrl;
    }

    @Override
    public boolean NotInit() {
        return _firstUrl.isEmpty() || _lastUrl.isEmpty();
    }
}
