{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="order-items" class="uk-width-1-1">
	<div class="uk-overflow-auto">
		<table class="uk-table uk-table-divider uk-table-middle">
        {block name='order_items_table_head'}
					<thead>
					<tr>
						<th class="uk-table-expand">{l s='Order items' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Unit price' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Quantity' d='Shop.Theme.Checkout'}</th>
						<th>{l s='Total products' d='Shop.Theme.Checkout'}</th>
					</tr>
					</thead>
        {/block}
        {block name='order_confirmation_table'}
					<tbody>
          {foreach from=$products item=product}
						<tr>
							<td>
								<div class="" uk-grid>
									<div class="uk-width-1-3">
										<img loading="lazy" data-src="{$product.cover.small.url}" uk-img/>
									</div>
									<div class="uk-width-2-3">
                      {if $add_product_link}<a href="{$product.url}" class="uk-button uk-button-text"
											                         target="_blank">{/if}
											<div class="uk-width-1-1 uk-margin-remove uk-padding-remove">{$product.name}</div>
                          {if $add_product_link}</a>{/if}
                      {foreach from=$product.attributes key="attribute" item="value"}
												<div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
													<b>{$attribute}:</b> {$value}
												</div>
                      {/foreach}
										<div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
                        {if is_array($product.customizations) && $product.customizations|count}
                            {foreach from=$product.customizations item="customization"}
															<button class="uk-button uk-button-text"
															        type="button">{l s='Product customization' d='Shop.Theme.Catalog'}</button>
															<div class="uk-width-large" uk-dropdown>
																<div class="uk-dropdown-grid uk-child-width-1-1" uk-grid>
																	<h4>{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
																</div>
                                  {foreach from=$customization.fields item="field"}
																		<div class="uk-dropdown-grid uk-child-width-1-2@s" uk-grid>
																			<div>
                                          {$field.label}
																			</div>
																			<div>
                                          {if $field.type == 'text'}
                                              {if (int)$field.id_module}
                                                  {$field.text nofilter}
                                              {else}
                                                  {$field.text}
                                              {/if}
                                          {elseif $field.type == 'image'}
																						<img loading="lazy" data-src="{$field.image.small.url}" uk-img>
                                          {/if}
																			</div>
																		</div>
                                  {/foreach}
															</div>
                            {/foreach}
                        {/if}
										</div>
                      {hook h='displayProductPriceBlock' product=$product type="unit_price"}
									</div>
								</div>
							</td>
							<td>{$product.price}</td>
							<td>{$product.quantity}</td>
							<td class="uk-text-bold">{$product.total}</td>
						</tr>
          {/foreach}
					</tbody>
        {/block}
		</table>
	</div>

	<hr>

	<div class="orderConfirmationTable uk-width-1-1">
      {block name='order_confirmation_table'}
				<div class="uk-grid-small uk-child-width-1-2 " uk-grid>
            {foreach $subtotals as $subtotal}
                {if $subtotal.type !== 'tax' && $subtotal.label !== null}
									<div>{$subtotal.label}</div>
									<div>{if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}</div>
                {/if}
            {/foreach}

            {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
							<div class="uk-text-uppercase">{$totals.total.label}&nbsp;{$labels.tax_short}</div>
							<div>{$totals.total.value}</div>
							<div class="uk-text-uppercase">{$totals.total_including_tax.label}</div>
							<div>{$totals.total_including_tax.value}</div>
            {else}
							<div class="uk-text-uppercase">{$totals.total.label}
								&nbsp;{if $configuration.taxes_enabled}{$labels.tax_short}{/if}</div>
							<div class="uk-text-bold">{$totals.total.value}</div>
            {/if}
            {if $subtotals.tax.label !== null}
							<div>{l s='%label%:' sprintf=['%label%' => $subtotals.tax.label] d='Shop.Theme.Global'}</div>
							<div class="value">{$subtotals.tax.value}</div>
            {/if}
				</div>
      {/block}
	</div>

</div>
