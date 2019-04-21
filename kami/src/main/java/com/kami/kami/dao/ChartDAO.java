package com.kami.kami.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Chartarea;
import com.kami.kami.vo.Chartbar;
import com.kami.kami.vo.Chartpie;

@Repository
public class ChartDAO {
	
	@Autowired
	SqlSession session;
	
	public ArrayList<String> barChartListH(String month){
		
	ArrayList<Chartbar> list = new ArrayList<Chartbar>();
	ArrayList<String> result = new ArrayList<String>();
		try {
			ChartMapper mapper = session.getMapper(ChartMapper.class);
			 list = mapper.barChartList(month);
			 for (Chartbar chartbar : list) {
				result.add(chartbar.getName()+"("+chartbar.getId()+")");
			}
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
			list =null;
		} 
		 
		return result;
	}
	
	public ArrayList<String> barChartListV(String month){
		
		ArrayList<Chartbar> list = new ArrayList<Chartbar>();
		ArrayList<String> result = new ArrayList<String>();
			try {
				ChartMapper mapper = session.getMapper(ChartMapper.class);
				 list = mapper.barChartList(month);
				 for (Chartbar chartbar : list) {
					result.add(chartbar.getRsv_totalprice());
				}
				 
				 
			} catch (Exception e) {
				e.printStackTrace();
				list =null;
			} 
			 
			return result;
		}
	
	public ArrayList<String> pieChartListN(String id){
		
		ArrayList<Chartpie> list = new ArrayList<Chartpie>();
		ArrayList<String> result = new ArrayList<String>();
		
		try {
			ChartMapper mapper = session.getMapper(ChartMapper.class);
			list= mapper.pieChartList(id);
			for (Chartpie pie : list) {
				result.add(pie.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
		}
		
		return result;
	}
	

	public ArrayList<String> pieChartListV(String id){
		
		ArrayList<Chartpie> list = new ArrayList<Chartpie>();
		ArrayList<String> result = new ArrayList<String>();
		
		try {
			ChartMapper mapper = session.getMapper(ChartMapper.class);
			list= mapper.pieChartList(id);
			for (Chartpie pie : list) {
				result.add(pie.getCount());
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
		}
		
		return result;
	}
	
public ArrayList<String> areaChartListH(String id){
		
		ArrayList<Chartarea> list = new ArrayList<Chartarea>();
		ArrayList<String> result = new ArrayList<String>();
		
		try {
			ChartMapper mapper = session.getMapper(ChartMapper.class);
			list= mapper.areaChartList(id);
			for (Chartarea area : list) {
				result.add(area.getRsv_date());
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
		}
		
		return result;
	}

public ArrayList<String> areaChartListV(String id){
	
	ArrayList<Chartarea> list = new ArrayList<Chartarea>();
	

	ArrayList<String> result = new ArrayList<String>();
	
	try {
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		list= mapper.areaChartList(id);
	
		for (Chartarea area : list) {
			result.add(area.getRsv_totalprice());
			
		}
	} catch (Exception e) {
		e.printStackTrace();
		result = null;
	}
	
	return result;
}



	
}
