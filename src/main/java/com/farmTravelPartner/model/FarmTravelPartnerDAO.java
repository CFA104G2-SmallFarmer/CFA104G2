package com.farmTravelPartner.model;

import java.util.List;

public interface FarmTravelPartnerDAO {
    void add(FarmTravelPartnerVO farm_travel_partner);
    void update(FarmTravelPartnerVO farm_travel_partner);
    void delete(int partner_id);
    FarmTravelPartnerVO findByPK(int partner_id);
    List<FarmTravelPartnerVO> getAll(int order_ID);
}
