{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<label class="uk-form-label" for="form-stacked-select">{l s='Sort by:' d='Shop.Theme.Global'}</label>
<div class="uk-form-controls">
    <select class="uk-select productFilter" id="form-stacked-select">
        {foreach from=$listing.sort_orders item=sort_order}
            <option href="{$sort_order.url}" {if $sort_order.current}selected{/if}>{$sort_order.label}</option>
        {/foreach}
    </select>
</div>
