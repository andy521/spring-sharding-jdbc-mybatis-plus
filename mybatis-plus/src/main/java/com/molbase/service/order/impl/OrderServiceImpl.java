package com.molbase.service.order.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.molbase.mapper.order.OrderMapper;
import com.molbase.model.order.Order;
import com.molbase.service.order.IOrderService;

/**
 * 
 * @date 2017年1月20日 下午5:36:34
 * @author lanlong.li
 * @desc
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements
		IOrderService {

}
