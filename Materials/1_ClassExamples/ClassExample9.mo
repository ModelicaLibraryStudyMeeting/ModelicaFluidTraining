package ClassExample9
  import Modelica.Media;
  import SI = Modelica.SIunits;

  model RoomA
    replaceable package Medium = Media.Air.DryAirNasa;
    parameter SI.Temperature T_amb = 293.15;
    parameter SI.Pressure p_amb = 101325;
    parameter SI.Volume V = 22.0;
    parameter SI.HeatFlowRate Q_flow = 100;
    Medium.BaseProperties medium;
    SI.MassFlowRate m_flow(start = 0.0);
    SI.Mass M;
    SI.Energy U;
  equation
    M = medium.d * V;
    U = medium.u * M;
    der(M) = m_flow;
    der(U) = Q_flow + medium.h * m_flow;
    medium.p = p_amb;
  initial equation
    medium.T = T_amb;
  end RoomA;


  model RoomB
    replaceable package Medium = Media.Air.DryAirNasa;
    parameter SI.Volume V = 22.0;
    Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
      Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Medium.BaseProperties medium;
    SI.Mass M;
    SI.Energy U;
  equation
    M = medium.d * V;
    U = medium.u * M;
    der(M) = port_b.m_flow;
    der(U) = port_a.Q_flow + actualStream(port_b.h_outflow) * port_b.m_flow;
    port_b.p = medium.p;
    port_b.h_outflow = medium.h;
    port_a.T = medium.T;
  initial equation
    medium.T = 293.15;
    annotation(
      Icon(graphics = {Rectangle(origin = {-20, 4}, extent = {{-40, 56}, {80, -64}}), Text(origin = {4, 75}, extent = {{-70, 15}, {54, -11}}, textString = "%name"), Polygon(origin = {-1.02, 49}, fillColor = {255, 128, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-58.983, 11}, {-78.983, -21}, {81.017, -21}, {61.017, 11}, {61.017, 11}, {-0.982991, 11}, {-58.983, 11}})}, coordinateSystem(initialScale = 0.1)));
  end RoomB;

model RoomBTest
  replaceable package Medium = Media.Air.DryAirNasa;
  ClassExample9.RoomB roomB1(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {0, -5.32907e-15}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow = 100)  annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Medium, T = 293.15, nPorts = 1, p = 101325)  annotation(
    Placement(visible = true, transformation(origin = {42, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(roomB1.port_b, boundary.ports[1]) annotation(
    Line(points = {{10, 0}, {30, 0}, {30, 0}, {32, 0}}, color = {0, 127, 255}));
  connect(fixedHeatFlow1.port, roomB1.port_a) annotation(
    Line(points = {{-30, 0}, {-12, 0}, {-12, 0}, {-12, 0}}, color = {191, 0, 0}));
end RoomBTest;

  annotation(
    uses(Modelica(version = "3.2.2")));
end ClassExample9;