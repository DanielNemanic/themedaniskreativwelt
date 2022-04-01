{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-width-1-1  uk-margin">
  <a class="banner" href="{$banner_link}" title="{$banner_desc}">
    {if isset($banner_img)}
      <img loading="lazy" data-src="{$banner_img}" alt="{$banner_desc}" title="{$banner_desc}" class="img-fluid" uk-img>
    {else}
      <span>{$banner_desc}</span>
    {/if}
  </a>
</div>