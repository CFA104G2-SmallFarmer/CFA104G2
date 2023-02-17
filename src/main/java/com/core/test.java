package com.core;

import javax.imageio.ImageIO;
import javax.imageio.ImageWriter;
import javax.imageio.plugins.jpeg.JPEGImageWriteParam;
import javax.imageio.ImageWriteParam;
import javax.imageio.plugins.jpeg.JPEGQTable;
import javax.imageio.stream.FileImageOutputStream;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;

public class test {
    public static void main(String args[]) throws IOException {
        // Create a new file to store the JPEG image
        File outputFile = new File("certificates1.jpg");
//        System.out.println(outputFile);
        // Get the input file
        BufferedImage inputBufferedImage = ImageIO.read(new File("certificates.jpg"));
        // Get the image writer for JPG format
        ImageWriter jpgWriter = ImageIO.getImageWritersByFormatName("jpg").next();
        // Set the compression quality
        JPEGImageWriteParam jpgWriteParam = (JPEGImageWriteParam) jpgWriter.getDefaultWriteParam();
        jpgWriteParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
        //set the compresion Quality at 1.00f
        jpgWriteParam.setCompressionQuality(0.97f);
        // Save the image to the target directory with the specified compression quality
        // Create custom quantization tables for luminance (Y) and chrominance (CbCr)

//        所以這個QTABLE是寫進metadata裡的
//        com/sun/imageio/plugins/jpeg/JPEG.java - JPEG.convertToLinearQuality (在這裡對quality先做線性轉換，太小或超過範圍的值都要處理一下)
//        com/sun/imageio/plugins/jpeg/DQTMarkerSegment.java - Qtable.Qtable(boolean, float)(這裡先做出來Qtable物件，之後寫到metadata裡)
//        javax/imageio/plugins/jpeg/JPEGQTable.java - JPEGQTable.getScaledInstance (用來轉換的quality數值從這裡對預設的矩陣做變換)
//        com.sun.imageio.plugins.jpeg - JPEG.getDefaultQTables(預設矩陣從這取JPEGQTable.K1Div2Luminance, JPEGQTable.K2Div2Chrominance;)

        FileImageOutputStream outputStream = new FileImageOutputStream(outputFile);
        jpgWriter.setOutput(outputStream);
        jpgWriter.write(null, new javax.imageio.IIOImage(inputBufferedImage, null, null), jpgWriteParam);
        System.out.println(Arrays.toString(jpgWriteParam.getQTables()));
        outputStream.close();

//        JPEGImageWriteParam jpgWriteParam2 = (JPEGImageWriteParam) jpgWriteParam;
//        System.out.println(jpgWriteParam2.getQTables());
//        // Get the quantization table for luminance (Y)
//        JPEGQTable qTableLuminance =  jpgWriteParam2.getQTables()[0];
//        // Get the quantization table for chrominance (CbCr)
//        JPEGQTable qTableChrominance =  jpgWriteParam2.getQTables()[1];
    }
}
