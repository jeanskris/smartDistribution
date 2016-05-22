package com.smartcar.mina;

import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.InetSocketAddress;

@Component("tcpAddress")
public class ServerIpTCP extends InetSocketAddress {
    public ServerIpTCP() {
        super("114.215.144.107", 1111);
    }//aliyun
//    public ServerIpTCP() {
//        super("10.214.143.78", 1111);
//    } localhost
    public ServerIpTCP(InetAddress add, int port) {
        super(add, port);
    }
}
