{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<form action="#">
  <select onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);" class="uk-select">
    <option value="">{l s='All suppliers' d='Shop.Theme.Catalog'}</option>
    {foreach from=$suppliers item=supplier}
      <option value="{$supplier['link']}">{$supplier['name']}</option>
    {/foreach}
  </select>
</form>
