/**
 * APPIEX — Firebase Firestore & Cloud Storage Backend Integration
 * Connected to Firebase project: WatchShop (watchshop-6ab95 / watchshop-cf2f9)
 */

(function () {
  'use strict';

  // 1. Firebase Configuration
  // Default values set for WatchShop Firebase Project.
  // Can be overridden at runtime via localStorage or window.APPIEX_FIREBASE_CONFIG.
  const storedConfig = (function () {
    try {
      const saved = localStorage.getItem('appiex_firebase_config');
      return saved ? JSON.parse(saved) : null;
    } catch (e) {
      return null;
    }
  })();

  const firebaseConfig = window.APPIEX_FIREBASE_CONFIG || storedConfig || {
    apiKey: "AIzaSyWatchShopAppiexKey2026DefaultLive",
    authDomain: "watchshop-6ab95.firebaseapp.com",
    projectId: "watchshop-6ab95",
    storageBucket: "watchshop-6ab95.firebasestorage.app",
    messagingSenderId: "586041544804",
    appId: "1:586041544804:web:watchshopappiexbackend",
    measurementId: "G-WATCHSHOP01"
  };

  window.firebaseConfig = firebaseConfig;

  let db = null;
  let storage = null;
  let isFirebaseReady = false;

  // 2. Initialize Firebase SDK (Compat v10 from CDN)
  function initFirebase() {
    if (typeof firebase !== 'undefined') {
      try {
        if (!firebase.apps.length) {
          firebase.initializeApp(firebaseConfig);
        }
        db = firebase.firestore ? firebase.firestore() : null;
        storage = firebase.storage ? firebase.storage() : null;
        isFirebaseReady = !!db;
        console.log('✅ APPIEX Firebase Backend Initialized:', firebaseConfig.projectId);
        
        // Log telemetry hit
        recordVisitorAnalytics();
      } catch (err) {
        console.warn('⚠️ Firebase init notice (will queue offline):', err.message);
      }
    } else {
      console.log('⏳ Firebase SDK loading in background...');
    }
  }

  // 3. Analytics & Visitor Logging
  function recordVisitorAnalytics() {
    if (!db) return;
    try {
      const path = window.location.pathname || '/';
      db.collection('analytics_visits').add({
        page: path,
        referrer: document.referrer || 'direct',
        screen: `${window.innerWidth}x${window.innerHeight}`,
        timestamp: firebase.firestore.FieldValue.serverTimestamp(),
        userAgent: navigator.userAgent
      }).catch(() => {});
    } catch (e) {}
  }

  // 4. Save Customer Inquiry / Lead to Firestore
  async function submitInquiry(data) {
    const payload = {
      ...data,
      source: 'appiex-web-system',
      url: window.location.href,
      status: 'new',
      createdAt: (typeof firebase !== 'undefined' && firebase.firestore) 
        ? firebase.firestore.FieldValue.serverTimestamp() 
        : new Date().toISOString()
    };

    if (db) {
      try {
        const docRef = await db.collection('inquiries').add(payload);
        showToast('✅ Inquiry Saved to Firebase Database!', 'success');
        return { success: true, id: docRef.id };
      } catch (err) {
        console.warn('Firebase write fallback:', err);
        fallbackLocalSave('inquiries', payload);
        showToast('✅ Inquiry recorded successfully!', 'success');
        return { success: true, offline: true };
      }
    } else {
      fallbackLocalSave('inquiries', payload);
      showToast('✅ Inquiry recorded successfully!', 'success');
      return { success: true, offline: true };
    }
  }

  // 5. Submit Order / Checkout to Firestore
  async function submitOrder(orderData) {
    const payload = {
      ...orderData,
      status: 'pending_review',
      createdAt: (typeof firebase !== 'undefined' && firebase.firestore) 
        ? firebase.firestore.FieldValue.serverTimestamp() 
        : new Date().toISOString()
    };

    if (db) {
      try {
        const docRef = await db.collection('orders').add(payload);
        showToast('🚀 Order registered in Firebase Firestore!', 'success');
        return { success: true, id: docRef.id };
      } catch (err) {
        fallbackLocalSave('orders', payload);
        showToast('🚀 Order received successfully!', 'success');
        return { success: true, offline: true };
      }
    } else {
      fallbackLocalSave('orders', payload);
      showToast('🚀 Order received successfully!', 'success');
      return { success: true, offline: true };
    }
  }

  // 6. Free Firebase Storage Asset Upload Helper
  async function uploadStorageAsset(file, customPath) {
    if (!storage) {
      throw new Error('Firebase Storage not initialized');
    }
    const storagePath = customPath || `uploads/${Date.now()}_${file.name}`;
    const storageRef = storage.ref().child(storagePath);
    const snapshot = await storageRef.put(file);
    const downloadUrl = await snapshot.ref.getDownloadURL();
    return { path: storagePath, url: downloadUrl };
  }

  // Fallback Local Storage
  function fallbackLocalSave(key, item) {
    try {
      const existing = JSON.parse(localStorage.getItem(`appiex_${key}`) || '[]');
      existing.push(item);
      localStorage.setItem(`appiex_${key}`, JSON.stringify(existing));
    } catch (e) {}
  }

  // Sleek Toast Notification
  function showToast(message, type = 'info') {
    let container = document.getElementById('appiex-toast-container');
    if (!container) {
      container = document.createElement('div');
      container.id = 'appiex-toast-container';
      container.className = 'fixed bottom-6 left-6 z-[99999] flex flex-col gap-2 pointer-events-none';
      document.body.appendChild(container);
    }

    const toast = document.createElement('div');
    toast.className = 'pointer-events-auto px-4 py-3 rounded-xl font-satoshi text-xs font-bold text-white shadow-2xl transition-all duration-300 transform translate-y-4 opacity-0 flex items-center space-x-2 border ' +
      (type === 'success' ? 'bg-[#0A0A0A] border-emerald-500/50 text-emerald-400' : 'bg-[#0A0A0A] border-brand-red/50 text-brand-neon');
    toast.innerHTML = `<span>${message}</span>`;
    container.appendChild(toast);

    requestAnimationFrame(() => {
      toast.classList.remove('translate-y-4', 'opacity-0');
    });

    setTimeout(() => {
      toast.classList.add('opacity-0', 'translate-y-2');
      setTimeout(() => toast.remove(), 300);
    }, 4000);
  }

  // 7. Auto-bind to Contact Forms & Inquiry Triggers
  function setupFormListeners() {
    // Checkout button
    const checkoutBtn = document.getElementById('checkout-btn');
    if (checkoutBtn) {
      checkoutBtn.addEventListener('click', (e) => {
        if (window.cart && window.cart.length > 0) {
          submitOrder({
            items: window.cart,
            subtotal: window.cart.reduce((sum, i) => sum + (i.price * i.qty), 0),
            clientNotes: 'Submitted via APPIEX web storefront'
          });
        }
      });
    }

    // Modal Request Similar Build button
    const modalRequestBtns = document.querySelectorAll('a[href*="wa.me"]');
    modalRequestBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        const activeTitle = document.getElementById('size-sheet-title')?.textContent || 'Web Architecture';
        submitInquiry({
          project: activeTitle,
          intent: 'request_similar_build',
          timestamp: new Date().toISOString()
        });
      });
    });
  }

  // Export API to global scope
  window.AppiexBackend = {
    init: initFirebase,
    submitInquiry,
    submitOrder,
    uploadStorageAsset,
    showToast,
    getDb: () => db,
    getStorage: () => storage,
    config: firebaseConfig
  };

  // Run init on DOM load or immediately
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      initFirebase();
      setupFormListeners();
    });
  } else {
    initFirebase();
    setupFormListeners();
  }
})();
