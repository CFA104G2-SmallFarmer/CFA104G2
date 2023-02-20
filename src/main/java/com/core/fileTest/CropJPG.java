package com.core.fileTest;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;

public class CropJPG {

    public static void main(String[] args) {
        try {
            // Read the original JPG image
            File inputFile = new File("C:\\Users\\kwz50\\Downloads\\raw_image.jpg");
            BufferedImage image = ImageIO.read(inputFile);

            // Get the image writer for JPG format
            ImageWriter jpgWriter = ImageIO.getImageWritersByFormatName("jpg").next();

            // Set the compression quality
            ImageWriteParam jpgWriteParam = jpgWriter.getDefaultWriteParam();
            jpgWriteParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
            // jpgWriteParam.setCompressionQuality(0.75f);
            jpgWriteParam.setCompressionQuality(1.00f);

            // Save the image to the target directory with the specified compression quality
            File outputFile = new File("C:\\Users\\kwz50\\Downloads\\jpgtest\\raw_image075.jpg");
            FileImageOutputStream outputStream = new FileImageOutputStream(outputFile);
            jpgWriter.setOutput(outputStream);

            // Apply circular crop to the image
            int width = image.getWidth();
            int height = image.getHeight();
            int diameter = Math.min(width, height);
            int x = (width - diameter) / 2;
            int y = (height - diameter) / 2;

            BufferedImage circularImage = new BufferedImage(diameter, diameter, BufferedImage.TYPE_INT_RGB);
            circularImage.createGraphics().drawImage(image, 0, 0, diameter, diameter, x, y, x + diameter, y + diameter, null);

            // Write the circular image to the target directory
            jpgWriter.write(null, new javax.imageio.IIOImage(circularImage, null, null), jpgWriteParam);

            // jpgWriter.write(null, new javax.imageio.IIOImage(image, null, null), jpgWriteParam);

            // Close the output stream
            outputStream.close();

            System.out.println("Image saved successfully with compression quality 0.75");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
