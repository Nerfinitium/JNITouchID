public class TouchID {
    public native boolean authenticate();

    static {
        System.loadLibrary("TouchIDNative");
    }

    public static void main(String[] args) {
        TouchID touchID = new TouchID();
        boolean authenticated = touchID.authenticate();
        System.out.println("Authenticated: " + authenticated);
    }
}
