package com.kami.kami.dao;

import java.util.ArrayList;

import com.kami.kami.vo.Chartarea;
import com.kami.kami.vo.Chartbar;
import com.kami.kami.vo.Chartpie;

public interface ChartMapper {
	public ArrayList<Chartbar> barChartList(String month);
	public ArrayList<Chartpie> pieChartList(String id);
	public ArrayList<Chartarea> areaChartList(String id);
}
