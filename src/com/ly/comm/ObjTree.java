/**
 * ObjTree生成MenuTtree,DeptTree....
 */
package com.ly.comm;

import java.util.List;

import org.apache.log4j.Logger;

import com.ly.base.pojo.Codetype;
import com.ly.sys.pojo.Dept;
import com.ly.sys.pojo.Employee;
import com.ly.sys.pojo.Hospital;
import com.ly.sys.pojo.Menu;

public class ObjTree {

	static Logger log = Logger.getLogger(ObjTree.class.getName());

	/**
	 * 获取菜单Tree
	 * 
	 * @param menus
	 * @return
	 */
	public static String getMenuTree(List<Menu> menus) {
		StringBuffer sb = new StringBuffer();
		sb
				.append("var t0 = new WebFXTree(\"顶级菜单\",\"javascript:chg('0','顶级节点')\");\n");
		for (Menu m : menus) {

			sb.append("var t" + m.getMenuid() + " = new WebFXTreeItem(\""
					+ m.getMenuname() + "\",\"javascript:chg('" + m.getMenuid()
					+ "','" + m.getMenuname() + "')\"");
			sb.append(",t" + m.getPmenuid() + ");\n");
		}
//		sb.append("document.write(t0)");
		return sb.toString();
	}

	/**
	 * 获取菜单CheckboxTree
	 * 
	 * @param menus
	 * @return
	 */
	public static String getMenuChkTree(List<Menu> menus) {
		String checked = "";
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('医院菜单列表');\n");
		for (Menu m : menus) {
			checked = "true";
			if (m.getOid() == null || m.getOid().equals("")) {
				checked = "false";
			}

			sb.append("var t" + m.getMenuid()
					+ " = new WebFXCheckBoxTreeItem(\"" + m.getMenuname()
					+ "\",\"" + m.getMenuid() + "\",t" + m.getPmenuid()
					+ ",null,null,");
			sb.append(checked);
			sb.append(");\n");
		}
		sb.append("document.write(t0)");
		return sb.toString();
	}

	/**
	 * 医院Tree
	 * 
	 * @param hospitals
	 * @return
	 */
	public static String getHospitalTree(List<Hospital> hospitals) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('医院列表',null);\n");
		for (Hospital h : hospitals) {
			sb.append("var t1 = new WebFXTreeItem(\"" + h.getHospitalname()
					+ "\",\"javascript:chg('" + h.getHospitalid() + "','"
					+ h.getHospitalname() + "')\"");
			sb.append(",t0);\n");
		}
		sb.append("document.write(t0)");
		return sb.toString();
	}

	/**
	 * 部门Tree
	 * 
	 * @param depts
	 * @return
	 */
	public static String getDeptTree(List<Dept> depts) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('角色列表',\"javascript:chg('0','一级角色')\");\n");
		for (Dept d : depts) {
			sb.append("var t" + d.getDeptid() + " = new WebFXTreeItem(\""
					+ d.getDeptname() + "\",\"javascript:chg('" + d.getDeptid()
					+ "','" + d.getDeptname() + "')\"");
			sb.append(",t" + d.getPdeptid() + ");\n");
		}
//		sb.append("document.write(t0)");
		return sb.toString();
	}


	/**
	 * Code tree
	 */
	public static String getCodetypeTree(List<Codetype> codetypes) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('基础数据类型列表');\n");
		for (Codetype c : codetypes) {
			sb.append("var t" + c.getCodetypeid() + " = new WebFXTreeItem(\""
					+ c.getCodetypename() + "\",\"javascript:chg('"
					+ c.getCodetypeid() + "','" + c.getCodetypename() + "','"
					+ c.getUrl() + "')\"");
			sb.append(",t0);\n");
		}
//		sb.append("document.write(t0)");
		return sb.toString();
	}

	/*	*//**
	 * 员工菜单Tree
	 * 
	 * @param list_menu
	 * @param list_em
	 * @return
	 */
	/*
	 * @SuppressWarnings("unused") public static String
	 * getEmployeeMenuTreeStr(List<Menu> list_menu,List<Employeemenu> list_em) {
	 * String checked = ""; StringBuffer sb = new StringBuffer();
	 * sb.append("var t = new WebFXTree('部门菜单列表');\n");
	 * 
	 * for (Menu m : list_menu) { // 判断是否已经赋值 checked = "false"; for
	 * (Employeemenu em : list_em) { if (em.getMenuid().equals(m.getMenuid())) {
	 * checked = "true"; break; } }
	 * 
	 * if (m.getPmenuid() == 0) { // WebFXCheckBoxTreeItem(sText, sValue,
	 * eParent, sIcon, // sOpenIcon, bChecked, disabled) sb.append("var t" +
	 * m.getMenuid() + " = new WebFXCheckBoxTreeItem(\"" + m.getMenuname() +
	 * "\",\"" + m.getMenuid() + "\",t,null,null,"); sb.append(checked);
	 * sb.append(");\n"); } else { sb.append("var t" + m.getMenuid() +
	 * " = new WebFXCheckBoxTreeItem(\"" + m.getMenuname() + "\",\"" +
	 * m.getMenuid() + "\",t" + m.getPmenuid() + ",null,null,");
	 * sb.append(checked); sb.append(");\n"); } }
	 * sb.append("document.write(t)");
	 * 
	 * return sb.toString(); }
	 */

	/**
	 * 部门员工Tree
	 * 
	 * @param list_d
	 * @param list_e
	 * @return
	 */
	public static String getDeptEmployeeTreeStr(List<Dept> list_d,
			List<Employee> list_e) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('部门员工列表');\n");
		for (Dept d : list_d) {
			sb.append("var t" + d.getDeptid() + " = new WebFXTreeItem(\""
					+ d.getDeptname() + "\",null,t" + d.getPdeptid() + ");\n");
		}
		for (Employee e : list_e) {
			sb.append("var t" + e.getEmployeeid() + " = new WebFXTreeItem(\""
					+ e.getEmployeename() + "\",\"javascript:chg('"
					+ e.getEmployeeid() + "','" + e.getEmployeename()
					+ "')\",t" + e.getDeptid() + ");\n");
		}
		sb.append("document.write(t0)");
		return sb.toString();
	}

	/**
	 * 部门医生Tree
	 * 
	 * @param list_d
	 * @param list_e
	 * @return
	 */

/*	public static String getDeptYsTreeStr(List<Dept> list_d,
			List<V_ys> list_ys) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('部门员工列表');\n");
		for (Dept d : list_d) {
			sb.append("var t" + d.getDeptid() + " = new WebFXTreeItem(\""
					+ d.getDeptname() + "\",null,t" + d.getPdeptid()
					+ ");\n");
		}
		for (V_ys ys : list_ys) {
			sb.append("var t" + ys.getEmployeeid() + " = new WebFXTreeItem(\""
					+ ys.getEmployeename() + "\",\"" + "javascript:chg('"
					+ ys.getDeptid() + "','" + ys.getDeptname() + "','"
					+ ys.getEmployeeid() + "','" + ys.getEmployeename() + "','"
					+ ys.getZcid() + "','"+ys.getZcname()+ "','" + ys.getGhfei() + "')\",t"
					+ ys.getDeptid() + ");\n");
		}
		sb.append("document.write(t0)");
		return sb.toString();
	}*/

	/**
	 * 部门医生2 Tree
	 * 
	 * @param list_d
	 * @param list_e
	 * @return
	 */

/*	public static String getDeptYsTreeStr2(List<Dept> list_d,
			List<V_ys> list_ys) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('部门员工列表');\n");
		for (Dept d : list_d) {
			sb.append("var t" + d.getDeptid() + " = new WebFXTreeItem(\""
					+ d.getDeptname() + "\",null,t" + d.getPdeptid()
					+ ");\n");
		}
		for (V_ys ys : list_ys) {
			sb.append("var t" + ys.getEmployeeid() + " = new WebFXTreeItem(\""
					+ ys.getEmployeename() + "\",\"" + "javascript:chg('"
					+ ys.getDeptno() + "','" + ys.getDeptname() + "','"
					+ ys.getEmployeeno() + "','" + ys.getEmployeename() + "','"
					+ ys.getZcid() + "','"+ys.getZcname()+ "','" + ys.getGhfei() + "')\",t"
					+ ys.getDeptid() + ");\n");
		}
		sb.append("document.write(t0)");
		return sb.toString();
	}*/
	
	/**
	 * 基础数据类型Tree
	 * 
	 * @param list
	 * @return
	 */
	/*
	 * public static String getCodetypeTree(List<Codetype> list){ StringBuffer
	 * sb = new StringBuffer();
	 * sb.append("var t = new WebFXTree(\"基础数据类型\",\"javascript:chg('0','0')\");\n"
	 * ); for (Codetype c : list) { sb.append("var t" + c.getCodetypeid() +
	 * " = new WebFXTreeItem(\"" + c.getCodetypename() + "\",\"javascript:chg('"
	 * + c.getCodetypeid() + "','" +c.getCodetypename() +
	 * "','"+c.getUrl1()+"')\",t);\n"); } sb.append("document.write(t)"); return
	 * sb.toString(); }
	 *//**
	 * 药品类型Tree
	 * 
	 * @param list
	 * @return
	 */
	/*
	 * public static String getYplxTree(List<Yplx> list){ StringBuffer sb = new
	 * StringBuffer();
	 * sb.append("var t0 = new WebFXTree(\"药品类型\",\"javascript:chg('0','0')\");\n"
	 * ); for (Yplx y : list) { sb.append("var t" + y.getYplxid() +
	 * " = new WebFXTreeItem(\"" + y.getYplxname() + "\",\"javascript:chg('" +
	 * y.getYplxid() + "','" +y.getYplxname() + "')\",t"+y.getPyplxid()+");\n");
	 * } sb.append("document.write(t0)"); return sb.toString(); }
	 */
	
	/*
	public static String getJylx(List<Jylx> list_jylx) {
		StringBuffer sb = new StringBuffer();
		sb.append("var t0 = new WebFXTree('一级分类',\"javascript:chg('0','一级分类')\");\n");
		for (Jylx y : list_jylx) {
			sb.append("var t" + y.getJylxid() + " = new WebFXTreeItem(\""
					+ "[" + y.getJm() + "]"+ y.getLxm() + "[" + y.getJylxno() + "]"
					+ "\",\"javascript:chg('" + y.getJylxid() + "','"+y.getLxm()+"')\"");
			sb.append(",t0);\n");
		}
		sb.append("document.write(t0)");
		return sb.toString();
	}
	*/

}
