/**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 */
$(document).ready(function () {
	$.fn.loadingStart = function () {
		UIkit.modal('#modalLoading').show();
	};
	$.fn.loadingStop = function () {
		UIkit.modal('#modalLoading').hide();
	};

	function setActiveState(element) {
		$(element).parents("li").addClass('uk-active');
	}

	$.fn.sendAjax = function (event, url, data, dataType = 'JSON', showLoading = true) {
		event.preventDefault();
		if (showLoading) $(this).loadingStart();
		return $.ajax({
			type: 'POST',
			dataType: dataType,
			url: url,
			cache: false,
			data: data,
			success: function () {
				$(this).loadingStop();
			},
			error: function (err) {
				console.log(err);
				console.log(err.responseText);
			}
		});
	};
	$.fn.productLoad = function (event, url) {
		event.preventDefault();
		$(this).sendAjax(event, url, $(this).serialize()).done(function (ajax) {
			$('#productsActiveFilters').html(ajax.rendered_active_filters);
			$('#search_filters_overview').html(ajax.rendered_facets);
			$('#productsList').html(ajax.rendered_products);
			$('#productsTop').html(ajax.rendered_products_top);
			window.history.pushState(ajax, document.title, ajax.current_url);
		});
	};
	$.fn.refreshCart = function (event) {
		event.preventDefault();
		let ajaxUrl = $('.cartShortcut').attr('href');
		let ajaxRefresh = {ajax: '1', action: 'refresh'};

		this.sendAjax(event, ajaxUrl, ajaxRefresh).done(function (ajax) {
			$('.cartOverview').replaceWith(ajax.cart_detailed);
			$('.cartDetailedActions').replaceWith(ajax.cart_detailed_actions);
			$('.cartDetailedTotals').replaceWith(ajax.cart_detailed_totals);
			$('.cartSummaryTotal').replaceWith(ajax.cart_summary_totals);
			$('.cartSummaryItemsSubtotal').replaceWith(ajax.cart_summary_items_subtotal);
			$('.cartSummarySubtotalsContainer').replaceWith(ajax.cart_summary_subtotals_container);
			$('.cartVoucher').replaceWith(ajax.cart_voucher);
		});
	}
	$.fn.checkConditionsToApprove = function (event) {
		let checked = true;
		$('.conditionsToApprove').each(function () {
			if (!$(this).is(":checked"))
				checked = false;
		});

		return checked;
	}
	let delay = (function () {
		let timer = 0;
		return function (callback, ms) {
			clearTimeout(timer);
			timer = setTimeout(callback, ms);
		};
	})();

	//Search for active Childs
	if ($("header nav .uk-active").length) {
		setActiveState($("header nav .uk-active"));
	}

	$(document).on('click', '.uk-slideshow li', function (event) {
		event.preventDefault();
		let link = $(this).attr("href");
		if (link)
			window.location.href = link;
	});
	$(document).on({
		mouseenter: function (event) {
			event.preventDefault();
			$(this).find('.uk-overlay-default').removeClass('uk-hidden');
		},
		mouseleave: function (event) {
			event.preventDefault();
			$(this).find('.uk-overlay-default').addClass('uk-hidden');
		}
	}, '.productImageView');
	$(document).on('click', '#search_filters .uk-list li', function (event) {
		event.preventDefault();
		let url = $(this).attr('href');
		$(this).productLoad(event, url);
		return false;
	});
	$(document).on('click', '.js-search-filters-clear-all', function (event) {
		event.preventDefault();
		let url = $(this).attr('href');
		$(this).productLoad(event, url);
		return false;
	});
	$(document).on('change', '.productFilter', function (event) {
		event.preventDefault();
		let url = $("option:selected", this).attr('href');
		$(this).productLoad(event, url);
		return false;
	});
	$(document).on('click', '.productImageSlider', function (event) {
		event.preventDefault();
		let img = $(this).find('img');
		let imgClass = img.attr('image-id');
		$('.productImageView').find('.uk-active').toggleClass('uk-hidden').toggleClass('uk-active');
		$('.productImageView').find('.' + imgClass).toggleClass('uk-hidden').toggleClass('uk-active');
		return false;
	});
	const productAvailabilityBlock = $(document).find('.productAvailability').html();
	$(document).on('change keyup', '.productActions', function (event) {
		event.preventDefault();
		let url = '/index.php?' + $(this).serialize();
		let qtyWanted = $(this).find('.quantityWanted');
		let showLoading = true;
		let max = qtyWanted.attr('max');
		let val = qtyWanted.val();
		let data = {ajax: 1, action: 'refresh', controller: 'product', quickview: '0', quantity_wanted: val};
		qtyWanted.removeClass('uk-form-danger');

		if ($(event.target).hasClass('quantityWanted')) {
			if (Number(val) == 0 || Number(val) > Number(max)) {
				qtyWanted.addClass('uk-form-danger');
				$('.addToBasket').attr('disabled', '');
				$(this).sendAjax(event, url, data, 'JSON', showLoading).done(function (ajax) {
					$('.productAddToCart').replaceWith(ajax.product_add_to_cart);
				});
			} else {
				$('.addToBasket').removeAttr('disabled');
				$('.productAvailability').html(productAvailabilityBlock);
			}
		} else {
			$(this).sendAjax(event, url, data, 'JSON', showLoading).done(function (ajax) {
				$('.productAddToCart').replaceWith(ajax.product_add_to_cart);
				$('.productAdditionalInfo').replaceWith(ajax.product_additional_info);
				$('.productImages').html(ajax.product_cover_thumbnails);
				$('.productCustomization').html(ajax.product_customization);
				$('.productDetails').replaceWith(ajax.product_details);
				$('.productDiscounts').replaceWith(ajax.product_discounts);
				$('.productMinimalQuantity').replaceWith(ajax.product_minimal_quantity);
				$('.productPrices').replaceWith(ajax.product_prices);
				$('.productTitle').html(ajax.product_title);
				$('.productVariants').replaceWith(ajax.product_variants);
				window.history.pushState(ajax, ajax.product_title, ajax.product_url);
			});
		}
		return false;
	});
	$(document).on('click', '.addToBasket', function (event) {
		event.preventDefault();
		let form = $(this).closest('form');
		let url = form.attr('action');
		let data = form.serialize() + "&add=1&action=update";
		let qtyWanted = $(this).closest('form').find('.quantityWanted');
		let max = qtyWanted.attr('max');
		let val = qtyWanted.val();

		qtyWanted.removeClass('uk-form-danger');

		if (Number(val) == 0 || Number(val) > Number(max)) {
			qtyWanted.addClass('uk-form-danger');
			return false;
		}
		let newMax = Number(max) - Number(val);
		$(this).sendAjax(event, url, data).done(function (ajax) {
			if (ajax.success) {
				let cartUrl = $('.cartShortcut').data('refresh-url');
				let requestData = {};
				requestData = {
					id_customization: ajax.id_customization,
					id_product_attribute: ajax.id_product_attribute,
					id_product: ajax.id_product,
					action: 'add-to-cart'
				};
				$(this).sendAjax(event, cartUrl, requestData, '').done(function (ajaxCart) {
					$('.cartShortcut').replaceWith(ajaxCart.preview);
					if (ajaxCart.modal) {
						if ($('#offcanvasCart').length) {
							$('#offcanvasCart').replaceWith(ajaxCart.modal);
						} else {
							$('body').append(ajaxCart.modal);
						}
						UIkit.offcanvas('#offcanvasCart').show();
					}
					qtyWanted.attr('max', newMax);
					$('.stockQuantitiy').html(newMax);
				});
			}
		});
		return false;
	});
	$(document).on('click', '.refCheckoutCart', function (event) {
		let target = $(this).closest('div').find('.cartCheckoutQty');
		let max = target.attr('max');
		let min = target.attr('min');
		let act = target.attr('act');
		let val = target.val();
		let url = target.data('update-url');
		let op = '';
		if (Number(val) == Number(act)) {
			qty = val;
		} else if (Number(val) < Number(act)) {
			qty = act - val;
			op = 'down';
		} else {
			qty = val - act;
			op = 'up';
		}
		let data = {ajax: '1', action: 'update', qty: qty, op: op};
		target.removeClass('uk-form-danger');
		if (Number(val) == 0 || Number(val) > Number(max) || Number(val) < Number(min)) {
			target.addClass('uk-form-danger');
			return false;
		}
		target.sendAjax(event, url, data).done(function (ajax) {
			if (ajax.success) {
				$(this).refreshCart(event);
			}
		});
		return false;
	});
	$(document).on('submit', '.addVoucher', function (event) {
		event.preventDefault();
		let url = $(this).attr('action');
		let data = $(this).serialize() + "&ajax=1&action=update";
		$('.voucherCode').removeClass('uk-form-danger');
		if ($('.voucherCode').val() == '') {
			$('.voucherCode').addClass('uk-form-danger');
			return false;
		}
		$(this).sendAjax(event, url, data).done(function (ajax) {
			if (ajax.hasError) {
				$('.voucherError')
				.removeClass('uk-hidden')
				.find('.voucherErrorText')
				.text(ajax.errors[0]);
				return;
			}
			$(this).refreshCart(event);
		});
		return false;
	});

	$(document).on('click', '#jsModalConfirm', function (event) {
		event.preventDefault();
		event.target.blur();
		let target = $(this);
		let url = target.attr('href');
		UIkit.modal.confirm(target.attr('title')).then(function () {
			target.sendAjax(event, url, $(this).serialize(), 'text').done(function (ajax) {
				if (target.data('location') == 'cart') $(this).refreshCart(event);
				if (target.data('location') == 'product') $('.productCustomizationImageUploaded').remove();
				if (target.data('link-action') == 'delete-address') window.location.reload();
			});
		}, function () {
		});
	});

	$(document).on('click', '.showPassword', function (event) {
		event.preventDefault();
		const elm = $(this).closest('.uk-inline').children('input.uk-input');
		if (elm.attr('type') === 'password') {
			elm.attr('type', 'text');
			$(this).text($(this).data('textHide'));
		} else {
			elm.attr('type', 'password');
			$(this).text($(this).data('textShow'));
		}
		return false;
	});
	$(document).on('click', '.stepCompleteEdit', function (event) {
		event.preventDefault();
		const elm = $(this).closest('.checkout-step').find('.stepContent');
		elm.toggleClass('uk-hidden');
		return false;
	});
	$(document).on('change', '.paymentSelect', function (event) {
		event.preventDefault();
		const elm = $(this).closest('.paymentOption').find('.additionalInformation');
		$('.paymentOption .additionalInformation').addClass('uk-hidden');
		elm.removeClass('uk-hidden');
		return false;
	});
	$(document).on('click', '.editStep', function (event) {
		event.preventDefault();
		const elm = $(this).attr('href');
		$(document).find(elm).find('.stepContent').toggleClass('uk-hidden');
		return false;
	});
	$(document).on('change', '.conditionsToApprove', function (event) {
		event.preventDefault();
		let allChecked = $(this).checkConditionsToApprove();
		if (allChecked) {
			$('.sendOrder').removeAttr('disabled');
			$('#payment-confirmation').find('.js-alert-payment-conditions').hide();
		} else {
			$('.sendOrder').attr('disabled', '');
			$('#payment-confirmation').find('.js-alert-payment-conditions').show();
		}
	});
	$(document).on('keyup', '.searchbarInput', function (event) {
		event.preventDefault();
		const url = $(this).closest('form').attr('action');
		let val = $(this).val();
		delay(function () {
			$('.searchAutocomplete').html("<div uk-spinner=\"ratio: 2\"></div>");
			$(this).sendAjax(event, url, {s: val, resultsPerPage: 10}, 'JSON', false).done(function (ajax) {
				if (ajax.products) {
					let content = '<ul class="uk-list uk-list-divider uk-width-1-1">';
					ajax.products.forEach(function (products, index) {
						content += '<li><a href="' + products.link + '" class="uk-link-text" style="display: block;"><div uk-grid>';
						content += '<div class="uk-width-auto"><img src="' + products.cover.small.url + '" ></div>';
						content += '<div class="uk-width-expand">'+ products.name +'</div>';
						content += '</div></a></li>';
					});
					content += '</ul>';
					$('.searchAutocomplete').html(content);
				}
			});
		}, 700)
	});
	$(document).on('click', '.customerAccountItems > div', function (event) {
		event.preventDefault();
		const url = $(this).find('a').attr('href');
		window.location.href = url;
		return false;
	});
	$(document).on('submit', '.orderMessageForm', function (event) {
		const textArea = $(this).find('textarea');
		textArea.removeClass('uk-form-danger');
		if (textArea.val() == '') {
			event.preventDefault();
			textArea.addClass('uk-form-danger');
			return false;
		}
		return true;
	});
	$(document).on('click', '.uk-pagination li a', function (event) {
		event.preventDefault();
		const url = $(this).attr('href');
		var ele = document.getElementById("header");
		ele.scrollIntoView({behavior: 'smooth'});
		$(this).productLoad(event, url);
		return false;
	});
	$("#sideBarMenu").find(".noOffCanvasHide").removeClass('uk-visible@s');
});
