package com.smartcar.mina;

import com.smartcar.service.interfaces.ICarInfoService;
import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("tcpServerHandler")
public class TCPServerHandler extends IoHandlerAdapter {

    @Autowired
    ICarInfoService carInfoService;
    @Override
    public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
        cause.printStackTrace();
        super.exceptionCaught(session, cause);
    }

    @Override
    public void messageReceived(IoSession session, Object message) throws Exception {
        if (message instanceof IoBuffer) {
            IoBuffer buffer = (IoBuffer) message;
            System.out.println(buffer.toString());
            buffer.setAutoShrink(true);
            buffer.setAutoExpand(true);
            byte[] bytes = new byte[buffer.limit()];
            buffer.get(bytes);
            if(bytes[0]==0x30) {
                carInfoService.updatePower(bytes);//调用service业务处理
            }
        }
    }

    @Override
    public void messageSent(IoSession session, Object message) throws Exception {
        super.messageSent(session, message);
        System.out.println("data has been sent to client");
    }

    @Override
    public void sessionCreated(IoSession session) throws Exception {
        super.sessionCreated(session);
        System.out.println("Server created a session: " + session.getRemoteAddress());
    }
}
