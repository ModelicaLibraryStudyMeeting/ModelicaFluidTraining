package FluidExample4
  import Modelica.Media;
  import Modelica.Fluid.Types;
  import Modelica.Fluid.Pipes;
  import Modelica.Fluid.Valves;
  import Modelica.Fluid.Sources;
  import Modelica.Thermal;

  model WaterExchange3
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Medium,
      T = 370, nPorts = 1, p = 114500) annotation(
      Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium,
      T_start = 280, diameter = 0.015,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      length = 20, m_flow_start = 0.1,
      massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      modelStructure = Modelica.Fluid.Types.ModelStructure.a_v_b,
      momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nNodes = 20, use_T_start = true) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium, T = 280, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(boundary.ports[1], pipe.port_a) annotation(
      Line(points = {{-28, 0}, {-10, 0}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe.port_b, ambient.ports[1]) annotation(
      Line(points = {{10, 0}, {30, 0}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.4),
      __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS", nls = "hybrid"));
  end WaterExchange3;


  model WaterExchange1
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium,
      T_start = 280, diameter = 0.015,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      length = 20, m_flow_start = 0.15,
      massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      modelStructure = Modelica.Fluid.Types.ModelStructure.av_b,
      momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nNodes = 20, use_T_start = true) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium,
      T = 280, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Medium,
      T = 370, m_flow = 0.15, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(boundary.ports[1], pipe.port_a) annotation(
      Line(points = {{-28, 0}, {-10, 0}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe.port_b, ambient.ports[1]) annotation(
      Line(points = {{10, 0}, {30, 0}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.4),
      __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS", nls = "hybrid"));
  end WaterExchange1;


  model WaterExchange2
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium,
      T_start = 280, diameter = 0.015,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      length = 20, m_flow_start = 0.15,
      massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      modelStructure = Modelica.Fluid.Types.ModelStructure.av_b,
      momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nNodes = 100, use_T_start = true) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium,
      T = 280, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Medium,
      T = 370, m_flow = 0.15, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(boundary.ports[1], pipe.port_a) annotation(
      Line(points = {{-28, 0}, {-10, 0}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe.port_b, ambient.ports[1]) annotation(
      Line(points = {{10, 0}, {30, 0}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.08),
      __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS", nls = "hybrid"));
  end WaterExchange2;


  model WaterExchange4
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Medium,
      T = 370, nPorts = 1, p = 114500) annotation(
      Placement(visible = true, transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = Medium,
      T_start = 280, diameter = 0.015,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      length = 20, m_flow_start = 0.1,
      massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      modelStructure = Modelica.Fluid.Types.ModelStructure.a_v_b,
      momentumDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nNodes = 100, use_T_start = true) annotation(
      Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.FixedBoundary ambient(redeclare package Medium = Medium,
      T = 280, nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(boundary.ports[1], pipe.port_a) annotation(
      Line(points = {{-28, 0}, {-8, 0}}, color = {0, 127, 255}, thickness = 0.5));
    connect(pipe.port_b, ambient.ports[1]) annotation(
      Line(points = {{12, 0}, {32, 0}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.08),
      __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS", nls = "hybrid"));
  end WaterExchange4;
  annotation(
    uses(Modelica(version = "3.2.2")));
end FluidExample4;