{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div>
  <p class="h3 uk-text-uppercase ">{l s='Store information' d='Shop.Theme.Global'}</p>
  {$contact_infos.address.formatted nofilter}
  {if $contact_infos.phone}
    <br>
    {* [1][/1] is for a HTML tag. *}
    {l s='Call us: [1]%phone%[/1]'
      sprintf=[
      '[1]' => '<span>',
      '[/1]' => '</span>',
      '%phone%' => $contact_infos.phone
      ]
      d='Shop.Theme.Global'
    }
  {/if}
  {if $contact_infos.fax}
    <br>
    {* [1][/1] is for a HTML tag. *}
    {l
      s='Fax: [1]%fax%[/1]'
      sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%fax%' => $contact_infos.fax
      ]
      d='Shop.Theme.Global'
    }
  {/if}
  {if $contact_infos.email}
    <br>
    {* [1][/1] is for a HTML tag. *}
    {l
      s='Email us: [1]%email%[/1]'
      sprintf=[
        '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
        '[/1]' => '</a>',
        '%email%' => $contact_infos.email
      ]
      d='Shop.Theme.Global'
    }
  {/if}
  <div class="hidden-md-up">
    <div class="title">
      <a class="h3" href="{$urls.pages.stores}">{l s='Store information' d='Shop.Theme.Global'}</a>
    </div>
  </div>
</div>
