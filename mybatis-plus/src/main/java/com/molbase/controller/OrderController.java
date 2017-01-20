package com.molbase.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.molbase.model.order.Order;
import com.molbase.service.order.IOrderService;

/**
 * 
 * @date 2017年1月20日 下午5:35:00
 * @author lanlong.li
 * @desc
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

	private final IOrderService orderService;

	@Autowired
	public OrderController(IOrderService orderService) {
		this.orderService = orderService;
	}
	
    @RequestMapping("/list")
    public ModelAndView index(ModelAndView modelAndView) {
        modelAndView.setViewName("order");
        modelAndView.addObject("orderList", orderService.selectList(null));
        return modelAndView;
    }
    
    
    @RequestMapping("/preSave")
    public ModelAndView preSave(ModelAndView modelAndView, @RequestParam(value = "id", required = false) Integer id) {
        modelAndView.setViewName("order_save");
        if (id != null) {
            modelAndView.addObject("order", orderService.selectById(id));
        }
        return modelAndView;
    }
    
    @ResponseBody
    @RequestMapping("/save")
	public Object save(Order order) {
		return orderService.insert(order) ? renderSuccess("添加成功") : renderError("添加失败");
	}

    @ResponseBody
    @RequestMapping("/delete")
    public Object delete(@RequestParam(value = "id", required = false) Integer id) {
        return orderService.deleteById(id) ? renderSuccess("删除成功") : renderError("删除失败");
    }
    
    

}
