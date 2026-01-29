AIMD (Addictive Increase and Multiplicative Decrease ) Algorithm simulation

AIMD is a feedback control algorithm, it is used by TCP protocols in the transport layer of the TCP/IP stack.
It controls the growth of congestion window with extreme care such that chances of further congestion are the least. The congestion window (cwnd) is increased by ‘one’ segment ‘per’ RTT, this is the AI phase. The cwnd is decreased by ‘half’ on detecting a packet loss, this is the MD phase. 