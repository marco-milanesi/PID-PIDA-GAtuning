# PID and PIDA Controllers

## Run the program
To run the program launch the figure in the command window.

## Documentation

In this program we implement Genetic Algorithm (GA) in determing PID and PIDA controllers parameters to compensate different benchmark systems.
  
|      Benchmark Systems       |      Transfer Function  G(s)     |
| -----------------------------|:--------------------------------------:|
| Multiple Equal Poles         |![ Multiple Equal Poles](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7Bs&plus;1%7D)|
| Fourth Order System          | ![Fourth Order System](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B%28s&plus;1%29%281&plus;0.1s%29%281&plus;0.1%5E%7B2%7Ds%29%281&plus;0.1%5E%7B3%7Ds%29%7D)    | 
| Right Half Plane Zero        | ![Right Half Plane Zero ](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1-0.1s%7D%7B%28s&plus;1%29%5E3%7D) |
|   Time Delay and Lag         | ![Time Delay and Lag](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B1&plus;0.1s%7D%20e%5E%7B-s%7D) |
| Time Delay and Double Lag    | ![Time Delay and Double Lag](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B%281&plus;0.1s%29%5E%7B2%7D%7D%20e%5E%7B-s%7D)|
| Fast and Slow modes          |![Fast and Slow modes](https://latex.codecogs.com/gif.latex?%5Cfrac%7B100%7D%7B%28s&plus;10%29%5E%7B2%7D%7D%5Cleft%20%28%20%5Cfrac%7B1%7D%7Bs&plus;1%7D&plus;%5Cfrac%7B0.5%7D%7Bs&plus;0.05%7D%20%5Cright%20%29) |
|Oscillatory System            |![Oscillatory System](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B%28s&plus;1%29%28s%5E%7B2%7D&plus;0.2s&plus;1%29%7D) |
|Unstable Pole                 |![Unstable Pole](https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7Bs%5E%7B2%7D-1%7D)|

## Explanation of the program
> A simple explanation of the user interface of the programme and which parameters it calculates.

- After launching the program, select the Benchsmark system you want to compensate and select the objective function that is used to evaluate fitness of each chromosome.

- The Program will display the step response of feedback system with PID and PIDA controller and the system you have selected.

- The program will also export an Excel file in the same folder of the program with step informations such as Rise time, settling time, and other step-response characteristics.

## Type of Controllers

### PID Controller
-------------------------------------------------

![](Images/PID%20-%20PIDA%20Controller.png)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C%28s%29%3D%20K_%7Bp%7D%5Cleft%20%28%201&plus;%5Cfrac%7B1%7D%7BsT_%7Bi%7D%7D%20&plus;%5Cfrac%7BsT_%7Bd%7D%7D%7B1&plus;%5Cfrac%7BT_%7Bd%7D%7D%7BN%7Ds%7D%20%5Cright%20%29)

### PI-D
-------------------------------------------------
![](Images/PI-D-Controller.png)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B1%7D%28s%29%3D%20K_%7Bp%7D)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B2%7D%28s%29%3D%20%5Cfrac%7BK_%7Bp%7D%7D%7BsT_%7Bi%7D%7D)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B3%7D%28s%29%3D%20K_%7Bp%7D%20&plus;%20%5Cfrac%7BsT_%7Bd%7D%7D%7B1&plus;%5Cfrac%7BT_%7Bd%7D%7D%7BN%7Ds%7D)

### I-PD
-------------------------------------------------
![](Images/I-PD-Controller.png)

### PIDA
-------------------------------------------------
![](Images/PID%20-%20PIDA%20Controller.png)



