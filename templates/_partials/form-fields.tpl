{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}

{else}
    <div class="uk-margin">
        {if $field.name != 'psgdpr'}
            <label class="uk-form-label {if $field.required} required{/if}" for="form-horizontal-text">
                {if $field.type !== 'checkbox'}
                    {$field.label}
                {/if}
                {block name='form_field_comment'}
                    {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
                        <span class="uk-text-small">{l s='Optional' d='Shop.Forms.Labels'}</span>
                    {/if}
                {/block}
            </label>
        {/if}

        <div class="uk-form-controls{if ($field.type === 'radio-buttons')} form-control-valign{/if}">
            {if $field.type === 'select'}

                {block name='form_field_item_select'}
                  <select class="uk-select" name="{$field.name}" {if $field.required}required{/if}>
                    <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                    {foreach from=$field.availableValues item="label" key="value"}
                      <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                    {/foreach}
                  </select>
                {/block}

            {elseif $field.type === 'countrySelect'}

                {block name='form_field_item_country'}
                  <select
                  class="uk-select"
                  name="{$field.name}"
                  {if $field.required}required{/if}
                  >
                    <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                    {foreach from=$field.availableValues item="label" key="value"}
                      <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                    {/foreach}
                  </select>
                {/block}

            {elseif $field.type === 'radio-buttons'}

                {block name='form_field_item_radio'}
                  {foreach from=$field.availableValues item="label" key="value"}
                    <label>
                        <input
                          class="uk-radio"
                          name="{$field.name}"
                          type="radio"
                          value="{$value}"
                          {if $field.required}required{/if}
                          {if $value eq $field.value} checked {/if}
                        >
                      {$label}
                    </label>
                  {/foreach}
                {/block}

              {elseif $field.type === 'checkbox'}

                {block name='form_field_item_checkbox'}
                    <label class="{if $field.required}required{/if}">
                      <input class="uk-checkbox" name="{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} >
                      {$field.label nofilter}
                    </label>
                {/block}

              {elseif $field.type === 'date'}

                {block name='form_field_item_date'}
                  <input name="{$field.name}" class="uk-input" type="date" value="{$field.value}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}">
                  {if isset($field.availableValues.comment)}
                    <span class="form-control-comment">
                      {$field.availableValues.comment}
                    </span>
                  {/if}
                {/block}

              {elseif $field.type === 'birthday'}

                {block name='form_field_item_birthday'}
                  <div class="js-parent-focus">
                    {html_select_date
                    field_order=DMY
                    time={$field.value}
                    field_array={$field.name}
                    prefix=false
                    reverse_years=true
                    field_separator='<br>'
                    day_extra='class="form-control form-control-select"'
                    month_extra='class="form-control form-control-select"'
                    year_extra='class="form-control form-control-select"'
                    day_empty={l s='-- day --' d='Shop.Forms.Labels'}
                    month_empty={l s='-- month --' d='Shop.Forms.Labels'}
                    year_empty={l s='-- year --' d='Shop.Forms.Labels'}
                    start_year={'Y'|date}-100 end_year={'Y'|date}
                    }
                  </div>
                {/block}

              {elseif $field.type === 'password'}

                {block name='form_field_item_password'}
                    <div class="uk-inline uk-width-1-1">
                        <a href="#" class="uk-form-icon showPassword" uk-icon="icon: unlock" title="{l s='Show' d='Shop.Theme.Actions'}"></a>
                        <input
                            class="uk-input form-control js-child-focus js-visible-password"
                            name="{$field.name}"
                            title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
                            type="password"
                            value=""
                            pattern=".{literal}{{/literal}5,{literal}}{/literal}"
                            {if $field.required}required{/if}
                        >
                    </div>
                {/block}

              {else}

                {block name='form_field_item_other'}
                  <input
                    class="uk-input"
                    name="{$field.name}"
                    type="{$field.type}"
                    value="{$field.value}"
                    {if isset($field.availableValues.placeholder)}placeholder="{$field.availableValues.placeholder}"{/if}
                    {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
                    {if $field.required}required{/if}
                  >
                  {if isset($field.availableValues.comment)}
                    <span class="form-control-comment">
                      {$field.availableValues.comment}
                    </span>
                  {/if}
                {/block}

              {/if}

              {block name='form_field_errors'}
                {include file='_partials/form-errors.tpl' errors=$field.errors}
              {/block}

        </div>

    </div>
{/if}
