package com.farmTravelPartner.model;

import java.util.List;

public interface FarmTravelPartnerDAO {
    void add(FarmTravelPartnerVO farm_travel_partner);
    void update(FarmTravelPartnerVO farm_travel_partner);
    void delete(Integer partner_ID);
    FarmTravelPartnerVO findByPK(Integer partner_ID);
    List<FarmTravelPartnerVO> getAll(Integer order_ID);
}
