{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="contactForm uk-width-1-1">
  <form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if} class="uk-form-horizontal">

    {if $notifications}
      <div class="{if $notifications.nw_error}uk-alert-danger{else}uk-alert-success{/if}" uk-alert>
        <ul class="uk-list">
          {foreach $notifications.messages as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </div>
    {/if}

    {if !$notifications || $notifications.nw_error}
      <div class="form-fields">

        <div class="uk-margin">
            <h3>{l s='Contact us' d='Shop.Theme.Global'}</h3>
        </div>

        <div class="uk-margin">
          <label class="uk-form-label">{l s='Subject' d='Shop.Forms.Labels'}</label>
          <div class="uk-form-controls">
            <select name="id_contact" class="uk-select">
              {foreach from=$contact.contacts item=contact_elt}
                <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
              {/foreach}
            </select>
          </div>
        </div>

        <div class="uk-margin">
          <label class="uk-form-label">{l s='Email address' d='Shop.Forms.Labels'}</label>
          <div class="uk-form-controls">
            <input
              class="uk-input"
              name="from"
              type="email"
              value="{$contact.email}"
              placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
            >
          </div>
        </div>

        {if $contact.orders}
          <div class="uk-margin">
            <label class="uk-form-label">{l s='Order reference' d='Shop.Forms.Labels'}</label>
            <div class="uk-form-controls">
              <select name="id_order" class="uk-select">
                <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
                {foreach from=$contact.orders item=order}
                  <option value="{$order.id_order}">{$order.reference}</option>
                {/foreach}
              </select>
              <span class="uk-width-1-1">
                {l s='optional' d='Shop.Forms.Help'}
              </span>
            </div>

          </div>
        {/if}

        {if $contact.allow_file_upload}
          <div class="uk-margin">
            <label class="uk-form-label">{l s='Attachment' d='Shop.Forms.Labels'}</label>
            <div class="uk-form-controls">
              <div uk-form-custom="target: true">
                <input type="file" name="fileUpload">
                <input class="uk-input uk-form-width-medium" type="text" placeholder="Select file" disabled data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
                {l s='optional' d='Shop.Forms.Help'}
              </div>
            </div>
          </div>
        {/if}

        <div class="uk-margin">
          <label class="uk-form-label">{l s='Message' d='Shop.Forms.Labels'}</label>
          <div class="uk-form-controls">
            <textarea
              class="uk-textarea"
              name="message"
              placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
              rows="3"
            >{if $contact.message}{$contact.message}{/if}</textarea>
          </div>
        </div>

        {if isset($id_module)}
          <div class="uk-margin">
            <div class="uk-form-controls">
              {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          </div>
        {/if}

      </div>

      <div class="uk-margin">
        <style>
          input[name=url] {
            display: none !important;
          }
        </style>
        <input type="text" name="url" value=""/>
        <input type="hidden" name="token" value="{$token}" />
        <input class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" type="submit" name="submitMessage" value="{l s='Send' d='Shop.Theme.Actions'}">
      </div>
    {/if}

  </form>
</div>
