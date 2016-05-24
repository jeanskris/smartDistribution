package com.smartcar.mina;

import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.future.ConnectFuture;
import org.apache.mina.core.service.IoConnector;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.filter.logging.MdcInjectionFilter;
import org.apache.mina.transport.socket.nio.NioSocketConnector;

import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.charset.Charset;

/**
 * Created by ZJDX on 2016/5/24.
 */
public class TcpClient extends IoHandlerAdapter {
    private IoConnector connector;
    private static IoSession session;
    private SocketAddress address;

    public boolean send(Object message) {
        if (session != null && session.isConnected()) {
            throw new IllegalStateException(
                    "Already connected. Disconnect first.");
        }
        connector = new NioSocketConnector();
        try {
            connector.getFilterChain().addLast("codec",
                    new ProtocolCodecFilter(new TextLineCodecFactory(Charset.forName("UTF-8"))));
            connector.setHandler(this);
            address=new InetSocketAddress("10.214.143.78", 5555);
            ConnectFuture future1 = connector.connect(address);
            future1.awaitUninterruptibly();
            if (!future1.isConnected()) {
                System.out.println("!future1.isConnected");
                return false;
            }
            session = future1.getSession();
            session.write(message);
            System.out.println("TCP write");
            session.close();
            session.getCloseFuture().awaitUninterruptibly();
            connector.dispose();
            return true;
        }
        catch (Exception e) {
            connector.dispose();
            System.out.println("异常:" + e.toString() + "\n details:" + e.getCause().toString());
            return false;
        }
    }

    @Override
    public void sessionOpened(IoSession session) throws Exception {
        System.out.println("sessionOpened 客户端: " + session.getRemoteAddress());
        super.sessionOpened(session);
    }

    @Override
    public void exceptionCaught(IoSession session, Throwable cause)
            throws Exception {
        cause.printStackTrace();
        super.exceptionCaught(session, cause);
    }

    // 当客户端发送消息到达时
    @Override
    public void messageReceived(IoSession session, Object message)
            throws Exception {

        System.out.println("服务器返回的数据：" + message.toString());
    }
    @Override
    public void sessionIdle(IoSession iosession, IdleStatus idlestatus)
            throws Exception {
        System.out.println("sessionIdle");
        super.sessionIdle(iosession, idlestatus);
    }

    @Override
    public void sessionCreated(IoSession session) throws Exception {
        super.sessionCreated(session);
        System.out.println("client created a session: " + session.getRemoteAddress());
    }
    @Override
    public void sessionClosed(IoSession session) throws Exception {
        System.out.println("client sessionClosed");
    }

}