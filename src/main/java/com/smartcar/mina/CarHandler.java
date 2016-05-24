package com.smartcar.mina;


public class CarHandler {

    protected byte[] buffer;
    public int getId(){
        return 4;//直接返回1号ID
        // return buffer[2];
    }
    public int getCommandType() {
        return buffer[2];
    }
    public int getData() {
        return buffer[3];
    }
    public float getGpsLattude(){
        System.out.println("getGpsLattude:"+byte2float(buffer,4));
        return byte2float(buffer,4);}//第4567位为lattude
    public float getGpsLongitude(){return byte2float(buffer,4);}//第891011位为Longitude
    public CarHandler(byte[] buffer) {
        this.buffer = buffer;
    }

    public int getType() {
        return buffer[2];
    }
    /**
     * 字节转换为浮点
     *
     * @param b 字节（至少4个字节）
     * @param index 开始位置
     * @return
     */
    public static float byte2float(byte[] b, int index) {
        int l;
        l = b[index + 0];
        l &= 0xff;
        l |= ((long) b[index + 1] << 8);
        l &= 0xffff;
        l |= ((long) b[index + 2] << 16);
        l &= 0xffffff;
        l |= ((long) b[index + 3] << 24);
        return Float.intBitsToFloat(l);
    }
}

