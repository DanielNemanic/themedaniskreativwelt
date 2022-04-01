{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="productOverlay uk-inline uk-text-center uk-width-1-1 productImageView" uk-lightbox="animation: slide">
    {foreach from=$product.images item=image}
			<div class="{$image.id_image} {if $image@index != 0}uk-hidden{else}uk-active{/if}">
          {include file="catalog/_partials/product-flags.tpl" flags=$product.flags}
				<a href="{$image.bySize.large_default.url}" data-caption="{$image.id_image}">
					<img
							class="uk-width-1-1"
							data-src="{$image.bySize.large_default.url}"
							alt="{$image.legend}"
							title="{$image.legend}"
							loading="lazy"
							itemprop="image"
							uk-img
					>
					<div class="uk-overlay-default uk-position-cover uk-hidden">
						<div class="uk-position-center">
							<span uk-icon="icon: search;ratio: 2"></span>
						</div>
					</div>
				</a>
			</div>
    {/foreach}
</div>
<div class="uk-margin-top" uk-slider>
	<div class="uk-position-relative uk-visible-toggle" tabindex="-1">
		<ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m">
        {foreach from=$product.images item=image}
					<li>
						<a href="#" class="productImageSlider">
							<img
											class=""
											data-image-home-src="{$image.bySize.home_default.url}"
											data-image-medium-src="{$image.bySize.medium_default.url}"
											data-image-large-src="{$image.bySize.large_default.url}"
											image-id="{$image.id_image}"
											src="{$image.bySize.small_default.url}"
											alt="{$image.legend}"
											title="{$image.legend}"
											loading="lazy"
											itemprop="image"
							>
						</a>
					</li>
        {/foreach}
		</ul>
		<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
		<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
	</div>
	<ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>
</div>

{hook h='displayAfterProductThumbs'}