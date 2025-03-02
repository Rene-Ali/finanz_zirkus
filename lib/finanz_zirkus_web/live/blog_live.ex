defmodule FinanzZirkusWeb.BlogLive do
  use FinanzZirkusWeb, :live_view

  def mount(_params, _session, socket) do
    # Beispielhafte Blog-Daten (könnte später aus der DB kommen)
    articles = [
      %{
        id: 1,
        title: "Gold als Inflationsschutz?",
        content: "Gold bleibt seit Jahrhunderten wertvoll..."
      },
      %{
        id: 2,
        title: "Bitcoin: Digitales Gold?",
        content: "Bitcoin wird oft mit Gold verglichen..."
      },
      %{
        id: 3,
        title: "Aktienmärkte in der Krise",
        content: "Die Börsen schwanken, was sind die Gründe?"
      }
    ]

    {:ok, assign(socket, articles: articles, selected_article: nil)}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    article = Enum.find(socket.assigns.articles, fn a -> Integer.to_string(a.id) == id end)

    {:noreply, assign(socket, selected_article: article)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, assign(socket, selected_article: nil)}
  end

  def render(assigns) do
    ~H"""
    <div class="bg-gray-100 min-h-screen flex flex-col items-center">
      <header class="bg-gradient-to-r from-blue-900 to-yellow-500 w-full p-4 text-white text-center text-2xl font-bold">
        Finanzzirkus Blog
      </header>
      
      <section class="max-w-4xl text-center my-10 bg-white p-6 rounded-lg shadow-xl">
        <h1 class="text-4xl font-extrabold text-blue-900">Finanzblog</h1>
        
        <p class="text-gray-600 mt-4 text-lg">
          Aktuelle Marktanalysen zu Bitcoin, Gold und Wirtschaftstrends.
        </p>
      </section>
      
      <%= if @selected_article do %>
        <section class="bg-white shadow-lg p-6 rounded-lg max-w-3xl mt-4">
          <h2 class="text-2xl font-bold text-yellow-600"><%= @selected_article.title %></h2>
          
          <p class="mt-4 text-gray-700 text-lg"><%= @selected_article.content %></p>
           <a href="/blog" class="mt-6 inline-block text-blue-500 hover:underline">Zurück zum Blog</a>
        </section>
      <% else %>
        <section class="bg-white shadow-lg p-6 rounded-lg max-w-3xl mt-4">
          <h2 class="text-2xl font-bold text-yellow-600">Artikel</h2>
          
          <ul class="mt-4 space-y-4">
            <%= for article <- @articles do %>
              <li>
                <a
                  href={"/blog/#{article.id}"}
                  class="text-blue-500 hover:underline text-lg font-semibold"
                >
                  <%= article.title %>
                </a>
              </li>
            <% end %>
          </ul>
        </section>
      <% end %>
    </div>
    """
  end
end
