package ClassExample8
  import Modelica.Media;
  import BI = Modelica.Blocks.Interfaces;

  model MediaState
    replaceable package Medium = Media.Air.SimpleAir;
    Medium.ThermodynamicState state;
    Modelica.Blocks.Interfaces.RealInput p annotation(
      Placement(visible = true, transformation(origin = {-86, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-60, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput T annotation(
      Placement(visible = true, transformation(origin = {-86, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-60, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput d annotation(
      Placement(visible = true, transformation(origin = {88, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {62, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput h annotation(
      Placement(visible = true, transformation(origin = {86, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    state = Medium.setState_pT(p, T);
    d = Medium.density(state);
    h = Medium.specificEnthalpy(state);
    annotation(
      Icon(graphics = {Rectangle(origin = {-20, 4}, extent = {{-40, 56}, {80, -64}}), Text(origin = {4, 75}, extent = {{-70, 15}, {54, -11}}, textString = "%name"), Text(origin = {-24, 37}, extent = {{-14, 21}, {8, -15}}, textString = "p"), Text(origin = {-26, -45}, extent = {{-14, 21}, {8, -15}}, textString = "T"), Text(origin = {34, 35}, extent = {{-14, 21}, {8, -15}}, textString = "d"), Text(origin = {34, -41}, extent = {{-14, 21}, {8, -15}}, textString = "h")}));
  end MediaState;




  model MediuStateTest
    replaceable package Medium = Media.Air.DryAirNasa; 
    MediaState mediaState1(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp pressure1(duration = 10, height = 100000, offset = 101325)  annotation(
      Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant temperature1(k = 273.15)  annotation(
      Placement(visible = true, transformation(origin = {-60, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pressure2(k = 101325) annotation(
      Placement(visible = true, transformation(origin = {20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp temperature2(duration = 10, height = 100, offset = 273.15) annotation(
      Placement(visible = true, transformation(origin = {22, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MediaState mediaState2(redeclare package Medium = Medium) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(temperature2.y, mediaState2.T) annotation(
      Line(points = {{34, -18}, {42, -18}, {42, -4}, {54, -4}, {54, -4}}, color = {0, 0, 127}));
    connect(pressure2.y, mediaState2.p) annotation(
      Line(points = {{32, 20}, {40, 20}, {40, 4}, {54, 4}, {54, 4}}, color = {0, 0, 127}));
    connect(pressure1.y, mediaState1.p) annotation(
      Line(points = {{-48, 20}, {-45, 20}, {-45, 10}, {-34, 10}, {-34, 4}, {-26, 4}}, color = {0, 0, 127}));
    connect(temperature1.y, mediaState1.T) annotation(
      Line(points = {{-49, -22}, {-32, -22}, {-32, -4}, {-26, -4}}, color = {0, 0, 127}));
  end MediuStateTest;




  
  annotation(
    uses(Modelica(version = "3.2.2")));
end ClassExample8;
