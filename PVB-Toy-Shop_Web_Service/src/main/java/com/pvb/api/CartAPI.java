package com.pvb.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pvb.Service.impl.ApiResponse;
import com.pvb.Service.impl.AuthenticationService;
import com.pvb.Service.impl.CartService;
import com.pvb.dto.cart.AddToCartDto;
import com.pvb.dto.cart.CartDto;
import com.pvb.entity.UserEntity;

@RestController
@RequestMapping("/pvb/cart")
public class CartAPI {
	@Autowired
	CartService cartService;
	@Autowired
	AuthenticationService authenticationService;

	@PostMapping
	public ResponseEntity<ApiResponse> addToCart(@RequestBody AddToCartDto addToCartDto,
			@RequestParam("token") String token) {
		// authentication the token
		authenticationService.authenticate(token);
		// find the user
		UserEntity user = authenticationService.getUser(token);
		cartService.addToCart(addToCartDto, user);

		return new ResponseEntity<>(new ApiResponse(true, "added to cart"), HttpStatus.CREATED);

	}

	@GetMapping
	public ResponseEntity<CartDto> getCartItems(@RequestParam("token") String token) {
		// authentication the token
		authenticationService.authenticate(token);
		// find the user
		UserEntity user = authenticationService.getUser(token);
		CartDto cartDto = cartService.listCartItems(user);
		return new ResponseEntity<>(cartDto, HttpStatus.OK);
	}
	
	@PutMapping("/{cartItemId}")
	public ResponseEntity<ApiResponse> UpdateCart(@RequestParam("token") String token, @PathVariable("cartItemId") long cartItemId, @RequestBody AddToCartDto addToCartDto)  {
		// authentication the token
		authenticationService.authenticate(token);
		// find the user
		UserEntity user = authenticationService.getUser(token);
		cartService.updateCart(user, cartItemId, addToCartDto);
		return new ResponseEntity<>(new ApiResponse(true, "update to cart"), HttpStatus.OK);
	}

	@DeleteMapping("/delete/{cartItemId}")
	public ResponseEntity<ApiResponse> deleteCartItems(@PathVariable("cartItemId") long cartItemId,
			@RequestParam("token") String token) {
		// authentication the token
		authenticationService.authenticate(token);
		// find the user
		UserEntity user = authenticationService.getUser(token);
		cartService.deleteCartItems(cartItemId, user);
		
		return new ResponseEntity<>(new ApiResponse(true, "Item has been remove"), HttpStatus.OK);
		
	}

}
