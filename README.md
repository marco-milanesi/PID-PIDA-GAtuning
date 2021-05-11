# PID and PIDA Controllers

* * * 

## Run the program
To run the program launch the UserInterface.m in the command window.

## Documentation

In this program we implement Genetic Algorithm (GA) in determing PID, PI-D, I-PD and PIDA controllers parameters to compensate different benchmark systems.
  
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

## Lower and upper bound

|      Controller              |      Values    |
| :---------------------------:|:--------------------------------------:|
| Proportional Action         |![Kp](https://latex.codecogs.com/gif.latex?Kp%20%3D%5Cleft%20%5B%200.001%20%5C%3A%2010%20%5Cright%20%5D)|
| Integral Action         |![Ti](https://latex.codecogs.com/gif.latex?Ti%20%3D%5Cleft%20%5B%200.1%20%5C%3A%20500%20%5Cright%20%5D)|
| Derivative Action        |![Td](https://latex.codecogs.com/gif.latex?Td%20%3D%5Cleft%20%5B%200.00001%20%5C%3A%2010%20%5Cright%20%5D)|
| Second Derivative Action       |![Ta](https://latex.codecogs.com/gif.latex?Ta%20%3D%5Cleft%20%5B%200.00001%20%5C%3A%2010%20%5Cright%20%5D)|
|Filter of Derivative Action       |![N](https://latex.codecogs.com/gif.latex?N%3D%5Cleft%20%5B%203%20%5C%3A%2033%20%5Cright%20%5D)|
| Filter of the Second Derivative Action       |![alpha](https://latex.codecogs.com/gif.latex?%5Calpha%20%3D%5Cleft%20%5B%203%20%5C%3A%2033%20%5Cright%20%5D)|


## Explanation of the program
> A simple explanation of the user interface of the programme and which parameters it calculates.

- After launching the program, select the Benchsmark system you want to compensate and the GA calculates the objective function IAE.


- The Program will display the reference tracking and disturbance rejection og the four controllers and the system you have selected.

- The program will also export an Excel file in the same folder of the program with step informations such as Rise time, settling time, and other step-response characteristics.

## Type of Controllers

### PID Controller
-------------------------------------------------

![](data/image/PID%20-%20PIDA%20Controller.png)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C%28s%29%3D%20K_%7Bp%7D%5Cleft%20%28%201&plus;%5Cfrac%7B1%7D%7BsT_%7Bi%7D%7D%20&plus;%5Cfrac%7BsT_%7Bd%7D%7D%7B1&plus;%5Cfrac%7BT_%7Bd%7D%7D%7BN%7Ds%7D%20%5Cright%20%29)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BY%7D%7BY_%7Bsp%7D%7D%20%3D%20%5Cfrac%7BGC%7D%7B1&plus;GC%7D)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BY%7D%7BD%7D%20%3D%20%5Cfrac%7BG%7D%7B1&plus;GC%7D)

### PI-D Controller
-------------------------------------------------
Proportional and Integral action is applied to the control error while Derivative action is applied to the process variable.

![](data/image/PI-D-Controller.png)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B1%7D%28s%29%3D%20K_%7Bp%7D)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B2%7D%28s%29%3D%20%5Cfrac%7BK_%7Bp%7D%7D%7BsT_%7Bi%7D%7D)

![](https://latex.codecogs.com/gif.latex?C_3%28s%29%3D%20%5Cfrac%7Bs%5C%2CT_d%5C%2CK_p%7D%7B%201&plus;%20%5Cfrac%7BT_d%7D%7BN%7Ds%7D)

![](https://latex.codecogs.com/gif.latex?%5Cfrac%7BY%7D%7BY_%7Bsp%7D%7D%3D%20%5Cfrac%7B%28C_1%20&plus;%20C_2%29%5C%2CG%7D%7B1&plus;%20G%5C%2C%28C_1%20&plus;%20C_2%20&plus;%20C_3%29%7D)

![](https://latex.codecogs.com/gif.latex?%5Cfrac%7BY%7D%7BD%7D%3D%20%5Cfrac%7BG%7D%7B1&plus;%20%28C_1%20&plus;%20C_2%20&plus;%20C_3%29%20G%7D)


### I-PD Controller
-------------------------------------------------
Integral action is applied to the control error while Proportional and Derivative action is applied to the process variable.

![](data/image/I-PD-Controller.png)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B1%7D%28s%29%3D%5Cfrac%7BK_%7Bp%7D%7D%7BsT_%7Bi%7D%7D)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20C_%7B2%7D%28s%29%3DK_%7Bp%7D%20%5Cleft%20%28%201&plus;%5Cfrac%7BT_%7Bd%7Ds%7D%7B1&plus;%5Cfrac%7BT_%7Bd%7D%7D%7BN%7Ds%7D%20%5Cright%20%29)


![](https://latex.codecogs.com/gif.latex?%5Cfrac%7BY%7D%7BY_%7Bsp%7D%7D%3D%20%5Cfrac%7BC_1%20%5C%2CG%7D%7B1&plus;%20%28C_1%20&plus;%20C_2%29%20G%7D)


![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BY%7D%7BD%7D%3D%5Cfrac%7BG%7D%7B1&plus;G%28C_%7B1%7D&plus;C_%7B2%7D%29%7D)



### PIDA Controller
-------------------------------------------------
![](data/image/PID%20-%20PIDA%20Controller.png)

![](https://latex.codecogs.com/gif.latex?C%28s%29%3D%20K_p%20%5Cleft%20%28%201%20&plus;%20%5Cfrac%7B1%7D%7BsT_i%7D&plus;%20%5Cfrac%7BsT_d%7D%7B1&plus;%5Cfrac%7BT_d%7D%7BN%7D%7D&plus;%20%5Cfrac%7Bs%5E2T_a%7D%7B%5Cleft%20%28%201%20&plus;%20%5Cfrac%7BsT_a%7D%7B%5Calpha%20%7D%20%5Cright%20%29%5E2%7D%20%5Cright%20%29)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BY%7D%7BY_%7Bsp%7D%7D%20%3D%20%5Cfrac%7BGC%7D%7B1&plus;GC%7D)

![](https://latex.codecogs.com/gif.latex?%5Cdpi%7B120%7D%20%5Cfrac%7BY%7D%7BD%7D%20%3D%20%5Cfrac%7BG%7D%7B1&plus;GC%7D)


## Team


| <a href="https://marcomilanesi.com/" target="_blank">**Marco Milanesi**</a> | <a href="https://github.com/EdoGitMira" target="_blank">**Edoardo Mirandola**</a> |
| :---: |:---:|
| [![MarcoMilanesi](https://avatars.githubusercontent.com/u/47824890?v=3&s=200)](https://marcomilanesi.com/)  | [![Mirandola Edoardo]()](https://github.com/EdoGitMira)  |
| <a href="https://github.com/marco-milanesi" target="_blank">`github.com/marco-milanesi`</a> | <a href="https://github.com/EdoGitMira" target="_blank">`github.com/EdoGitMira`</a> |
