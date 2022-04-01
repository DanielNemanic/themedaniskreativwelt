{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-inline" id="_desktop_language_selector">
    <button type="button" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">
        {$current_language.name_simple}
        <span uk-icon="icon: triangle-down" ></span>
    </button>
    <div uk-dropdown="mode: click">
        <ul class="uk-list">
            {foreach from=$languages item=language}
                <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
                    <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item" data-iso-code="{$language.iso_code}">{$language.name_simple}</a>
                </li>
            {/foreach}
        </ul>
    </div>
</div>
