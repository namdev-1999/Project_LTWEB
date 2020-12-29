package vn.nlu.banana.Util;

public class Util {
    static final String HOST = "http://localhost:8080/ltw/";

    public static String fullPath(String path) {
        return HOST + path;
    }
}
