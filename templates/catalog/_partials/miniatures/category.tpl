{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='category_miniature_item'}
  <div class="category-miniature">
    <a href="{$category.url}">
      <img data-src="{$category.image.medium.url}" loading="lazy" alt="{$category.image.legend}" uk-img>
    </a>

    <h1 class="h2">
      <a href="{$category.url}">{$category.name}</a>
    </h1>

    <div class="category-description">{$category.description nofilter}</div>
  </div>
{/block}
