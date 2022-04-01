{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="variant-links uk-text-center">
  {foreach from=$variants item=variant}
    <a href="{$variant.url}"
       class="{$variant.type} variant"
       title="{$variant.name}"
      {if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
      {if $variant.texture} style="background-image: url({$variant.texture})" {/if}
       uk-tooltip="{$variant.name}"
    >
    </a>
  {/foreach}
</div>
