{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<script type="text/javascript">
    var productCommentPostErrorMessage = '{l s='Sorry, your review cannot be posted.' d='Modules.Productcomments.Shop' js=1}';
</script>

<div id="post-product-comment-modal" uk-modal>
	<div class="uk-modal-dialog">
		<button class="uk-modal-close-default" type="button" uk-close></button>
		<div class="uk-modal-header">
			<h2>{l s='Write your review' d='Modules.Productcomments.Shop'}</h2>
		</div>
		<div class="uk-modal-body">
			<form id="post-product-comment-form" action="{$post_comment_url nofilter}" method="POST" class="uk-form-horizontal">
				<div class="uk-child-width-1-1" uk-grid>
					{if isset($product) && $product}
					<div>
						<div class="uk-card uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid>
							<div class="uk-card-media-left uk-cover-container">
                  {if isset($product) && $product}
                      {block name='product_flags'}
                          {include file="catalog/_partials/product-flags.tpl" flags=$product.flags}
                      {/block}

                      {block name='product_cover'}
												<div class="product-cover">
                            {if $product.cover}
															<img data-src="{$product.cover.bySize.home_default.url}"
															     alt="{$product.cover.legend}"
															     title="{$product.cover.legend}" loading="lazy" uk-img uk-cover>
                            {else}
															<img data-src="{$urls.no_picture_image.bySize.large_default.url nofilter}" loading="lazy" uk-img uk-cover>
                            {/if}
												</div>
                      {/block}
                  {/if}
								<canvas width="600" height="400"></canvas>
							</div>
							<div>
								<div class="uk-card-body">
									<h3 class="uk-card-title">{$product.name}</h3>
                    {block name='product_description_short'}
											<div >{$product.description_short nofilter}</div>
                    {/block}
								</div>
							</div>
						</div>
					</div>
          {/if}
					<div>
              {if $criterions|@count > 0}
								<ul class="uk-list" id="criterions_list">
                    {foreach from=$criterions item='criterion'}
											<li>
												<div class="criterion-rating">
													<label>{$criterion.name|escape:'html':'UTF-8'}:</label>
													<div
																	class="grade-stars"
																	data-grade="4"
																	data-input="criterion[{$criterion.id_product_comment_criterion}]">
													</div>
												</div>
											</li>
                    {/foreach}
								</ul>
              {/if}
					</div>
				</div>

          {if !$logged}
						<div class="uk-margin">
							<label class="uk-form-label required" for="comment_title">{l s='Title' d='Modules.Productcomments.Shop'}</label>
							<div class="uk-form-controls">
								<input class="uk-input" name="comment_title" type="text" value=""/>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label required" for="customer_name">{l s='Your name' d='Modules.Productcomments.Shop'}</label>
							<div class="uk-form-controls">
								<input class="uk-input" name="customer_name" type="text" value=""/>
							</div>
						</div>
          {else}
						<div class="uk-margin">
							<label class="uk-form-label required" for="comment_title">{l s='Title' d='Modules.Productcomments.Shop'}</label>
							<div class="uk-form-controls">
								<input class="uk-input" name="comment_title" type="text" value=""/>
							</div>
						</div>
          {/if}


				<div class="uk-margin">
					<label class="uk-form-label required" for="comment_content">{l s='Review' d='Modules.Productcomments.Shop'}</label>
					<div class="uk-form-controls">
						<textarea class="uk-textarea" name="comment_content"></textarea>
					</div>
				</div>

				<div class="uk-margin uk-child-width-1-1 " uk-grid>
					<div>
						<p class="required">{l s='Required fields' d='Modules.Productcomments.Shop'}</p>
					</div>
					<div class="post-comment-buttons uk-text-right">
						<button type="button" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-default uk-modal-close"  aria-label="{l s='Cancel' d='Modules.Productcomments.Shop'}">
                {l s='Cancel' d='Modules.Productcomments.Shop'}
						</button>
						<button type="submit" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt">
                {l s='Send' d='Modules.Productcomments.Shop'}
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

{* Comment posted modal *}
{if $moderation_active}
    {assign var='comment_posted_message' value={l s='Your comment has been submitted and will be available once approved by a moderator.' d='Modules.Productcomments.Shop'}}
{else}
    {assign var='comment_posted_message' value={l s='Your comment has been added!' d='Modules.Productcomments.Shop'}}
{/if}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
modal_id='product-comment-posted-modal'
modal_title={l s='Review sent' d='Modules.Productcomments.Shop'}
modal_message=$comment_posted_message
}

{* Comment post error modal *}
{include file='module:productcomments/views/templates/hook/alert-modal.tpl'
modal_id='product-comment-post-error'
modal_title={l s='Your review cannot be sent' d='Modules.Productcomments.Shop'}
icon='error'
}
