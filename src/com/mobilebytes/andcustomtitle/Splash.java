/*******************************************************************************
 * Copyright 2010 fredgrott
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
package com.mobilebytes.andcustomtitle;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.Window;

// TODO: Auto-generated Javadoc
/**
 * The Class Splash.
 */
public class Splash extends Activity {
    // ===========================================================
    // Fields
    // ===========================================================

    /** The SPLASH_display_length. */
    private final int splashDisplayLength = 0;

    // ===========================================================
    // "Constructors"
    // ===========================================================

    /**
     * Called when the activity is first created.
     *
     * @param icicle the icicle
     */
    @Override
    public void onCreate(Bundle icicle) {
        super.onCreate(icicle);

        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.splashscreen);

        /*
         * New Handler to start the Menu-Activity and close this Splash-Screen
         * after some seconds.
         */
        new Handler().postDelayed(new Runnable() {
            public void run() {
                /* Create an Intent that will start the Menu-Activity. */
                Intent mainIntent = new Intent(Splash.this,
                        MainActivity.class);
                Splash.this.startActivity(mainIntent);
                Splash.this.finish();
            }
        }, splashDisplayLength);

    }
}
