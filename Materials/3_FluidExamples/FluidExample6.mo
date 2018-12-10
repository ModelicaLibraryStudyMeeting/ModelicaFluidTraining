package FluidExample6
  model WaterHeating
    package Medium = Modelica.Media.Water.StandardWater;
    import Modelica.Fluid.Vessels.BaseClasses.VesselPortsData;
    Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium, T_start = 293.15, diameter = 0.03,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      height_ab = 0.3, length = 5, m_flow_start = 0.02,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, modelStructure = Modelica.Fluid.Types.ModelStructure.a_v_b,
      momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nNodes = 5, use_HeatTransfer = true) annotation(
      Placement(visible = true, transformation(origin = {-24, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Medium, T_start = 293.15, crossArea = 1,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, height = 1, level_start = 0.7,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, 
      portsData = {VesselPortsData(diameter = 0.03), VesselPortsData(diameter = 0.03, height = 0.3)},
      use_T_start = true) annotation(
      Placement(visible = true, transformation(origin = {49,39}, extent = {{27, -27}, {-27, 27}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow[pipe.nNodes] fixedHeatFlow1(Q_flow = 20000.0 * pipe.dxs) annotation(
      Placement(visible = true, transformation(origin = {-56, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fixedHeatFlow1.port, pipe.heatPorts) annotation(
      Line(points = {{-46, 8}, {-28, 8}}, color = {191, 0, 0}));
    connect(tank.ports[1], pipe.port_a) annotation(
      Line(points = {{49, 12}, {48.5, 12}, {48.5, -2}, {-24, -2}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe.port_b, tank.ports[2]) annotation(
      Line(points = {{-24, 18}, {15.5, 18}, {15.5, 4}, {40.25, 4}, {40.25, 12}, {49, 12}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 2500, Tolerance = 1e-06, Interval = 2),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", nls = "hybrid"));
  end WaterHeating;
  annotation(
    uses(Modelica(version = "3.2.2")));
end FluidExample6;