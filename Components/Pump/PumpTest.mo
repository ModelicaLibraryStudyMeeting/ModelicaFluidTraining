package PumpTest
  import SI = Modelica.SIunits;

  model PumpExample1
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {-84, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT tank(redeclare package Medium = Medium, T = 293.15, nPorts = 2, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {-78, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.PrescribedPump pump1(redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.034, 0.04}, head_nominal = {39.0, 27.0, 22.8}), redeclare function powerCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticPower(V_flow_nominal = {0, 0.034, 0.04}, W_nominal = {5000, 14700, 17000}), N_nominal = 1750, checkValve = true, m_flow_start = 0.0001, use_N_in = true, use_powerCharacteristic = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Vflow1(duration = 10, height = 0.04, offset = 0.001, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {88, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T massflow1(redeclare package Medium = Medium, nPorts = 1, use_m_flow_in = true) annotation(
      Placement(visible = true, transformation(origin = {16, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = -1.0 * pump1.rho_nominal) annotation(
      Placement(visible = true, transformation(origin = {50, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 1750) annotation(
      Placement(visible = true, transformation(origin = {-48, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.PrescribedPump pump2(redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.034, 0.04}, head_nominal = {39.0, 27.0, 22.8}), redeclare function powerCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticPower(V_flow_nominal = {0, 0.034, 0.04}, W_nominal = {5000, 14700, 17000}), N_nominal = 1750, checkValve = true, m_flow_start = 0.0001, use_N_in = true, use_powerCharacteristic = true) annotation(
      Placement(visible = true, transformation(origin = {-24, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T massflow2(redeclare package Medium = Medium, nPorts = 1, use_m_flow_in = true) annotation(
      Placement(visible = true, transformation(origin = {14, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Vflow2(duration = 10, height = 0.04, offset = 0.001, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {88, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain2(k = -1.0 * pump2.rho_nominal) annotation(
      Placement(visible = true, transformation(origin = {52, 8}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 1000) annotation(
      Placement(visible = true, transformation(origin = {-52, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Vflow2.y, gain2.u) annotation(
      Line(points = {{77, 8}, {64, 8}}, color = {0, 0, 127}));
    connect(gain2.y, massflow2.m_flow_in) annotation(
      Line(points = {{41, 8}, {24, 8}}, color = {0, 0, 127}));
    connect(const1.y, pump2.N_in) annotation(
      Line(points = {{-40, 32}, {-24, 32}, {-24, 12}, {-24, 12}}, color = {0, 0, 127}));
    connect(Vflow1.y, gain1.u) annotation(
      Line(points = {{77, -50}, {66, -50}}, color = {0, 0, 127}));
    connect(gain1.y, massflow1.m_flow_in) annotation(
      Line(points = {{43, -50}, {26, -50}}, color = {0, 0, 127}));
    connect(massflow2.ports[1], pump2.port_b) annotation(
      Line(points = {{4, 0}, {-14, 0}, {-14, 2}, {-14, 2}}, color = {0, 127, 255}));
    connect(pump2.port_a, tank.ports[2]) annotation(
      Line(points = {{-34, 2}, {-64, 2}, {-64, -56}, {-68, -56}, {-68, -58}, {-68, -58}}, color = {0, 127, 255}));
    connect(const.y, pump1.N_in) annotation(
      Line(points = {{-36, -32}, {-26, -32}, {-26, -48}, {-26, -48}}, color = {0, 0, 127}));
    connect(tank.ports[1], pump1.port_a) annotation(
      Line(points = {{-68, -58}, {-36, -58}}, color = {0, 127, 255}));
    connect(massflow1.ports[1], pump1.port_b) annotation(
      Line(points = {{6, -58}, {-16, -58}}, color = {0, 127, 255}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
      Diagram(coordinateSystem(extent = {{-110, -100}, {110, 100}})),
      Icon(coordinateSystem(extent = {{-110, -100}, {110, 100}})));
  end PumpExample1;

  model PumpExample2
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {-82, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT tank(redeclare package Medium = Medium, T = 293.15, nPorts = 2, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {-78, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.PrescribedPump pump1(redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.034, 0.04}, head_nominal = {39.0, 27.0, 22.8}), redeclare function powerCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticPower(V_flow_nominal = {0, 0.034, 0.04}, W_nominal = {5000, 14700, 17000}), N_nominal = 1750, checkValve = true, m_flow_start = 0.0001, use_N_in = true, use_powerCharacteristic = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp head1(duration = 10, height = 38.9, offset = 0.01, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {72, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 1750) annotation(
      Placement(visible = true, transformation(origin = {-48, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.PrescribedPump pump2(redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.034, 0.04}, head_nominal = {39.0, 27.0, 22.8}), redeclare function powerCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticPower(V_flow_nominal = {0, 0.034, 0.04}, W_nominal = {5000, 14700, 17000}), N_nominal = 1750, checkValve = true, m_flow_start = 0.0001, use_N_in = true, use_powerCharacteristic = true) annotation(
      Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 1000) annotation(
      Placement(visible = true, transformation(origin = {-52, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = Medium, nPorts = 1, use_p_in = true) annotation(
      Placement(visible = true, transformation(origin = {34, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Medium, nPorts = 1, p = 301325, use_p_in = true) annotation(
      Placement(visible = true, transformation(origin = {34, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression pressure1(y = pump1.rho_nominal * Modelica.Constants.g_n * head1.y + 101325) annotation(
      Placement(visible = true, transformation(origin = {72, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.1, length = 20) annotation(
      Placement(visible = true, transformation(origin = {4, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp head2(duration = 10, height = 12.7, offset = 0.01, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {72, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression pressure2(y = pump2.rho_nominal * Modelica.Constants.g_n * head2.y + 101325) annotation(
      Placement(visible = true, transformation(origin = {72, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.1, length = 20) annotation(
      Placement(visible = true, transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pump2.port_b, pipe2.port_a) annotation(
      Line(points = {{-14, 0}, {-4, 0}, {-4, 0}, {-4, 0}}, color = {0, 127, 255}));
    connect(pump2.port_a, tank.ports[2]) annotation(
      Line(points = {{-34, 0}, {-64, 0}, {-64, -56}, {-68, -56}, {-68, -58}}, color = {0, 127, 255}));
    connect(const1.y, pump2.N_in) annotation(
      Line(points = {{-40, 32}, {-24, 32}, {-24, 10}}, color = {0, 0, 127}));
    connect(pipe2.port_b, boundary2.ports[1]) annotation(
      Line(points = {{16, 0}, {24, 0}}, color = {0, 127, 255}));
    connect(pressure2.y, boundary2.p_in) annotation(
      Line(points = {{63, 10}, {46, 10}, {46, 8}}, color = {0, 0, 127}));
    connect(pressure1.y, boundary1.p_in) annotation(
      Line(points = {{61, -50}, {46, -50}}, color = {0, 0, 127}));
    connect(pipe1.port_b, boundary1.ports[1]) annotation(
      Line(points = {{12, -58}, {24, -58}}, color = {0, 127, 255}));
    connect(pipe1.port_a, pump1.port_b) annotation(
      Line(points = {{-8, -58}, {-16, -58}}, color = {0, 127, 255}));
    connect(const.y, pump1.N_in) annotation(
      Line(points = {{-36, -32}, {-26, -32}, {-26, -48}, {-26, -48}}, color = {0, 0, 127}));
    connect(tank.ports[1], pump1.port_a) annotation(
      Line(points = {{-68, -58}, {-36, -58}}, color = {0, 127, 255}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
  end PumpExample2;

  model PumpExample3
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {-80, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT tank(redeclare package Medium = Medium, T = 293.15, p = 101325, nPorts = 2) annotation(
      Placement(visible = true, transformation(origin = {-78, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp head1(duration = 10, height = 38.9, offset = 0.01, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {72, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = Medium, nPorts = 1, use_p_in = true) annotation(
      Placement(visible = true, transformation(origin = {34, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Medium, nPorts = 1, p = 301325, use_p_in = true) annotation(
      Placement(visible = true, transformation(origin = {34, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression pressure1(y = pump1.rho_nominal * Modelica.Constants.g_n * head1.y + 101325) annotation(
      Placement(visible = true, transformation(origin = {72, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.1, length = 20) annotation(
      Placement(visible = true, transformation(origin = {4, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp head2(duration = 10, height = 12.7, offset = 0.01, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {72, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression pressure2(y = pump2.rho_nominal * Modelica.Constants.g_n * head2.y + 101325) annotation(
      Placement(visible = true, transformation(origin = {72, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.1, length = 20) annotation(
      Placement(visible = true, transformation(origin = {4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.Pump pump1(redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.034, 0.04}, head_nominal = {39.0, 27.0, 22.8}), redeclare function powerCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticPower(V_flow_nominal = {0, 0.034, 0.04}, W_nominal = {5000, 14700, 17000}), redeclare model Monitoring = Modelica.Fluid.Machines.BaseClasses.PumpMonitoring.PumpMonitoringNPSH, N_nominal = 1750, checkValve = true, m_flow_start = 1, use_powerCharacteristic = true) annotation(
      Placement(visible = true, transformation(origin = {-22, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.Pump pump2(redeclare package Medium = Medium, redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal = {0, 0.034, 0.04}, head_nominal = {39.0, 27.0, 22.8}), redeclare function powerCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticPower(V_flow_nominal = {0, 0.034, 0.04}, W_nominal = {5000, 14700, 17000}), redeclare model Monitoring = Modelica.Fluid.Machines.BaseClasses.PumpMonitoring.PumpMonitoringNPSH, N_nominal = 1750, checkValve = true, m_flow_start = 1, use_powerCharacteristic = true) annotation(
      Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 104.72) annotation(
      Placement(visible = true, transformation(origin = {-42, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed2(w_fixed = 183.26) annotation(
      Placement(visible = true, transformation(origin = {-42, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pipe2.port_b, boundary2.ports[1]) annotation(
      Line(points = {{16, 0}, {24, 0}}, color = {0, 127, 255}));
    connect(pressure2.y, boundary2.p_in) annotation(
      Line(points = {{63, 10}, {46, 10}, {46, 8}}, color = {0, 0, 127}));
    connect(pressure1.y, boundary1.p_in) annotation(
      Line(points = {{61, -50}, {46, -50}}, color = {0, 0, 127}));
    connect(pipe1.port_b, boundary1.ports[1]) annotation(
      Line(points = {{12, -58}, {24, -58}}, color = {0, 127, 255}));
    connect(tank.ports[1], pump1.port_a) annotation(
      Line(points = {{-68, -58}, {-44, -58}, {-44, -58}, {-44, -58}}, color = {0, 127, 255}));
    connect(pump1.port_b, pipe1.port_a) annotation(
      Line(points = {{-26, -58}, {-6, -58}, {-6, -58}, {-6, -58}}, color = {0, 127, 255}));
    connect(tank.ports[2], pump2.port_a) annotation(
      Line(points = {{-68, -58}, {-62, -58}, {-62, 0}, {-44, 0}, {-44, 0}}, color = {0, 127, 255}));
    connect(pump2.port_b, pipe2.port_a) annotation(
      Line(points = {{-24, 0}, {-6, 0}, {-6, 0}, {-6, 0}}, color = {0, 127, 255}));
    connect(constantSpeed1.flange, pump2.shaft) annotation(
      Line(points = {{-28, 38}, {-24, 38}, {-24, 10}, {-24, 10}}));
    connect(constantSpeed2.flange, pump1.shaft) annotation(
      Line(points = {{-32, -32}, {-22, -32}, {-22, -48}, {-22, -48}}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
  end PumpExample3;

  model PumpExample4
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {66, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT tank(redeclare package Medium = Medium, T = 293.15, p = 101325, nPorts = 2) annotation(
      Placement(visible = true, transformation(origin = {-68, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.1, length = 20) annotation(
      Placement(visible = true, transformation(origin = {8, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.ControlledPump pump1(redeclare package Medium = Medium, m_flow_nominal = 40, p_a_nominal = 101325, p_b_nominal = 351325, use_m_flow_set = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = 40) annotation(
      Placement(visible = true, transformation(origin = {-72, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT pressure(redeclare package Medium = Medium, T = 293.15, nPorts = 2, use_p_in = true) annotation(
      Placement(visible = true, transformation(origin = {52, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp pin(duration = 10, height = 195000, offset = 101325) annotation(
      Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Machines.ControlledPump pump2(redeclare package Medium = Medium, control_m_flow = false, m_flow_nominal = 40, p_a_nominal = 101325, p_b_nominal = 351325, use_p_set = true) annotation(
      Placement(visible = true, transformation(origin = {-26, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const1(k = 300000) annotation(
      Placement(visible = true, transformation(origin = {-72, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.1, length = 20) annotation(
      Placement(visible = true, transformation(origin = {8, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pin.y, pressure.p_in) annotation(
      Line(points = {{63, -20}, {78, -20}, {78, -50}, {64, -50}}, color = {0, 0, 127}));
    connect(const1.y, pump2.p_set) annotation(
      Line(points = {{-60, 22}, {-20, 22}, {-20, 12}, {-20, 12}}, color = {0, 0, 127}));
    connect(tank.ports[2], pump2.port_a) annotation(
      Line(points = {{-58, -58}, {-50, -58}, {-50, 4}, {-36, 4}, {-36, 4}}, color = {0, 127, 255}));
    connect(pump2.port_b, pipe2.port_a) annotation(
      Line(points = {{-16, 4}, {-2, 4}}, color = {0, 127, 255}));
    connect(const.y, pump1.m_flow_set) annotation(
      Line(points = {{-61, -24}, {-40, -24}, {-40, -50}, {-31, -50}}, color = {0, 0, 127}));
    connect(pump1.port_b, pipe1.port_a) annotation(
      Line(points = {{-16, -58}, {-4, -58}}, color = {0, 127, 255}));
    connect(tank.ports[1], pump1.port_a) annotation(
      Line(points = {{-58, -58}, {-36, -58}}, color = {0, 127, 255}));
    connect(pipe2.port_b, pressure.ports[2]) annotation(
      Line(points = {{18, 4}, {32, 4}, {32, -58}, {42, -58}}, color = {0, 127, 255}));
    connect(pressure.ports[1], pipe1.port_b) annotation(
      Line(points = {{40, -60}, {22, -60}, {22, -58}, {22, -58}}, color = {0, 127, 255}));
    annotation(
      __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
    annotation(
      Placement(visible = true, transformation(origin = {8, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  end PumpExample4;
  annotation(
    uses(Modelica(version = "3.2.3")));
end PumpTest;