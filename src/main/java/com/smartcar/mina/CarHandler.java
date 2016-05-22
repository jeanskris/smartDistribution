package com.smartcar.mina;


public class CarHandler {

    protected byte[] buffer;
    public int getId(){
        return 1;//直接返回1号ID
        // return buffer[2];
    }
    public int getCommandType() {
        return buffer[0];
    }
    public int getData() {
        return buffer[1];
    }
    public CarHandler(byte[] buffer) {
        this.buffer = buffer;
    }

    public int getType() {
        return buffer[0];
    }
}

