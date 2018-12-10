package ClassExample4  // package
  constant Acceleration g = -9.8;

  // type
  type Acceleration = Real(quantity = "Acceleration", unit = "m/s2");
  type Mass = Real(quantity = "Mass", unit = "kg");
  type Force = Real(quantity = "Force", unit = "N");
  type Velocity = Real(quantity = "Velocity", unit = "m/s");
  type Position = Real(quantity = "Length", unit = "m");
  type SpringConstant = Real(quantity = "Spring Constant", unit = "N/m");
  
  // record
  record State
    Position x;
    Velocity v;
  end State;

  // connector
  connector Flange
    Position s "Absolute position of flange";
    flow Force f "Cut force directed into flange";
    annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}})}));
  end Flange;

  // model
  model MassModel
    parameter Mass m = 1.0;
    parameter State s0(x = 0, v = 0);
    State s(x(start = s0.x), v(start = s0.v));
     Flange flange annotation(
      Placement(visible = true, transformation(origin = {-32, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    s.v = der(s.x);
    flange.f = m * der(s.v);
    flange.s = s.x;
    annotation(
      Icon(graphics = {Ellipse(origin = {0, 2}, fillColor = {128, 0, 128}, fillPattern = FillPattern.Sphere, extent = {{-40, 38}, {40, -42}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)),
      Diagram(coordinateSystem(initialScale = 0.1)));
  end MassModel;

  model SpringModel
    parameter SpringConstant k = 1.0;
    Flange flange annotation(
      Placement(visible = true, transformation(origin = {72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    flange.f = k * flange.s;
    annotation(
      Icon(graphics = {Line(origin = {0.628743, 0}, points = {{-60.6287, 0}, {-50.6287, 0}, {-40.6287, 20}, {-20.6287, -20}, {-0.628743, 20}, {19.3713, -20}, {39.3713, 20}, {47.3713, 0}, {59.3713, 0}}), Rectangle(origin = {-67, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, extent = {{-7, 22}, {7, -22}})}));
  end SpringModel;

  model MassModelTest
    parameter Mass m = 1.0;
    Modelica.Blocks.Sources.Constant const(k = m * g)  annotation(
      Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Translational.Sources.Force force1 annotation(
      Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MassModel massModel1(m = m, s0(x = 0.0, v = 5.0)) annotation(
      Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    SpringModel springModel1(k = 100)  annotation(
      Placement(visible = true, transformation(origin = {-12, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MassModel massModel2(m = m, s0(x = 1.0, v = 0.0))  annotation(
      Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(springModel1.flange, massModel2.flange) annotation(
      Line(points = {{-6, -40}, {6, -40}, {6, -40}, {6, -40}}));
    connect(const.y, force1.f) annotation(
      Line(points = {{-22, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {0, 0, 127}));
    connect(force1.flange, massModel1.flange) annotation(
      Line(points = {{12, 0}, {32, 0}, {32, 0}, {32, 0}}, color = {0, 127, 0}));
  end MassModelTest;

end ClassExample4;