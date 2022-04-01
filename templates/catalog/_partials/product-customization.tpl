{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if !$configuration.is_catalog && $customizations.fields}
  <div class="uk-card uk-card-default uk-card-body product-customization">
    <h3 class="uk-card-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h3>
    {l s='Don\'t forget to save your customization to be able to add to cart' d='Shop.Forms.Help'}

    {block name='product_customization_form'}
      <form method="post" action="{$product.url}" enctype="multipart/form-data" class="uk-form-stacked productCustomizationForm">
          {foreach from=$customizations.fields item="field"}
            <div class="uk-margin">
              <label class="uk-form-label" for="{$field.input_name}">{$field.label}</label>
              <div class="uk-form-controls">
                  {if $field.type == 'text'}
                      <textarea class="uk-textarea"
                                placeholder="{l s='Your message here' d='Shop.Forms.Help'}"
                                maxlength="250"
                                rows="1"
                                {if $field.required} required {/if} name="{$field.input_name}"
                      >{$field.text}</textarea>
                      <small class="uk-float-right">{l s='250 char. max' d='Shop.Forms.Help'}</small>
                      {if $field.text !== ''}
                          <div class="uk-margin-small-top">
                              <span class="uk-text-bold">{l s='Your customization:' d='Shop.Theme.Catalog'}</span>
                              {$field.text}
                          </div>
                      {/if}
                  {elseif $field.type == 'image'}
                      {if $field.is_customized}
                          <div class="uk-width-1-1 uk-margin-small productCustomizationImageUploaded" >
                            <img data-src="{$field.image.small.url}" uk-img>
                            <a id="jsModalConfirm"
                               class="remove-image"
                               href="{$field.remove_image_url}"
                               rel="nofollow"
                               data-location="product"
                               loading="lazy"
                               title="{l s='Remove Image' d='Shop.Theme.Actions'} ?" >{l s='Remove Image' d='Shop.Theme.Actions'}</a>
                          </div>
                      {/if}
                      <div class="uk-width-1-1" uk-form-custom="target: true">
                          <input type="file" name="{$field.input_name}">
                          <input class="uk-input file-input js-file-input"
                                 type="text"
                                 placeholder="{l s='No selected file' d='Shop.Forms.Help'}"
                                  {if $field.required} required {/if}
                                 disabled>
                          <small class="uk-float-right">{l s='.png .jpg .gif' d='Shop.Forms.Help'}</small>
                      </div>
                  {/if}
              </div>
            </div>
          {/foreach}
            <div class="uk-margin">
                <button class="uk-button uk-button-daniskreativwelt" type="submit" name="submitCustomizedData">
                    {l s='Save Customization' d='Shop.Theme.Actions'}
                </button>
            </div>
      </form>
    {/block}
      <small>{l s="Spezialanfertigungen oder personalisierte Bestellungen sind vom Widerruf ausgeschlossen" d="Shop.Forms.Help"}</small>
  </div>
{/if}