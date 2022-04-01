{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $contact_infos.phone}
  {l
    s='Call us: [1]%phone%[/1]'
    sprintf=[
      '[1]' => '<span>',
      '[/1]' => '</span>',
      '%phone%' => $contact_infos.phone
    ]
    d='Shop.Theme.Global'
  }
{else}
    <a href="{$urls.pages.contact}"><span uk-icon="mail"></span> {l s='Contact us' d='Shop.Theme.Global'}</a>
{/if}
