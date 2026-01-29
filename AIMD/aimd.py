import random
import matplotlib.pyplot as plt

def simulate_aimd(cwid, max_time, prob):
    cwid_values = []
    
    for _ in range(max_time):
        congestion = random.random() < prob
        if congestion:
            cwid = max(1, cwid / 2) #multiplicative decrease
        else:
            cwid += 1 
        cwid_values.append(cwid) #addictive increase 

    plt.plot(range(max_time), cwid_values)
    plt.xlabel('Time')
    plt.ylabel('Congestion Window Size (cwid)')
    plt.title('AIMD Congestion Control Simulation')
    plt.grid()
    plt.show()

if __name__ == "__main__":
    simulate_aimd(cwid=1, max_time=500, prob=0.07)