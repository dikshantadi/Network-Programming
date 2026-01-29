import matplotlib.pyplot as plt
import random
import time

#first PID parameters 
kp = 10.0
ki = 0.1
kd = 0.05

#tcp parameters
cwnd = 1.0
target_rtt = 100
min_rtt = 50
dt = 1.0
integral = 0.0
prev_error = 0.0 

time_steps = []
cwnd_values = []
rtt_values = []

for t in range(100):

    rtt_measured = min_rtt + cwnd * 2 + random.uniform(1, 5)
    error = target_rtt - rtt_measured
    integral += error * dt
    derivative = (error - prev_error) / dt
    control = kp * error + ki * integral + kd * derivative

    cwnd += control * 0.01
    cwnd = max(1.0, cwnd)

    time_steps.append(t)
    cwnd_values.append(cwnd)
    rtt_values.append(rtt_measured)

    prev_error = error

plt.plot(time_steps, cwnd_values, label="Congestion Window (cwnd)")
plt.plot(time_steps, rtt_values, label="Measured RTT")
plt.axhline(target_rtt, linestyle='--', label="Target RTT")
plt.xlabel("Time (steps)")
plt.ylabel("Value")
plt.title("PID-based TCP Congestion Control Simulation")
plt.legend()
plt.grid()
plt.show()

