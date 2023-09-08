<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="README_images/PID_GA_tuning_logo.png" alt="Logo" width="30%">
    <h1 align="center">PID GA Tuning Toolbox</h3>
  </a>

[![View PID GA Tuning Toolbox on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://it.mathworks.com/matlabcentral/fileexchange/134971-pid-ga-tuning-toolbox)
![GitHub top language](https://img.shields.io/github/languages/top/marco-milanesi/PID-PIDA-GAtuning)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/marco-milanesi/PID-PIDA-GAtuning)
  

  <p align="center">
    PID, PI-D, I-PD and PIDA genetic algorithm parameters optimization made easy with this GUI!
    <br />
    <a href="#documentation"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#demo">View Demo</a>
    ·
    <a href=">Report Bug</a>
    ·
    <a href="">Request Feature</a>
  </p>
</div>




![final_gui](https://github.com/marco-milanesi/PID-PIDA-GAtuning/assets/47824890/939604b2-0b56-4314-8087-ebadf6ae8aef)


* * * 

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about">About</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



## About
The PID GA Tuning Toolbox is a powerful tool for tuning the parameters of PID, PI-D, I-PD, and PIDA controllers using genetic algorithms. It has been extensively used in the development of the article titled [A comparison between PID and PIDA](https://ieeexplore-ieee-org.proxy.unibs.it/document/9921724). 

The tuning of the controllers is determined with genetic algorithms by minimizing the integrated absolute error. Both the set-point following and load disturbance rejection tasks can be selected separately. In order to provide a fair comparison, a constraint on the maximum sensitivity is also posed, by selecting between 1.4 and 2 so that the achieved robustness is taken into account.


The **PID GA Tuning Toolbox** is a valuable resource for achieving optimal controller performance and robustness. It provides a basis for conducting comparative studies, as demonstrated in the referenced article.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Features
The PID GA Tuning Toolbox includes the following features:

- **Controller Selection:** Choose from four different controllers.
- **Control Task:** Opt for either setpoint following or load disturbance rejection.
- **Process Compatibility:** Compatible with any type of process.
- **User-Friendly GUI:** Utilize a simple graphical user interface (GUI) to visualize simulation results, including process variable, control action, Bode plot, and Sensitivity plot.
- **Result Evaluation:** Easily assess step response and Bode plot characteristics for effective tuning.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
  
## MATLAB® Toolbox Installation
Follow the steps below to install _FEATool_ as a MATLAB® toolbox, and
to enable running MATLAB® simulation m-scripts

1) Download the
   [GA_PID_tuning.mlappinstall](https://github.com/marco-milanesi/PID-PIDA-GAtuning/blob/main/src/GA_PID_tuning.mlappinstall)
   toolbox installation file.

2) Then start MATLAB®, press the **APPS** toolbar button,
   and select the **Install App** button.

3) When prompted to choose a toolbox file to install, select the
   **GA_PID_tuning.mlappinstall** file and press **OK**.

4) Press the **Install** button if prompted to _"Install to My Apps"_.

Once the toolbox has been installed, an app icon will be available in
the _APPS_ toolbar to start the _GA_PID_tuning_ GUI. (Note that MATLAB® may
not show or indicate the toolbox installation progress
or completion.)

![installation](https://github.com/marco-milanesi/PID-PIDA-GAtuning/assets/47824890/6cb693f4-b51a-4e83-a242-c6b1eeeb633a)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Basic Use

To effectively utilize the PID GA Tuning Toolbox, follow these simple steps:

1. **Controller Selection:** Choose the type of controllers you want to tune.

2. **Process Model:** Insert the process model by separating each coefficient with a comma and press the `Insert Transfer Function`. You can verify your transfer function to ensure correct insertion.

3. **Maximum Sensitivity:** Select the maximum sensitivity between *1.4* and *2* for enhanced robustness.

4. **Task Optimization:** Choose your task optimization between *Setpoint Following* and *Load Disturbance Rejection* based on your control requirements.

5. **Algorithm Parameters:** Configure the *Population Size* and the *Maximum Generation* as needed for your tuning process.

6. **Start Simulation:** Finally, press `Start Simulation` to begin the tuning process.

These straightforward steps will help you make the most of the PID GA Tuning Toolbox for your controller parameter optimization needs.

* * * 
### Demo



https://github.com/marco-milanesi/PID-PIDA-GAtuning/assets/47824890/489f6ea7-64fc-49e9-8be6-e7ddbec05fe6





<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See <a href=https://github.com/marco-milanesi/PID-PIDA-GAtuning/blob/main/LICENSE>`LICENSE.txt`</a>  for more information.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

- Marco Milanesi - <a href = "mailto: marco.milanesi.99@gmail.com">marco.milanesi.99@gmail.com</a>
- Edoardo Mirandola - <a href = "mailto: e.mirandola@studenti.unibs.it">e.mirandola@studenti.unibs.it</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Documentation

| IAE function | Cost Addition Function |
|:-----:|:-----:|
| ![pseduo1](https://github.com/marco-milanesi/PID-PIDA-GAtuning/assets/47824890/4437297b-8d1b-4a37-8b58-3986f28e04ab) |  ![pseduo2](https://github.com/marco-milanesi/PID-PIDA-GAtuning/assets/47824890/64f18614-efac-429f-be2a-0267cfaed905)
|


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


