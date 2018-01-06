<div class="field">
    <%= f.label :comment %><br>
    <%= f.text_area :comment %>
  </div>

  <% if @product.nil? %>
    <div class="field">
      <%= f.label :product_id %><br>
      <%= f.text_field :product_id %>
    </div>

  <% else %>
    <%= f.label :product_id %><br>
    <%= f.text_field :product_id, disabled: true, value: @product.id %>

  <% end %>

  <div class="actions">
    <%= f.submit %>
  </div>
