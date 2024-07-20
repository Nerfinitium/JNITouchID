public class TouchID {
    // Native method declaration
    public native boolean authenticate();

    // Load the native library
    static {
        System.loadLibrary("TouchIDNative");
    }

    public static void main(String[] args) {
        TouchID touchID = new TouchID();
        boolean authenticated = touchID.authenticate();
        System.out.println("Authenticated: " + authenticated);
    }
}
