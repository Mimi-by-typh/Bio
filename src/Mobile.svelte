<script>
  import { onMount } from 'svelte';

  let audioPlayer;
  let isPlaying = false;
  let trackName = 'i hait it';
  let artistName = 'never goodbye, overtonight';

  const links = [
    { icon: 'telegram', url: 'https://t.me/Scliper', label: 'Telegram' },
    { icon: 'github', url: 'https://github.com/Mimi-by-typh', label: 'GitHub' }
  ];

  function toggleAudio() {
    if (!audioPlayer) return;
    
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    isPlaying = !isPlaying;
  }

  onMount(() => {
    if (audioPlayer) {
      audioPlayer.addEventListener('play', () => isPlaying = true);
      audioPlayer.addEventListener('pause', () => isPlaying = false);
    }
  });
</script>

<main class="mobile-container">
  <div class="mobile-gradient"></div>
  
  <div class="mobile-content">
    <div class="mobile-avatar">
      <img src="/avatar.jpg" alt="Scliper Avatar" />
    </div>

    <h1 class="mobile-title">Scliper</h1>
    <p class="mobile-subtitle">Coder, I love DOTA</p>

    <div class="mobile-links">
      {#each links as link}
        <a href={link.url} class="mobile-link" target="_blank" rel="noopener noreferrer">
          <img src="/{link.icon}.svg" alt={link.label} class="link-icon" />
          <span>{link.label}</span>
        </a>
      {/each}
    </div>

    <div class="mobile-player">
      <audio bind:this={audioPlayer} src="/track.mp3" loop></audio>
      
      <button class="play-btn" on:click={toggleAudio}>
        {#if isPlaying}
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="6" y="4" width="4" height="16" />
            <rect x="14" y="4" width="4" height="16" />
          </svg>
        {:else}
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polygon points="5 3 19 12 5 21 5 3" />
          </svg>
        {/if}
      </button>

      <div class="track-info">
        <div class="track-name">{trackName}</div>
        <div class="artist-name">{artistName}</div>
      </div>
    </div>
  </div>
</main>

<style>
  :global(body) {
    margin: 0;
    padding: 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    overflow-x: hidden;
  }

  .mobile-container {
    min-height: 100vh;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    overflow: hidden;
  }

  .mobile-gradient {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(
      135deg,
      #1a0b2e 0%,
      #2d1b4e 20%,
      #4a2c6f 40%,
      #7b4397 60%,
      #dc2430 80%,
      #ff6b9d 100%
    );
    background-size: 400% 400%;
    animation: sunriseGradient 15s ease infinite;
    z-index: -2;
  }

  .mobile-gradient::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(
      circle,
      rgba(255, 107, 157, 0.3) 0%,
      rgba(123, 67, 151, 0.2) 30%,
      transparent 70%
    );
    animation: sunriseGlow 20s ease-in-out infinite;
  }

  @keyframes sunriseGradient {
    0%, 100% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
  }

  @keyframes sunriseGlow {
    0%, 100% {
      transform: translate(0, 0) scale(1);
      opacity: 0.5;
    }
    50% {
      transform: translate(10%, 10%) scale(1.1);
      opacity: 0.8;
    }
  }

  .mobile-content {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    max-width: 400px;
  }

  .mobile-avatar {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    overflow: hidden;
    border: 4px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    margin-bottom: 24px;
  }

  .mobile-avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .mobile-title {
    font-size: 32px;
    font-weight: 700;
    color: white;
    margin: 0 0 8px 0;
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
  }

  .mobile-subtitle {
    font-size: 16px;
    color: rgba(255, 255, 255, 0.8);
    margin: 0 0 32px 0;
    text-shadow: 0 1px 5px rgba(0, 0, 0, 0.2);
  }

  .mobile-links {
    display: flex;
    flex-direction: column;
    gap: 12px;
    width: 100%;
    margin-bottom: 32px;
  }

  .mobile-link {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 16px 20px;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 16px;
    color: white;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  }

  .mobile-link:active {
    transform: scale(0.98);
    background: rgba(255, 255, 255, 0.25);
  }

  .link-icon {
    width: 24px;
    height: 24px;
    filter: brightness(0) invert(1);
  }

  .mobile-player {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 16px 20px;
    background: rgba(0, 0, 0, 0.3);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 16px;
    width: 100%;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
  }

  .play-btn {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.3);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
    flex-shrink: 0;
  }

  .play-btn:active {
    transform: scale(0.95);
    background: rgba(255, 255, 255, 0.3);
  }

  .track-info {
    flex: 1;
    min-width: 0;
  }

  .track-name {
    font-size: 14px;
    font-weight: 600;
    color: white;
    margin-bottom: 4px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .artist-name {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.7);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  @media (prefers-reduced-motion: reduce) {
    .mobile-gradient,
    .mobile-gradient::before {
      animation: none !important;
    }
  }
</style>
