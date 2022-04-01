{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file=$layout}

{block name='head_seo' prepend}
	<link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
	<meta property="og:type" content="product">
	<meta property="og:url" content="{$urls.current_url}">
	<meta property="og:title" content="{$page.meta.title}">
	<meta property="og:site_name" content="{$shop.name}">
	<meta property="og:description" content="{$page.meta.description}">
	<meta property="og:image" content="{$product.cover.large.url}">
    {if $product.show_price}
			<meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
			<meta property="product:pretax_price:currency" content="{$currency.iso_code}">
			<meta property="product:price:amount" content="{$product.price_amount}">
			<meta property="product:price:currency" content="{$currency.iso_code}">
    {/if}
    {if isset($product.weight) && ($product.weight != 0)}
			<meta property="product:weight:value" content="{$product.weight}">
			<meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
{/block}

{block name='additional_meta_information'}
	<div>
		<div itemtype="https://schema.org/Product" itemscope>
			<meta itemprop="mpn" content="{$product.reference}"/>
			<meta itemprop="name" content="{$product.name}"/>
			<link itemprop="image" href="{$product.cover.bySize.small_default.url}"/>
			<link itemprop="image" href="{$product.cover.bySize.cart_default.url}"/>
			<link itemprop="image" href="{$product.cover.bySize.home_default.url}"/>
			<meta itemprop="description" content="{$product.description_short|strip_tags}"/>
			<div itemprop="offers" itemtype="https://schema.org/AggregateOffer" itemscope>
				<meta itemprop="lowPrice" content="{$product.price_amount}"/>
				<meta itemprop="highPrice" content="{$product.regular_price}"/>
				<meta itemprop="offerCount" content="6"/>
				<meta itemprop="priceCurrency" content="{$currency.iso_code}"/>
			</div>
			<div itemprop="aggregateRating" itemtype="https://schema.org/AggregateRating" itemscope>
				<meta itemprop="reviewCount" content="{$nb_comments}"/>
				<meta itemprop="ratingValue" content="{$average_grade}"/>
			</div>
			<div itemprop="review" itemtype="https://schema.org/Review" itemscope>
				<div itemprop="author" itemtype="https://schema.org/Person" itemscope>
					<meta itemprop="name" content="DanisKreativwelt"/>
				</div>
				<div itemprop="reviewRating" itemtype="https://schema.org/Rating" itemscope>
					<meta itemprop="ratingValue" content="4"/>
					<meta itemprop="bestRating" content="5"/>
				</div>
			</div>
			<meta itemprop="sku" content="{$product.reference_to_display}"/>
			<div itemprop="brand" itemtype="https://schema.org/Brand" itemscope>
				<meta itemprop="name"
				      content="{if $product_manufacturer->name}{$product_manufacturer->name}{else}DanisKreativwelt{/if} "/>
			</div>
		</div>
	</div>
{/block}

{block name='content'}
	<div class="uk-width-1-1 uk-child-width-1-1 uk-child-width-1-2@s uk-child-width-1-3@m uk-margin-remove-top" uk-grid>
		<div class="productImages">
        {block name='page_content_container'}
            {block name='page_content'}
                {block name='product_cover_thumbnails'}
                    {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                {/block}
            {/block}
        {/block}
		</div>

		<div>
			<article class="uk-article">
          {block name='page_header_container'}
              {block name='page_header'}
								<h3 class="productTitle">{block name='page_title'}{$product.name}{/block}</h3>
              {/block}
          {/block}
				<hr>
				<div class="uk-width-1-1">
            {block name='product_prices'}
                {include file='catalog/_partials/product-prices.tpl'}
            {/block}
				</div>

          {block name='product_description_short'}
						<p>{$product.description_short nofilter}</p>
          {/block}
			</article>
		</div>

		<div>
			<div class="uk-child-width-1-1" uk-grid>
				<div class="productCustomization">
            {if $product.is_customizable && count($product.customizations.fields)}
                {block name='product_customization'}
                    {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                {/block}
            {/if}
				</div>

				<div>
          {block name='product_buy'}
						<form action="{$urls.pages.cart}" method="post" id="addToCart" class="uk-form-stacked productActions">
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
							<input type="hidden" name="id_customization" value="{$product.id_customization}"
							       id="product_customization_id">

                {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                {/block}

                {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                {/block}

                {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}

                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                {block name='product_refresh'}{/block}
						</form>
          {/block}
				</div>
			</div>
			<div>
          {block name='product_additional_info'}
              {include file='catalog/_partials/product-additional-info.tpl'}
          {/block}
			</div>
        {block name='hook_display_reassurance'}
            {hook h='displayReassurance' product=$product}
        {/block}
		</div>
	</div>
	<div class="uk-width-1-1 uk-child-width-1-1" id="catalogProductTab" uk-grid>
		<div>
        {block name='product_tabs'}
			<div class="uk-width-1-1 uk-child-width-1-3@s" uk-grid>
          {if $packItems}
              {block name='product_pack'}
								<div>
									<article class="uk-article">
										<h4 class="uk-article-title">{l s='This pack contains' d='Shop.Theme.Catalog'}</h4>
										<div class="uk-child-width-1-1" uk-grid>
                        {foreach from=$packItems item="product_pack"}
                            {block name='product_miniature'}
                                {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                            {/block}
                        {/foreach}
										</div>
								</div>
              {/block}
          {/if}

          {if $product.description}
						<div id="description">
							<article class="uk-article">
								<h1 class="uk-article-title">{l s='Description' d='Shop.Theme.Catalog'}</h1>
							</article>
                {block name='product_description'}
									<div class="productDescription">{$product.description nofilter}</div>
                {/block}
						</div>
          {/if}

          {block name='product_details'}
						<div>
							<article class="uk-article">
								<h1 class="uk-article-title">{l s='Product Details' d='Shop.Theme.Catalog'}</h1>
                  {include file='catalog/_partials/product-details.tpl'}
							</article>
						</div>
          {/block}

          {block name='product_attachments'}
              {if $product.attachments}
								<article id="attachments" class="uk-article productAttachments">
									<h1 class="uk-article-title">{l s='Download' d='Shop.Theme.Actions'}</h1>
									<table class="uk-table uk-table-striped">
										<tbody>
                    {foreach from=$product.attachments item=attachment}
											<tr>
												<td>{$attachment.name}</td>
												<td>{$attachment.description}</td>
												<td>
													<a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}"
													   class="uk-link-text">
                              {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
													</a>
												</td>
											</tr>
                    {/foreach}
										</tbody>
									</table>
								</article>
              {/if}
          {/block}

          {foreach from=$product.extraContent item=extra key=extraKey}
				<div>
					<article class="uk-article">
						<h1 class="uk-article-title">{$extra.title}</h1>
						<div id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
              {$extra.content nofilter}
				</div>
				</article>
			</div>
        {/foreach}
		</div>

		<div class="uk-width-1-1" uk-grid>
			<div id="displayCommentsProducts">
          {hook h='displayCommentsProducts'}
			</div>
		</div>
      {/block}
	</div>
	</div>
	<div class="uk-width-1-1 uk-child-width-1-1 uk-grid-margin" uk-grid itemscope itemtype="https://schema.org/Product">
		<meta itemprop="url" content="{$product.url}">
      {block name='product_accessories'}
          {if $accessories}
						<div class="productAccessories clearfix">
							<h5 class="uk-text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</h5>
							<div class="uk-child-width-1-2 uk-child-width-1-3@m uk-margin miniProductCard" uk-grid
							     uk-height-match="target: > div > .uk-card">
                  {foreach from=$accessories item="product_accessory"}
                      {block name='product_miniature'}
												<div>
                            {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
												</div>
                      {/block}
                  {/foreach}
							</div>
						</div>
          {/if}
      {/block}

      {block name='product_footer'}
          {hook h='displayFooterProduct' product=$product category=$category}
      {/block}
	</div>
{/block}
