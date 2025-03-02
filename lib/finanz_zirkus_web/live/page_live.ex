defmodule FinanzZirkusWeb.PageLive do
  use FinanzZirkusWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Sichere dein Vermögen vor Inflation",
       gold_price: "1850",
       btc_price: "42000"
     )}
  end

  def render(assigns) do
    ~H"""
    <div class="bg-gradient-to-b from-blue-900 to-gold-500 min-h-screen flex flex-col items-center">
      <header class="bg-gradient-to-r from-blue-900 to-yellow-500 w-full p-4 text-white text-center text-2xl font-bold">
        Finanzzirkus: Bitcoin, Gold & Marktanalysen
      </header>
      
      <section class="max-w-4xl text-center my-10 bg-white p-6 rounded-lg shadow-xl">
        <h1 class="text-5xl font-extrabold text-blue-900">Sichere dein Vermögen vor Inflation</h1>
        
        <p class="text-gray-600 mt-4 text-lg">
          Erhalte wertvolle Finanzanalysen & automatisierte Investment-Strategien.
        </p>
        
        <form phx-submit="subscribe" class="mt-6 flex justify-center">
          <input
            type="email"
            name="email"
            placeholder="Deine E-Mail"
            class="p-2 rounded-l-lg border border-gray-300 text-black"
            required
          />
          <button class="bg-yellow-500 px-4 py-2 text-white font-bold rounded-r-lg hover:bg-yellow-600">
            Jetzt abonnieren
          </button>
        </form>
      </section>
      
      <section class="bg-white shadow-lg p-6 rounded-lg max-w-3xl mt-4">
        <h2 class="text-2xl font-bold text-yellow-600">Aktuelle Gold- & Bitcoin-Kurse</h2>
        
        <div class="mt-4 text-gray-700 text-lg">
          <p class="text-lg font-semibold text-yellow-500">
            Gold: <span id="gold-price">Loading...</span> €/Unze
          </p>
          
          <p class="text-lg font-semibold text-yellow-500">
            Bitcoin: <span id="btc-price">Loading...</span> €
          </p>
        </div>
      </section>
    </div>
    """
  end

  def handle_event("subscribe", %{"email" => _email}, socket) do
    {:noreply,
     put_flash(socket, :info, "Danke für dein Interesse! Finanz-News bald in deiner Inbox.")}
  end
end
