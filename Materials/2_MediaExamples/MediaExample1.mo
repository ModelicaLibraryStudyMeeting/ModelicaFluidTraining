package MediaExample1
  model StateCheckPh
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    Medium.ThermodynamicState state;
    Modelica.Blocks.Interfaces.RealInput p annotation(
      Placement(visible = true, transformation(origin = {-88, 38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput h annotation(
      Placement(visible = true, transformation(origin = {-86, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput T annotation(
      Placement(visible = true, transformation(origin = {66, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput x annotation(
      Placement(visible = true, transformation(origin = {68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput v annotation(
      Placement(visible = true, transformation(origin = {66, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput s annotation(
      Placement(visible = true, transformation(origin = {68, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    state = Medium.setState_ph(p, h);
    T = state.T;
    x = Medium.vapourQuality(state);
    v = 1 / state.d;
    s = Medium.specificEntropy(state);
    annotation(
      Icon(graphics = {Rectangle(origin = {0, 1}, extent = {{-100, 99}, {100, -101}}), Text(origin = {-39, 42}, extent = {{-19, 18}, {19, -18}}, textString = "p"), Text(origin = {-39, -38}, extent = {{-19, 18}, {19, -18}}, textString = "h"), Text(origin = {67, 56}, extent = {{-19, 18}, {19, -18}}, textString = "T"), Text(origin = {67, 20}, extent = {{-19, 18}, {19, -18}}, textString = "x"), Text(origin = {67, -20}, extent = {{-19, 18}, {19, -18}}, textString = "v"), Text(origin = {69, -60}, extent = {{-19, 18}, {19, -18}}, textString = "s"), Text(origin = {-3, 115}, extent = {{-83, 27}, {87, -15}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
      Diagram);
  end StateCheckPh;

  model StateCheckTest1
    replaceable package Medium = Modelica.Media.Water.StandardWater;
    Modelica.Blocks.Sources.Ramp pressure1(duration = 100, height = 0.1, offset = 101325, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-78, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp enthalpy1(duration = 100, height = 3780000, offset = 20000, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {-78, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MediaExample1.StateCheckPh stateCheckPh1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {-22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp enthalpy2(duration = 100, height = 3780000, offset = 20000, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp pressure2(duration = 100, height = 0.1, offset = 5000000, startTime = 0) annotation(
      Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MediaExample1.StateCheckPh stateCheckPh2(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(enthalpy2.y, stateCheckPh2.h) annotation(
      Line(points = {{32, -20}, {48, -20}, {48, -4}, {68, -4}, {68, -4}, {68, -4}}, color = {0, 0, 127}));
    connect(pressure2.y, stateCheckPh2.p) annotation(
      Line(points = {{32, 20}, {48, 20}, {48, 4}, {68, 4}, {68, 4}}, color = {0, 0, 127}));
    connect(enthalpy1.y, stateCheckPh1.h) annotation(
      Line(points = {{-67, -20}, {-50, -20}, {-50, -4}, {-31, -4}}, color = {0, 0, 127}));
    connect(pressure1.y, stateCheckPh1.p) annotation(
      Line(points = {{-67, 20}, {-50, 20}, {-50, 4}, {-31, 4}}, color = {0, 0, 127}));
  end StateCheckTest1;


  annotation(
    uses(Modelica(version = "3.2.2")));
end MediaExample1;
