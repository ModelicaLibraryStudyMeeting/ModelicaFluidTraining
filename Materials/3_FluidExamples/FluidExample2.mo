package FluidExample2
  import Modelica.Media;

  model HotRoom1
    replaceable package Medium = Media.Air.DryAirNasa;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume room(redeclare package Medium = Medium,
      T_start = 280, V = 22,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nPorts = 2, p_start = 101325, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {-2, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T hotAir(redeclare package Medium = Medium,
      T = 313.15, m_flow = 0.1, nPorts = 1, use_T_in = false) annotation(
      Placement(visible = true, transformation(origin = {-50, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T outlet(redeclare package Medium = Medium,
      m_flow = -0.103, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {50, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(hotAir.ports[1], room.ports[1]) annotation(
      Line(points = {{-40, -18}, {-4, -18}, {-4, -6}, {-2, -6}}, color = {0, 127, 255}));
    connect(room.ports[2], outlet.ports[1]) annotation(
      Line(points = {{-2, -6}, {0, -6}, {0, -18}, {40, -18}, {40, -18}}, color = {0, 127, 255}));
    annotation(
      Icon(coordinateSystem(grid = {1, 1})),
      experiment(StartTime = 0, StopTime = 1200, Tolerance = 1e-06, Interval = 2),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
  end HotRoom1;

  model WaterVolume1
    replaceable package Medium = Media.Water.StandardWater;
    //replaceable package Medium = Media.Water.ConstantPropertyLiquidWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {48, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Medium, T_start = 280, V = 1,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      nPorts = 2, p_start = 101325, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {-2, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T hotWater(redeclare package Medium = Medium,
      T = 370, m_flow = 1, nPorts = 1, use_T_in = false) annotation(
      Placement(visible = true, transformation(origin = {-50, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT ambient(redeclare package Medium = Medium,
      nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {48, -16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  equation
    connect(hotWater.ports[1], volume.ports[1]) annotation(
      Line(points = {{-40, -18}, {-4, -18}, {-4, -6}, {-2, -6}}, color = {0, 127, 255}, thickness = 0.5));
    connect(volume.ports[2], ambient.ports[1]) annotation(
      Line(points = {{-2, -6}, {0, -6}, {0, -18}, {38, -18}, {38, -16}}, color = {0, 127, 255}, thickness = 0.5));
    annotation(
      Icon(coordinateSystem(grid = {1, 1})),
      experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 8),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
  end WaterVolume1;






  model WaterVolume2
    import Modelica.Fluid.Vessels.BaseClasses.VesselPortsData;
    replaceable package Medium = Media.Water.StandardWater;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {48, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Medium,
      T_start = 280, V = 1,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      fluidLevel = 1.0,
      massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
      nPorts = 2, p_start = 101325,
      portsData = {VesselPortsData(diameter = 0.014), VesselPortsData(diameter = 0.014)},
      use_portsData = true) annotation(
      Placement(visible = true, transformation(origin = {-2, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT ambient(redeclare package Medium = Medium,
      nPorts = 1, p = 101325) annotation(
      Placement(visible = true, transformation(origin = {48, -16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.Boundary_pT hotWater(redeclare package Medium = Medium,
      T = 370, nPorts = 1, p = 131325) annotation(
      Placement(visible = true, transformation(origin = {-44, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(hotWater.ports[1], volume.ports[1]) annotation(
      Line(points = {{-34, -18}, {-2, -18}, {-2, -6}}, color = {0, 127, 255}, thickness = 0.5));
    connect(volume.ports[2], ambient.ports[1]) annotation(
      Line(points = {{-2, -6}, {0, -6}, {0, -18}, {38, -18}, {38, -16}}, color = {0, 127, 255}, thickness = 0.5));
    annotation(
      Icon(coordinateSystem(grid = {1, 1})),
      experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 8),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
  end WaterVolume2;



  model HotRoom2
    replaceable package Medium = Media.Air.DryAirNasa;
    inner Modelica.Fluid.System system annotation(
      Placement(visible = true, transformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume room(redeclare package Medium = Medium,
      T_start = 280, V = 11,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nPorts = 2, p_start = 101325, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {-14, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T hotAir(redeclare package Medium = Medium,
      T = 313.15, m_flow = 0.1, nPorts = 1, use_T_in = false) annotation(
      Placement(visible = true, transformation(origin = {-50, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Sources.MassFlowSource_T outlet(redeclare package Medium = Medium,
      m_flow = -0.103, nPorts = 1) annotation(
      Placement(visible = true, transformation(origin = {46, -18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume room2(redeclare package Medium = Medium,
      T_start = 280, V = 11,
      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial,
      nPorts = 2, p_start = 101325, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {10, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(room2.ports[2], outlet.ports[1]) annotation(
      Line(points = {{10, -6}, {10, -18}, {36, -18}}, color = {0, 127, 255}, thickness = 0.5));
    connect(room.ports[2], room2.ports[1]) annotation(
      Line(points = {{-14, -6}, {-12, -6}, {-12, -18}, {8, -18}, {8, -6}, {10, -6}}, color = {0, 127, 255}, thickness = 0.5));
    connect(hotAir.ports[1], room.ports[1]) annotation(
      Line(points = {{-40, -18}, {-14, -18}, {-14, -6}}, color = {0, 127, 255}));
    annotation(
      Icon(coordinateSystem(grid = {1, 1})),
      experiment(StartTime = 0, StopTime = 1200, Tolerance = 1e-06, Interval = 2),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
  end HotRoom2;


  annotation(
    Icon(coordinateSystem(grid = {1, 1})),
    uses(Modelica(version = "3.2.2")));
end FluidExample2;