{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<form action="#" class="brandForm">
  <select onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);" class="uk-select">
    <option value="">{l s='All brands' d='Shop.Theme.Catalog'}</option>
    {foreach from=$brands item=brand}
      <option value="{$brand['link']}">{$brand['name']}</option>
    {/foreach}
  </select>
</form>
