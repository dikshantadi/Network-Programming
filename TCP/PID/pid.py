import matplotlib.pyplot as plt

Kp = 5.0             # proportional gain
Ki = 0.55        # integral gain
Kd = 0.1      # derivative gain
setpoint = 10.0          # desired value
pv = 0.0                 # process variable (system output)
dt = 1.0                 # time step
system_gain = 0.1        # how strongly system reacts

integral = 0.0          
prev_error = 0.0

time_steps = []
pv_values = []
control_values = []

# Simulation loop
for t in range(100):
    # 1. Compute error
    error = setpoint - pv

    # 2. PID terms
    integral += error * dt
    derivative = (error - prev_error) / dt

    # 3. Control signal
    control = Kp * error + Ki * integral + Kd * derivative

    # 4. System (plant) response
    pv += control * system_gain

    # 5. Save values
    time_steps.append(t)
    pv_values.append(pv)
    control_values.append(control)

    prev_error = error

# Plot results
plt.plot(time_steps, pv_values, label="Process Variable")
plt.plot(time_steps, control_values, label="Control Signal")
plt.axhline(setpoint, linestyle="--", label="Setpoint")

plt.xlabel("Time")
plt.ylabel("Value")
plt.title("PID Control Simulation")
plt.legend()
plt.grid()
plt.show()
