package com.core.fileTest;

import java.io.*;

public class CopyFile {
    public static void main(String[] args)
            throws IOException {

        File original = new File("C:\\Users\\kwz50\\Downloads\\giphy.gif");
        File copied = new File("C:\\Users\\kwz50\\Downloads\\giphy2.gif");
        try (
                InputStream in = new BufferedInputStream(new FileInputStream(original));
                OutputStream out = new BufferedOutputStream(new FileOutputStream(copied)))
        {
                    byte[] buffer = new byte[1024];
                    int lengthRead;
                    while ((lengthRead = in.read(buffer)) > 0) {
                        out.write(buffer, 0, lengthRead);
                        out.flush();
            }
        }
    }
}
