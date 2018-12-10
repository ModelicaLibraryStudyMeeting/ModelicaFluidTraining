package MediaExample2
  model StateCheckPs
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    Medium.ThermodynamicState state;
    Modelica.Blocks.Interfaces.RealInput p annotation(
      Placement(visible = true, transformation(origin = {-88, 38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput s annotation(
      Placement(visible = true, transformation(origin = {-86, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput T annotation(
      Placement(visible = true, transformation(origin = {66, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput x annotation(
      Placement(visible = true, transformation(origin = {68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(
      Placement(visible = true, transformation(origin = {66, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput h annotation(
      Placement(visible = true, transformation(origin = {68, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    state = Medium.setState_ps(p, s);
    T = state.T;
    x = Medium.vapourQuality(state);
    v = 1 / state.d;
    h = state.h;
    annotation(
      Icon(graphics = {Rectangle(origin = {0, 1}, extent = {{-100, 99}, {100, -101}}), Text(origin = {-39, 42}, extent = {{-19, 18}, {19, -18}}, textString = "p"), Text(origin = {67, -62}, extent = {{-19, 18}, {19, -18}}, textString = "h"), Text(origin = {67, 56}, extent = {{-19, 18}, {19, -18}}, textString = "T"), Text(origin = {67, 20}, extent = {{-19, 18}, {19, -18}}, textString = "x"), Text(origin = {67, -20}, extent = {{-19, 18}, {19, -18}}, textString = "v"), Text(origin = {-41, -38}, extent = {{-19, 18}, {19, -18}}, textString = "s"), Text(origin = {-33, 130}, extent = {{-95, 14}, {135, -34}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
      Diagram);
  end StateCheckPs;


  model StateCheckTest2
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    MediaExample2.StateCheckPs stateCheckPs1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp pressure1(duration = 100, height = 4900000, offset = 100000, startTime = 0)  annotation(
      Placement(visible = true, transformation(origin = {-70, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp1(duration = 100, height = -4900000, offset = 5000000, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {22, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MediaExample2.StateCheckPs stateCheckPs2(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {66, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp2(duration = 100, height = 0.001, offset = 7300, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {20, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp3(duration = 100, height = 0.1, offset = 1300, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-70, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(ramp3.y, stateCheckPs1.s) annotation(
      Line(points = {{-58, -22}, {-44, -22}, {-44, -4}, {-34, -4}, {-34, -4}, {-34, -4}}, color = {0, 0, 127}));
    connect(ramp2.y, stateCheckPs2.s) annotation(
      Line(points = {{32, -26}, {44, -26}, {44, -4}, {56, -4}, {56, -4}, {56, -4}}, color = {0, 0, 127}));
    connect(ramp1.y, stateCheckPs2.p) annotation(
      Line(points = {{34, 20}, {44, 20}, {44, 4}, {56, 4}, {56, 4}}, color = {0, 0, 127}));
    connect(pressure1.y, stateCheckPs1.p) annotation(
      Line(points = {{-58, 24}, {-46, 24}, {-46, 4}, {-34, 4}, {-34, 4}}, color = {0, 0, 127}));
  end StateCheckTest2;

  annotation(
    uses(Modelica(version = "3.2.2")));
end MediaExample2;
