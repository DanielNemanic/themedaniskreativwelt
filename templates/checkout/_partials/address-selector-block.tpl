{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='address_selector_blocks'}
<div class="uk-child-width-1-1 uk-child-width-1-2@s" uk-grid>
  {foreach $addresses as $address}
      <div class="uk-card uk-card-default {if $address.id == $selected} uk-card-primary{/if} uk-card-hover ">
        <div
          class="uk-card-body address-item"
          id="{$name|classname}-address-{$address.id}"
        >
            <label class="radio-block">
                <input
                  class="uk-radio"
                  type="radio"
                  name="{$name}"
                  value="{$address.id}"
                  {if $address.id == $selected}checked{/if}
                >
                {$address.alias}
                <div>{$address.formatted nofilter}</div>
            </label>
        </div>
        <div class="uk-card-footer">
          {if $interactive}
            <a
              class="uk-button uk-button-text"
              data-link-action="edit-address"
              href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}"
            >
              <span uk-icon="icon:pencil"></span>{l s='Edit' d='Shop.Theme.Actions'}
            </a>
            <a
              class="uk-button uk-button-text"
              data-link-action="delete-address"
              href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}"
            >
              <span uk-icon="icon:trash"></span>{l s='Delete' d='Shop.Theme.Actions'}
            </a>
          {/if}
        </div>
      </div>
  {/foreach}
</div>
  {if $interactive}
    <p>
      <button class="ps-hidden-by-js form-control-submit center-block" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
    </p>
  {/if}
{/block}
