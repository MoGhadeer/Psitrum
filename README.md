![Image](Psitrum_Documentation/Psitrum_Header.jpeg)


**Psitrum** is an open-source software that allows the user to design, implement and simulate quantum circuits. Then, it gives the user a variety of visualization tools that help to understand and analyze the results. **Psitrum** simulate the process of universal quantum computers. 


You can give this a try.

# Table of Contents
-  [Psitrum Services](#psitrum-services)
-  [Psitrum Repository](#psitrum-repository)
-  [Psitrum Installation](#psitrum-installation)
    * [Standalone App](#psitrum-standalone-app)
    * [MATLAB App](#psitrum-matlab-app)
    * [App Designer](#psitrum-app-designer)
-  [What does Psitrum do?](#what-does-psitrum-do)
-  [Example to start with](#example-to-start-with)
    * [Full Adder Circuit](#full-adder-circuit)
-  [What are the quantum gates provided?](#what-are-the-quantum-gates-provided)
-  [Visit Our Website](#visit-our-website)
-  [Authors](#authors)


## Psitrum Services
**Psitrum** allows the user:
- to design a quantum circuit with as many qubit and as many operations as possible.
- to visualize the output of a quantum circuit
- to introduce different types of noise to quantum circuits
- to provide visualization tools (e.g. Bloch Sphere)
- to trace out the quantum state of each qubit after each stage
- to import and export quantum circuits.

## Psitrum Repository

**Psitrum** repository contains three components:
1. **Psitrum** Installation Files {[Psitrum_Installation](https://github.com/MoGhadeer/Psitrum/tree/main/Psitrum_Installation)}
2. **Psitrum** MATLAB source codes {[Psitrum_Code](https://github.com/MoGhadeer/Psitrum/tree/main/Psitrum_Code)}
3. **Psitrum** documentations and designing files {[Psitrum Documentation](https://github.com/MoGhadeer/Psitrum/tree/main/Psitrum_Documentation)}

## Psitrum Installation
You can download **Psitrum** by three ways:
### Psitrum: Standalone App
This is the easiest method to use **Psitrum**. You can install the app by those steps:
1. Download the Application file {[Psitrum.app](https://github.com/MoGhadeer/Psitrum/tree/main/Psitrum_Installation/Psitrum.app/Contents)} to start directly using **Psitrum**
2. or you can install the app in your computer by downloading the installer file {[Psitrum_Installer.app](https://github.com/MoGhadeer/Psitrum/tree/main/Psitrum_Installation/Psitrum_Installer.app/Contents)}
3. Follow the installation instruction of the installer
4. Start using **Psitrum**

### Psitrum: MATLAB App
By this method you can add **Psitrum** as an App in your MATLAB:
1. Download the MATLAB app installer {[Psitrum.mlappinstall](https://github.com/MoGhadeer/Psitrum/blob/main/Psitrum_Installation/Psitrum.mlappinstall)}
2. Open MATLAB in your computer and go the Apps section
3. Click on "Install App" and chose the downloaded file
4. Now, it will be installed and you can find it in "My Apps" section
5. Run **Psitrum**

### Psitrum: App Designer
You can use this method if you want to access the code of **Psitrum** and start to modify the software:
1. Download the Code file (PsitrumCode) as .zip extension
2. Unzip the file and save it wherever you want
3. Open MATLAB in your computer
4. Change the "Current Folder" into the downloaded file
5. Now, you can find the functions of **Psitrum** and other folders 
6. Open the file (Psitrum.mlapp) to access the App designer of **Psitrum**
7. You can start learning and developing **Psitrum** code

## What does Psitrum do?
**Psitrum** simulates the functionality of a universal quantum computer. The following flow chart shows the location of **Psitrum** in the map of quantum computing.

![Image](Psitrum_Documentation/Quantumsimulatorflowchart.jpeg)

## How to design a Quantum Circuit
**Psitrum** is using a circuit-model or gate-model to design the quantum circuits. This models contains four sections. 
The following figure encapsulates the idea.

![Image](Psitrum_Documentation/Circuitmodelexample.jpeg)

## Example to start with
You can start using **Psitrum** with the following example:

### Full Adder Circuit
![Image](Psitrum_Documentation/FullAdder.jpeg)

## What are the quantum gates provided?
**Psitrum** provide a variety of quantum gate that you can use in your design. Those gates are consistent with the ones that are used in popular simulators (i.e. IBM qiskit).

<img src="Psitrum_Documentation/Gates/0.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/1.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Measure.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/I.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Ctrl.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Space.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Cnot.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/TF.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Swp.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/H.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/X.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Y.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/Z.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/S.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/T.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/DS.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/DT.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/SX.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/DSX.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/RX.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/RY.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/RZ.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/U1.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/U2.jpeg" alt="drawing" style="width:70px;"/>  <img src="Psitrum_Documentation/Gates/U3.jpeg" alt="drawing" style="width:70px;"/>

## Visit Our Website

You can follow our **Psitrum** news and updates on this website: ([Psitrum Website](https://github.com/MoGhadeer/Psitrum.git)).

## Authors

The Authors of **Psitrum** are:
- Mohammed Alghadeer {[GitHub](https://github.com/MoGhadeer)} {Email: Modghadeer@gmail.com}
- Eid Aldawsari {[GitHub](https://github.com/EidFAldawsari)} {Email: EidFAldawsari@gmail.com}
