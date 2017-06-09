package kr.fishingboat.fishingboat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("dealDAO")
public class DealDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("deal.selectSellList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellBrokerList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("deal.selectSellBrokerList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSellBrokerDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("deal.selectSellBrokerDetail", map);
	}
	
	public void updateBrokerChk(Map<String, Object> map) throws Exception {
		update("deal.updateBrokerChk", map);
	}
	
	public void insertSellBrokerSms(Map<String, Object> map) throws Exception {
		insert("deal.insertSellBrokerSms", map);
	}
	
	public void updateBrokerChkno(Map<String, Object> map) throws Exception {
		update("deal.updateBrokerChkno", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSellDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("deal.selectSellDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellImgList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("deal.selectSellImgList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBrokerYn(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("deal.selectBrokerYn", map);
	}
	
	/*@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBrokerSatis(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("deal.selectBrokerSatis", map);
	}*/
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectSatisfaction(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("deal.selectSatisfaction", map);
	}
	
	public void insertBrokerSatis(Map<String, Object> map) throws Exception {
		insert("deal.insertBrokerSatis", map);
	}
	
	public void insertSell(Map<String, Object> map) throws Exception {
		insert("deal.insertSell", map);
	}
	
	public void insertSellSms(Map<String, Object> map) throws Exception {
		insert("deal.insertSellSms", map);
	}
	
	public void insertSellPic(Map<String, Object> map) throws Exception {
		insert("deal.insertSellPic", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectShipChk(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("deal.selectShipChk", map);
	}
	
	public void updateSell(Map<String, Object> map) throws Exception {
		update("deal.updateSell", map);
	}
	
	public void deleteSell(Map<String, Object> map) throws Exception {
		delete("deal.deleteSell", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBuyList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("deal.selectBuyList", map);
	}
	
	public void insertBuy(Map<String, Object> map) throws Exception {
		insert("deal.insertBuy", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBuyBrokerList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("deal.selectBuyBrokerList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBuyDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("deal.selectBuyDetail", map);
	}
	
	public void updateBuy(Map<String, Object> map) throws Exception {
		update("deal.updateBuy", map);
	}
	
	public void deleteBuy(Map<String, Object> map) throws Exception {
		delete("deal.deleteBuy", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDealList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("deal.selectDealList", map);
	}
	
}
