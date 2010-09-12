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
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.TextView;

/**
 * To detail the UI quirks to get a decent
 * customized title bar for Android Java Application Development. In this
 * version we are using non-java-reflection methods to customize the
 * bar color, etc although given improvements in JIT speeds at some point
 * one could resort to using purely java-reflection to get the same
 * effects.
 *
 * To get rid of the title flash we are setting the application tag in the
 * AndroidManifest.xml file to android:theme="@android:style/Theme.NoTitleBar"
 * which is pointing to referencing the Android OS defined Theme.NoTitleBar
 * and than we specify our title Theme in the activity tag.
 *
 * However, this usually only decreases the time of the brief non customized
 * title flash. We usually put a brief splash activity in front with a call to
 * requestWindowFeature to set to NoTitle in the onCreate of the
 * Splash activity. But this alone does not work as you have to add
 * NoTitle theme to application tag and set splash to 1 millisecond to get rid
 * of the title flash.
 *
 * @author fredgrott
 *
 */
public class MainActivity extends Activity {

    /**
     * Called when the activity is first created.
     *
     * @param savedInstanceState the saved instance state
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        /**
         * Enables the calling of extended window features and its
         * required to have this before a getWindow().setFeatureInt
         * call.
         *
         */
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);

        /**
         * Because we can use the Window.FEATURE_CUSTOM_TITLE extended features
         * we can define both a content layout(main.xml) and a title layout
         * which will be used in this call later:
         *
         * getWindow().setFeatureInt(Window.FEATURE_CUSTOM_TITLE, R.layout.title);
         *
         * We will still get a brief flash of the title as theme takes time to inflate
         * while onCreate is executing. We normally handle this by putting a
         * brief splash activity in front of the application entry point activity.
         *
         */
        setContentView(R.layout.main);



        /**
         * We load our customtitle layout here.
         */
        getWindow().setFeatureInt(Window.FEATURE_CUSTOM_TITLE, R.layout.title);

        /**
         * TextView is updated on the UI thread so once we set the title,
         * its persistent throughout the life-cylce of the application.
         */
        ((TextView) findViewById(R.id.title)).setText("Custom Status Bar");

        /**
         * Once we have grabbed the View labled back we can set an OnClickListener
         * to respond to key/touch events.
         */
        findViewById(R.id.back).setOnClickListener(new OnClickListener() {

            public void onClick(View v) {
                dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN,
                        KeyEvent.KEYCODE_BACK));
                dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP,
                        KeyEvent.KEYCODE_BACK));
            }
        });

    }
}
