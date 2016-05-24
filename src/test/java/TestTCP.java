import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.future.ConnectFuture;
import org.apache.mina.core.service.IoConnector;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.transport.socket.nio.NioSocketConnector;

import java.net.InetSocketAddress;

/**
 * Created by ZJDX on 2016/5/20.
 */

public class TestTCP {

//    private static String HOST = "114.215.144.107 ";
    private static String HOST = "10.214.143.78 ";
    private static int PORT = 5555;
    static public class MinaClientHandler extends IoHandlerAdapter {
        @Override
        public void sessionCreated(IoSession session) throws Exception {
//            super.sessionCreated(session);
            System.out.println("Session created");
        }

        @Override
        public void messageReceived(IoSession session, Object message) throws Exception {
            super.messageReceived(session, message);
            System.out.println("message Received" + message.toString());
        }

        @Override
        public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
            super.exceptionCaught(session, cause);
        }

    }

    public static void main(String[] args) {
        IoConnector conn = new NioSocketConnector();
        conn.setConnectTimeoutMillis(3000l);

        conn.setHandler(new MinaClientHandler());
        IoSession session = null;
        for(int i=0;i<20;i++) {
            try {
                ConnectFuture future = conn.connect(new InetSocketAddress(HOST, PORT));
                future.awaitUninterruptibly();
                session = future.getSession();
                Byte power=(byte)i;
                byte[] GpsLattude=float2byte((float)0.01);//4 bytes
                byte[] GpsLongitude=float2byte((float)0.01);
                byte[] bytes = { 0x01, 0x64,0x30,power, GpsLattude[0],GpsLattude[1],GpsLattude[2],GpsLattude[3],  GpsLongitude[0],GpsLongitude[1],GpsLongitude[2],GpsLongitude[3]};
                session.write(IoBuffer.wrap(bytes));
                System.out.println("power sended:"+power);
                Thread.sleep(10000);
            } catch (Exception e) {
                System.out.println("异常:" + e.toString() + "\n details:" + e.getCause().toString());
            }
        }
        session.close();
        session.getCloseFuture().awaitUninterruptibly();
        conn.dispose();
    }
    /**
     * 浮点转换为字节
     *
     * @param f
     * @return
     */
    public static byte[] float2byte(float f) {

        // 把float转换为byte[]
        int fbit = Float.floatToIntBits(f);

        byte[] b = new byte[4];
        for (int i = 0; i < 4; i++) {
            b[i] = (byte) (fbit >> (24 - i * 8));
        }

        // 翻转数组
        int len = b.length;
        // 建立一个与源数组元素类型相同的数组
        byte[] dest = new byte[len];
        // 为了防止修改源数组，将源数组拷贝一份副本
        System.arraycopy(b, 0, dest, 0, len);
        byte temp;
        // 将顺位第i个与倒数第i个交换
        for (int i = 0; i < len / 2; ++i) {
            temp = dest[i];
            dest[i] = dest[len - i - 1];
            dest[len - i - 1] = temp;
        }

        return dest;

    }
}
