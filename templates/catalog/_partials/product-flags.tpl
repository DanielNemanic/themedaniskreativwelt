{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='product_flags'}
    {foreach from=$flags item=flag}
        <div class="uk-card-badge uk-label {$flag.type}">{$flag.label}</div>
    {/foreach}
{/block}
