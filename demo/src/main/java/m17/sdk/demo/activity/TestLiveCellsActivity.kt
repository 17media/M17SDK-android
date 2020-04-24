package m17.sdk.demo.activity

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.RecyclerView
import com.m17ent.core.module.sdk.M17Sdk
import com.m17ent.core.module.sdk.dto.M17License
import com.m17ent.core.module.sdk.interfaces.M17LicenseCallback
import com.m17ent.core.module.sdk.interfaces.M17LiveCellBaseView
import com.m17ent.core.module.sdk.interfaces.M17LiveCellRender
import kotlinx.android.synthetic.main.test_activity_live_list.*
import m17.sdk.demo.BuildConfig
import m17.sdk.demo.R
import m17.sdk.demo.view.TestLiveCellLayout

class TestLiveCellsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.test_activity_live_list)

        infoTxtView.text = BuildConfig.VERSION_INFO

        M17Sdk.getInstance().updateExternalUserId("M17")

        M17Sdk.getInstance().getLicense(object: M17LicenseCallback {
            override fun onSuccess(license: M17License) {
                license.apply {
                    showLiveListFragment(this)
                }
            }

            override fun onError(error: String) {
            }
        })
    }

    fun showLiveListFragment(license: M17License){

        license.getM17ListFilterConfig() // default: region
        license.getM17ListFilterConfig(openRegion = true, openLabel = true, openUser = true)

        M17Sdk.getInstance().createLiveListFragment(license.getM17ListFilterConfig())?.let {

            //Customer -- START
            it.setRenderCell(object : M17LiveCellRender {
                override fun renderCell(): M17LiveCellBaseView {
                    return TestLiveCellLayout(this@TestLiveCellsActivity)
                }
            })
            //Customer -- END

            it.setOnScrollListener(object: RecyclerView.OnScrollListener(){
                override fun onScrollStateChanged(recyclerView: RecyclerView, newState: Int) {}
                override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {}
            })

            supportFragmentManager
                .beginTransaction()
                .replace(R.id.frame, it as Fragment, "TestLiveListFragment")
                .addToBackStack(null)
                .commit()
        }
    }
}