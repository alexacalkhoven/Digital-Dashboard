void drawChart(int x_pos, int y_pos, float [] data, String header)
{
  BarChart barChart;
  barChart = new BarChart(this);
  barChart.setData(data);

  barChart.setMinValue(0);
  barChart.setMaxValue(40); //?

  textFont(createFont("SerifArialMT-48.csv", 20), 10);

  barChart.showValueAxis(true);
  barChart.setValueFormat("#");
  barChart.showCategoryAxis(true);

  barChart.setBarColour(color(255, 0, 0));
  barChart.setBarGap(5);
  barChart.draw(x_pos, y_pos, 750, 600);

  textSize(35);
  text(header, x_pos+300, y_pos+650);
}
