import com.studio.domian.Info;
import com.studio.service.InfoService;
import org.junit.Test;
import org.springframework.ui.Model;

import java.util.List;

public class text {

    private InfoService infoService;
    @Test
    public void findInfoBytype(Model model){
        List<Info> rolemodel= infoService.findInfoBytype("榜样力量",3);
        System.out.println(rolemodel);
    }
}
