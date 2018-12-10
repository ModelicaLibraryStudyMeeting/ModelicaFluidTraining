package FluidExample5
  model WaterTank
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    import Modelica.Fluid.Vessels.BaseClasses.VesselPortsData;
    Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Medium, T_start = 293.15,crossArea = 1,
    energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
    height = 1, level_start = 0.2, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 3,
    portsData = {VesselPortsData(diameter = 0.014, height = 0.5),VesselPortsData(diameter = 0.003),
    VesselPortsData(diameter = 0.05, height = 0.8)})  annotation(
      Placement(visible = true, transformation(origin = {6, 14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT hotWater(redeclare package Medium = Medium, T = 333.15, nPorts = 1, p = 115000)  annotation(
      Placement(visible = true, transformation(origin = {-76, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe feedPipe(redeclare package Medium = Medium, diameter = 0.014, length = 1)  annotation(
      Placement(visible = true, transformation(origin = {-36, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, nPorts = 2)  annotation(
      Placement(visible = true, transformation(origin = {74, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.StaticPipe hole(redeclare package Medium = Medium, diameter = 0.003, length = 0.03)  annotation(
      Placement(visible = true, transformation(origin = {36, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(tank.ports[3], ambient.ports[2]) annotation(
      Line(points = {{6, -6}, {24, -6}, {24, 10}, {64, 10}}, color = {0, 127, 255}, thickness = 0.5));
    connect(hole.port_b, ambient.ports[1]) annotation(
      Line(points = {{46, -36}, {64, -36}, {64, 10}}, color = {0, 127, 255}));
    connect(hole.port_a, tank.ports[2]) annotation(
      Line(points = {{26, -36}, {6, -36}, {6, -6}, {6, -6}}, color = {0, 127, 255}));
  connect(feedPipe.port_b, tank.ports[1]) annotation(
      Line(points = {{-26, 8}, {-13, 8}, {-13, -6}, {6, -6}}, color = {0, 127, 255}));
  connect(feedPipe.port_a, hotWater.ports[1]) annotation(
      Line(points = {{-46, 8}, {-66, 8}}, color = {0, 127, 255}));
  annotation(
      experiment(StartTime = 0, StopTime = 2000, Tolerance = 1e-06, Interval = 4),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", nls = "hybrid"));
  end WaterTank;
  annotation(
    uses(Modelica(version = "3.2.2")));
end FluidExample5;