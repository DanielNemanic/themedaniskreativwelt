{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-child-width-1-1" uk-grid>
  <h4>{l s='Store information' d='Shop.Theme.Global'}</h4>
  <div uk-grid>
    <div class="uk-width-1-1">
      <span uk-icon="icon: location"></span>
      {$contact_infos.address.formatted nofilter}
    </div>
  </div>
  {if $contact_infos.phone}
    <hr/>
    <div uk-grid>
        <div class="uk-width-1-1">
          <span uk-icon="icon: telephone"></span>
          {l s='Call us:' d='Shop.Theme.Global'}<br/>
          <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
        </div>
    </div>
  {/if}
  {if $contact_infos.email}
    <hr/>
    <div uk-grid>
      <div class="uk-width-1-1">
        <span uk-icon="icon:mail"></span>{l s='Email us:' d='Shop.Theme.Global'}<br/>
        <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
      </div>
    </div>
  {/if}
</div>
