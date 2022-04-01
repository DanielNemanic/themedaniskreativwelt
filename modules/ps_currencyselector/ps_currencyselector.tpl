{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-inline" id="_desktop_currency_selector">
    {l s='Currency:' d='Shop.Theme.Global'}
    <button type="button">{$current_currency.iso_code} {$current_currency.sign} <i class="material-icons expand-more">&#xE5C5;</i></button>
    <div uk-dropdown="mode: click">
        <ul class="uk-list">
            {foreach from=$currencies item=currency}
                <li {if $currency.current} class="current" {/if}>
                    <a title="{$currency.name}" rel="nofollow" href="{$currency.url}" class="dropdown-item">{$currency.iso_code} {$currency.sign}</a>
                </li>
            {/foreach}
        </ul>
    </div>
</div>