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
public interface IUrl {
    
    //Setter

    void SetNextUrl(String url);

    void SetPreUrl(String url);

    void SetFirstUrl(String url);

    void SetLastUrl(String url);

    //Geter
    String GetNextUrl();

    String GetPreUrl();

    String GetFirstUrl();

    String GetLastUrl();

}
