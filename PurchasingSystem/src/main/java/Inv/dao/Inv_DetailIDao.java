package Inv.dao;

import java.util.List;

import Inv.model.Inv_DetailBean;

public interface Inv_DetailIDao {
	public abstract Inv_DetailBean select(String Inv_Part_no,String Inv__Date);

	public abstract List<Inv_DetailBean> selectall();

	public abstract Inv_DetailBean insert(Inv_DetailBean bean);

	public abstract Inv_DetailBean update(Inv_DetailBean bean);

	public abstract boolean delete(String Inv_Part_no,String Inv__Date);

	public abstract List<Inv_DetailBean> selectnv_Part_no(String Inv_Part_no);
	
	public abstract List<Inv_DetailBean> selectnv_Part_notest(String Inv_Part_no);
	
}
