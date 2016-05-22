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

    private static String HOST = "10.214.143.78";
    private static int PORT = 1111;
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
        try{
            ConnectFuture future = conn.connect(new InetSocketAddress(HOST, PORT));
            future.awaitUninterruptibly();
            session = future.getSession();
            byte[] bytes = {0x30,0x16, 0x01, 0x01, 0x64, 0x00, 0x00, 0x00, 0x00, (byte)0x89};
            session.write(IoBuffer.wrap(bytes));
            Thread.sleep(5000);

        } catch (Exception e) {
            System.out.println("异常:"+e.toString()+"\n details:"+ e.getCause().toString());
        }
        session.close();
        session.getCloseFuture().awaitUninterruptibly();
        conn.dispose();
    }

}
