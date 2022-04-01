{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='address_block_item'}
  <div id="address-{$address.id}" class="uk-card uk-card-default uk-card-hover uk-card-body uk-overlay" data-id-address="{$address.id}">
    <ul class="uk-iconnav uk-overlay uk-position-top-right" style="top:10px;right:10px;">
      <li>
        <a href="{url entity=address id=$address.id}"
           class="uk-button uk-button-text"
           data-link-action="edit-address"
           title="{l s='Update' d='Shop.Theme.Actions'}">
          <span uk-icon="icon: pencil"></span>
        </a>
      </li>
      <li>
        <a href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}"
           class="uk-button uk-button-text"
           id="jsModalConfirm"
           data-link-action="delete-address"
           title="{l s='Delete' d='Shop.Theme.Actions'}">
          <span uk-icon="icon: trash"></span>
        </a>
      </li>
    </ul>
    <h4 class="uk-card-title">{$address.alias}</h4>
    <address>{$address.formatted nofilter}</address>
  </div>
{/block}
