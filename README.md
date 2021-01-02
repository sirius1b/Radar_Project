## Course Project of ECE570, Winter 2020 @ IIITD
### Group 2: Radar Control

#### Problem Statement/Description
	
	Design a target tracking system for a radar in 3-dimensional space.
	The radar antenna can change its azimuth and elevation angles using
	two servo motors. The moment of inertia for azimuth and elevation
	angle controlling motor is 500 kgm 2 and 600 kgm 2. You have to
	design the radar system that will track the target automatically.


#### Deliverables
	1.A mathematical model of radar and target system.
	2.A control system design.
	3.Demonstration using Simulink and corresponding 3-dimensional animation.

#### System Parameters

| Parameter | Value |
| -----     | ----- |
|Motor viscous friction coefficient|0.1 N.m.s|
|Electromotive force constant|0.01 V/rad/sec|
|Motor torque constant|0.01 N.m/Amp|
|Electric Resistance|1 Ohm|
|Electric Inductance|0.5 H|

#### Obstacle Motion
    Assume the target is taking a horizontal flight at 10km altitude in
    a straight line at an arbitrary direction with a constant velocity
    of 50m/s. Also assume that the tracking system can estimate the
    position of the target (x, y, z coordinates) accurately. Design a 
    controller which can stair the antenna such that the antenna
    maintains the Line of Sight with the target.

<img src="Part_2/3D_Animation.gif">

	Run the "parameters.m" file to load the model parameters into workspace.
	Then Run Radar_Nonlinear_model.slx to simulate the controller. 
	VR block is added to visualise the animiation.

### Documents:
- [Report First Half](../main/Part_1/CNT_project_report.pdf)
- [Report Second Half](../main/Part_2/Report.pdf)