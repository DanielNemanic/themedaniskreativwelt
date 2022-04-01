{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="productVariants">
  {foreach from=$groups key=id_attribute_group item=group}
    <div class="product-variants uk-margin">
      {if !empty($group.attributes)}
        <label class="uk-form-label" for="group[{$id_attribute_group}]">{$group.name}</label>
        <div class="uk-form-controls">
          {if $group.group_type == 'select'}
            <select
                    class="uk-select"
                    id="group_{$id_attribute_group}"
                    data-product-attribute="{$id_attribute_group}"
                    name="group[{$id_attribute_group}]">
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
                <option value="{$id_attribute}"
                        title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
              {/foreach}
            </select>
          {elseif $group.group_type == 'color'}
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <label uk-tooltip="{$group_attribute.name}">
                <input
                        class="uk-radio variantColor"
                        type="radio"
                        data-product-attribute="{$id_attribute_group}"
                        name="group[{$id_attribute_group}]"
                        value="{$id_attribute}"
                        {if $group_attribute.selected}checked="checked"{/if}
                        title="" uk-tooltip
                        {if $group_attribute.html_color_code && !$group_attribute.texture} style="background-color: {$group_attribute.html_color_code}" {/if}
                        {if $group_attribute.texture} style="background-image: url({$group_attribute.texture})" {/if}
                >
              </label>
            {/foreach}
          {elseif $group.group_type == 'radio'}
            <ul id="group_{$id_attribute_group}">
              {foreach from=$group.attributes key=id_attribute item=group_attribute}
                <li class="input-container float-xs-left">
                  <label>
                    <input class="input-radio" type="radio" data-product-attribute="{$id_attribute_group}"
                           name="group[{$id_attribute_group}]"
                           value="{$id_attribute}"{if $group_attribute.selected} checked="checked"{/if}>
                    <span class="radio-label">{$group_attribute.name}</span>
                  </label>
                </li>
              {/foreach}
            </ul>
          {/if}
        </div>
      {/if}
    </div>
  {/foreach}
</div>