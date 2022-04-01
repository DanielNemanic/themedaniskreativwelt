{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="content" class="uk-width-1-1">
  {block name='page_content'}

    <h2>{l s='Sorry for the inconvenience.' d='Shop.Theme.Global'}</h2>
    <p>{l s='Search again what you are looking for' d='Shop.Theme.Global'}</p>

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}

    <a href="{$urls.base_url}" class="uk-button uk-button-text">{l s="Home" d="Shop.Theme.Global"}</a>
  {/block}
</div>
