package FluidExample3
  import Modelica.Media;
  model StaticPipeTest1
    import Modelica.Fluid.Vessels.BaseClasses.VesselPortsData;
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {48, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Medium, T_start = 280, V = 0.5,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, fluidLevel = 1.0,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, p_start = 101325, use_portsData = false)
       annotation(
      Placement(visible = true, transformation(origin = {-22, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325)
      annotation(
      Placement(visible = true, transformation(origin = {68, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT hotWater(redeclare package Medium = Medium, T = 370, nPorts = 1, p = 701325)
      annotation(
      Placement(visible = true, transformation(origin = {-68, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = Medium, T_start = 280, V = 0.5,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, fluidLevel = 1.0,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, p_start = 101325, use_portsData = false)
        annotation(
      Placement(visible = true, transformation(origin = {14, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium,
      diameter = 0.014, length = 5)  annotation(
      Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium,
      diameter = 0.014, length = 5)  annotation(
      Placement(visible = true, transformation(origin = {-4, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium,
      diameter = 0.014, length = 5)  annotation(
      Placement(visible = true, transformation(origin = {36, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pipe3.port_b, ambient.ports[1]) annotation(
      Line(points = {{46, -20}, {58, -20}}, color = {0, 127, 255}));
    connect(pipe3.port_a, volume1.ports[2]) annotation(
      Line(points = {{26, -20}, {16, -20}, {16, -6}, {14, -6}}, color = {0, 127, 255}));
    connect(pipe2.port_b, volume1.ports[1]) annotation(
      Line(points = {{6, -20}, {14, -20}, {14, -6}}, color = {0, 127, 255}));
    connect(volume.ports[2], pipe2.port_a) annotation(
      Line(points = {{-22, -6}, {-20, -6}, {-20, -20}, {-14, -20}, {-14, -20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe1.port_b, volume.ports[1]) annotation(
      Line(points = {{-30, -20}, {-24, -20}, {-24, -6}, {-22, -6}, {-22, -6}}, color = {0, 127, 255}));
    connect(hotWater.ports[1], pipe1.port_a) annotation(
      Line(points = {{-58, -20}, {-50, -20}, {-50, -20}, {-50, -20}}, color = {0, 127, 255}, thickness = 0.5));
    annotation(
      Icon(coordinateSystem(grid = {1, 1})),
      experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 8),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
  end StaticPipeTest1;

  model StaticPipeTest2
    import Modelica.Fluid.Vessels.BaseClasses.VesselPortsData;
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {48, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Medium,
      T_start = 280, V = 0.5,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      fluidLevel = 1.0,
      massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
      nPorts = 2, p_start = 101325, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {-22, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT ambient(redeclare package Medium = Medium, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {68, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.014, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.014, length = 1) annotation(
      Placement(visible = true, transformation(origin = {-4, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, diameter = 0.014, length = 1) annotation(
      Placement(visible = true, transformation(origin = {36, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T hotWater(redeclare package Medium = Medium,
      T = 370, m_flow = 1.045, nPorts = 1)  annotation(
      Placement(visible = true, transformation(origin = {-72, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(hotWater.ports[1], pipe1.port_a) annotation(
      Line(points = {{-62, -20}, {-50, -20}, {-50, -20}, {-50, -20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe2.port_b, pipe3.port_a) annotation(
      Line(points = {{6, -20}, {26, -20}, {26, -20}, {26, -20}}, color = {0, 127, 255}));
    connect(pipe3.port_b, ambient.ports[1]) annotation(
      Line(points = {{46, -20}, {58, -20}}, color = {0, 127, 255}));
    connect(volume.ports[2], pipe2.port_a) annotation(
      Line(points = {{-22, -6}, {-20, -6}, {-20, -20}, {-14, -20}, {-14, -20}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe1.port_b, volume.ports[1]) annotation(
      Line(points = {{-30, -20}, {-24, -20}, {-24, -6}, {-22, -6}, {-22, -6}}, color = {0, 127, 255}));
    annotation(
      Icon(coordinateSystem(grid = {1, 1})),
      experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 8),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
  end StaticPipeTest2;



  annotation(
    uses(Modelica(version = "3.2.2")));
end FluidExample3;
