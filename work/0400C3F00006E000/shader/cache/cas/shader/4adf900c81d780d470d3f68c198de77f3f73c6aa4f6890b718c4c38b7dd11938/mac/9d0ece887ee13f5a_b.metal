#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_27 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_29 [[user(locn6)]];
    float4 m_31 [[user(locn7)]];
    float4 m_33 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_24 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_24.y;
    float _55 = in.m_24.z;
    bool _59 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _67 = _63 || _65;
    float _69 = in.m_24.x;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _79 = _75 || _77;
    out.m_27.x = 0.0;
    bool _81 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _89 = _85 || _87;
    float _91 = 0.0;
    if (_67)
    {
        float _93 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _91 = _93;
    }
    float _95 = _91;
    bool _97 = _53 >= 0.100000001490116119384765625;
    bool _99 = isnan(_53);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.100000001490116119384765625);
    bool _105 = _101 || _103;
    float _107 = _53 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _109 = _53 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _111 = _53 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _113 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[32].x, _107);
    float _115 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[34].x, _109);
    float _117 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _119 = fma(2.0, _117, 0.5);
    float _121 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _123 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[33].x, _111);
    float _125 = 0.0;
    float _127 = _95;
    if (_105)
    {
        _125 = _55;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_105)
    {
        float _133 = _55 * 1.0499999523162841796875;
        _131 = _133;
    }
    float _135 = _131;
    float _137 = 0.0;
    if (_105)
    {
        _137 = _69;
    }
    float _139 = _137;
    float _141 = _139;
    if (!_105)
    {
        float _143 = _69 * 1.0499999523162841796875;
        _141 = _143;
    }
    float _145 = _141;
    float _147 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[5].w, _121);
    float _149 = _135 * _135;
    float _151 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[33].z, _123);
    float _153 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _155 = fma(2.0, _153, 0.5);
    float _157 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[32].z, _113);
    float _159 = fma(_145, _145, _149);
    float _161 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _163 = _151 * _151;
    float _165 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _167 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c4)._m0[5].w, _161);
    float _171 = _161;
    if (_105)
    {
        _171 = _53;
    }
    float _173 = _171;
    float _175 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[34].z, _115);
    float _177 = fma(_157, _157, _163);
    float _179 = _173;
    if (!_105)
    {
        float _181 = _53 + (-0.007000000216066837310791015625);
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _165 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _187 = _167 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _189 = fma(_175, _175, _177);
    float _191 = _183 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = _183 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _195 = _183 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _197 = _183 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_29.x = _169;
    out.m_29.y = _147;
    out.m_29.z = _185;
    out.m_29.w = _187;
    float _199 = sqrt(_159);
    float _201 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[7].x, _197);
    float _203 = _145 + (-0.5);
    float _205 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[7].z, _201);
    float _207 = _203 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _209 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[6].x, _195);
    float _211 = _205 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _213 = _207 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _215 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[5].x, _193);
    float _217 = _135 + (-0.5);
    float _219 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    float _221 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[6].z, _209);
    float _223 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[5].z, _215);
    float _225 = _217 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _227 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _229 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _231 = fma(_213, 10.0, _229);
    float _233 = _223 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _235 = _225 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _237 = _227 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _239 = _199 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _241 = isnan(_199);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _247 = _243 || _245;
    float _249 = _233 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _251 = _233 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _253 = _233 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _255 = _233 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _257 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _259 = fma(_235, 10.0, _257);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].x, _249);
    float _263 = _221 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    if (_67)
    {
        float _265 = _199 * _95;
        float _267 = precise::clamp(_265, 0.0, 1.0);
        _127 = _267;
    }
    float _269 = _127;
    float _271 = _231 * 0.15915493667125701904296875;
    float _273 = rsqrt(_189);
    float _275 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[10].x, _251);
    float _277 = _259 * 0.15915493667125701904296875;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[11].z, _261);
    float _281 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[8].x, _253);
    float _283 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[10].z, _275);
    float _285 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[9].x, _255);
    float _287 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[11].w, _279);
    float _289 = _271 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[8].z, _281);
    float _295 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[9].z, _285);
    float _297 = _269;
    float _299 = _281;
    if (_67)
    {
        float _301 = -_269;
        float _303 = _301 + 1.0;
        _297 = _303;
    }
    float _305 = _297;
    int _308 = as_type<int>(_305);
    if (_247)
    {
        _299 = _287;
    }
    float _310 = _299;
    float _312 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[8].w, _293);
    float _314 = _310;
    float _316 = _312;
    if (!_247)
    {
        _314 = 0.0;
    }
    float _318 = _314;
    float _320 = _277 * 6.283185482025146484375;
    float _322 = sin(_320);
    float _324 = _151 * _273;
    float _326 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[9].w, _295);
    float _328 = _312 + _318;
    out.m_31.x = _318;
    int _330 = as_type<int>(_328);
    int _332 = as_type<int>(_326);
    if (_67)
    {
        float _334 = _305 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _308 = as_type<int>(_334);
    }
    int _336 = _308;
    float _338 = fma(_291, 0.0350000001490116119384765625, _213);
    float _340 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[10].w, _283);
    float _342 = _318 * 0.5;
    float _344 = _328 * 0.5;
    out.m_33.x = _324;
    float _346 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[45].y, _340);
    float _350 = fma(_326, -0.5, _342);
    if (!_79)
    {
        _330 = 1065353216;
    }
    int _352 = _330;
    float _354 = fma(_322, -0.01750000007450580596923828125, _235);
    out.m_35.w = _318;
    out.m_37.x = _338;
    out.m_37.y = _354;
    out.m_35.x = _344;
    out.m_35.y = _350;
    out.m_39.x = 1.0;
    out.gl_Position.x = _312;
    out.gl_Position.y = _326;
    out.gl_Position.z = _348;
    out.gl_Position.w = _287;
    int _356 = _352;
    if (_67)
    {
        out.m_27.x = as_type<float>(_336);
    }
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _366 = _362 || _364;
    if (!_247)
    {
        out.gl_Position.w = 0.0;
    }
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _376 = _372 || _374;
    bool _378 = !_79;
    if (!_378)
    {
        float _380 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _382 = _135 + _380;
        float _384 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _386 = _145 + _384;
        float _388 = _382 * _382;
        float _390 = fma(_386, _386, _388);
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _394 = sqrt(_390);
        bool _396 = _394 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _398 = isnan(_394);
        bool _400 = _396 || _398;
        bool _402 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _404 = _400 || _402;
        float _406 = _394 * _392;
        int _408 = as_type<int>(_406);
        if (!_404)
        {
            float _410 = -_406;
            float _412 = _410 + 1.0;
            _316 = _412;
        }
        float _414 = _316;
        float _416 = _414;
        if (_404)
        {
            _408 = 1065353216;
        }
        int _418 = _408;
        int _420 = _418;
        if (!_404)
        {
            float _422 = _414 * _414;
            _416 = _422;
        }
        float _424 = _416;
        if (!_404)
        {
            float _426 = fma(_424, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _420 = as_type<int>(_426);
        }
        int _428 = _420;
        _356 = _428;
        if (!_404)
        {
            out.m_39.x = as_type<float>(_428);
        }
    }
    int _430 = _356;
    if (!_376)
    {
        _332 = _430;
    }
    int _432 = _332;
    bool _434 = !_376;
    int _436 = _432;
    float _438 = as_type<float>(_432);
    if (!_434)
    {
        float _440 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _442 = _135 + _440;
        float _444 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _446 = _145 + _444;
        float _448 = _442 * _442;
        float _450 = fma(_446, _446, _448);
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _454 = sqrt(_450);
        bool _456 = _454 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _458 = isnan(_454);
        bool _460 = _456 || _458;
        bool _462 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _464 = _460 || _462;
        float _466 = _454 * _452;
        float _468 = _466;
        if (!_464)
        {
            float _470 = -_466;
            float _472 = _470 + 1.0;
            _468 = _472;
        }
        float _474 = _468;
        float _476 = _474;
        if (_464)
        {
            _436 = _430;
        }
        int _478 = _436;
        int _480 = _478;
        if (!_464)
        {
            float _482 = _474 * _474;
            _476 = _482;
        }
        float _484 = _476;
        if (!_464)
        {
            float _486 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_430));
            _480 = as_type<int>(_486);
        }
        int _488 = _480;
        _438 = as_type<float>(_488);
        if (!_464)
        {
            out.m_39.x = as_type<float>(_488);
        }
    }
    float _490 = _438;
    bool _492 = !_366;
    int _494 = as_type<int>(_490);
    float _496 = _490;
    if (!_492)
    {
        float _498 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _500 = _135 + _498;
        float _502 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _504 = _145 + _502;
        float _506 = _500 * _500;
        float _508 = fma(_504, _504, _506);
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _512 = sqrt(_508);
        bool _514 = _512 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _516 = isnan(_512);
        bool _518 = _514 || _516;
        bool _520 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _522 = _518 || _520;
        float _524 = _512 * _510;
        float _526 = _524;
        if (!_522)
        {
            float _528 = -_524;
            float _530 = _528 + 1.0;
            _526 = _530;
        }
        float _532 = _526;
        float _534 = _532;
        if (!_522)
        {
            float _536 = _532 * _532;
            _534 = _536;
        }
        float _538 = _534;
        if (!_522)
        {
            float _540 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[23].x, _490);
            _494 = as_type<int>(_540);
        }
        int _542 = _494;
        _496 = as_type<float>(_542);
        if (!_522)
        {
            out.m_39.x = as_type<float>(_542);
        }
    }
    float _544 = _496;
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _546 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _548 = _135 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _552 = _145 + _550;
    float _554 = _548 * _548;
    float _556 = fma(_552, _552, _554);
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _560 = sqrt(_556);
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _570 = _566 || _568;
    float _572 = _560 * _558;
    float _574 = _572;
    if (!_570)
    {
        float _576 = -_572;
        float _578 = _576 + 1.0;
        _574 = _578;
    }
    float _580 = _574;
    float _582 = _580;
    if (!_570)
    {
        float _584 = _580 * _580;
        _582 = _584;
    }
    float _586 = _582;
    int _588 = as_type<int>(_586);
    if (!_570)
    {
        float _590 = fma(_586, (*spvDescriptorSet0.vp_c4)._m0[24].x, _544);
        _588 = as_type<int>(_590);
    }
    int _592 = _588;
    if (!_570)
    {
        out.m_39.x = as_type<float>(_592);
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_24.y;
    float _55 = in.m_24.z;
    bool _59 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _67 = _63 || _65;
    float _69 = in.m_24.x;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _79 = _75 || _77;
    out.m_27.x = 0.0;
    bool _81 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _89 = _85 || _87;
    float _91 = 0.0;
    if (_67)
    {
        float _93 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _91 = _93;
    }
    float _95 = _91;
    bool _97 = _53 >= 0.100000001490116119384765625;
    bool _99 = isnan(_53);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.100000001490116119384765625);
    bool _105 = _101 || _103;
    float _107 = _53 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _109 = _53 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _111 = _53 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _113 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[32].x, _107);
    float _115 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[34].x, _109);
    float _117 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _119 = fma(2.0, _117, 0.5);
    float _121 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _123 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[33].x, _111);
    float _125 = 0.0;
    float _127 = _95;
    if (_105)
    {
        _125 = _55;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_105)
    {
        float _133 = _55 * 1.0499999523162841796875;
        _131 = _133;
    }
    float _135 = _131;
    float _137 = 0.0;
    if (_105)
    {
        _137 = _69;
    }
    float _139 = _137;
    float _141 = _139;
    if (!_105)
    {
        float _143 = _69 * 1.0499999523162841796875;
        _141 = _143;
    }
    float _145 = _141;
    float _147 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[5].w, _121);
    float _149 = _135 * _135;
    float _151 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[33].z, _123);
    float _153 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _155 = fma(2.0, _153, 0.5);
    float _157 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[32].z, _113);
    float _159 = fma(_145, _145, _149);
    float _161 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _163 = _151 * _151;
    float _165 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _167 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c4)._m0[5].w, _161);
    float _171 = _161;
    if (_105)
    {
        _171 = _53;
    }
    float _173 = _171;
    float _175 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[34].z, _115);
    float _177 = fma(_157, _157, _163);
    float _179 = _173;
    if (!_105)
    {
        float _181 = _53 + (-0.007000000216066837310791015625);
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _165 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _187 = _167 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _189 = fma(_175, _175, _177);
    float _191 = _183 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = _183 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _195 = _183 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _197 = _183 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_29.x = _169;
    out.m_29.y = _147;
    out.m_29.z = _185;
    out.m_29.w = _187;
    float _199 = sqrt(_159);
    float _201 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[7].x, _197);
    float _203 = _145 + (-0.5);
    float _205 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[7].z, _201);
    float _207 = _203 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _209 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[6].x, _195);
    float _211 = _205 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _213 = _207 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _215 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[5].x, _193);
    float _217 = _135 + (-0.5);
    float _219 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    float _221 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[6].z, _209);
    float _223 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[5].z, _215);
    float _225 = _217 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _227 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _229 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _231 = fma(_213, 10.0, _229);
    float _233 = _223 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _235 = _225 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _237 = _227 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _239 = _199 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _241 = isnan(_199);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _247 = _243 || _245;
    float _249 = _233 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _251 = _233 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _253 = _233 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _255 = _233 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _257 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _259 = fma(_235, 10.0, _257);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].x, _249);
    float _263 = _221 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    if (_67)
    {
        float _265 = _199 * _95;
        float _267 = precise::clamp(_265, 0.0, 1.0);
        _127 = _267;
    }
    float _269 = _127;
    float _271 = _231 * 0.15915493667125701904296875;
    float _273 = rsqrt(_189);
    float _275 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[10].x, _251);
    float _277 = _259 * 0.15915493667125701904296875;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[11].z, _261);
    float _281 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[8].x, _253);
    float _283 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[10].z, _275);
    float _285 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[9].x, _255);
    float _287 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[11].w, _279);
    float _289 = _271 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[8].z, _281);
    float _295 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[9].z, _285);
    float _297 = _269;
    float _299 = _281;
    if (_67)
    {
        float _301 = -_269;
        float _303 = _301 + 1.0;
        _297 = _303;
    }
    float _305 = _297;
    int _308 = as_type<int>(_305);
    if (_247)
    {
        _299 = _287;
    }
    float _310 = _299;
    float _312 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[8].w, _293);
    float _314 = _310;
    float _316 = _312;
    if (!_247)
    {
        _314 = 0.0;
    }
    float _318 = _314;
    float _320 = _277 * 6.283185482025146484375;
    float _322 = sin(_320);
    float _324 = _151 * _273;
    float _326 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[9].w, _295);
    float _328 = _312 + _318;
    out.m_31.x = _318;
    int _330 = as_type<int>(_328);
    int _332 = as_type<int>(_326);
    if (_67)
    {
        float _334 = _305 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _308 = as_type<int>(_334);
    }
    int _336 = _308;
    float _338 = fma(_291, 0.0350000001490116119384765625, _213);
    float _340 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[10].w, _283);
    float _342 = _318 * 0.5;
    float _344 = _328 * 0.5;
    out.m_33.x = _324;
    float _346 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[45].y, _340);
    float _350 = fma(_326, -0.5, _342);
    if (!_79)
    {
        _330 = 1065353216;
    }
    int _352 = _330;
    float _354 = fma(_322, -0.01750000007450580596923828125, _235);
    out.m_35.w = _318;
    out.m_37.x = _338;
    out.m_37.y = _354;
    out.m_35.x = _344;
    out.m_35.y = _350;
    out.m_39.x = 1.0;
    out.gl_Position.x = _312;
    out.gl_Position.y = _326;
    out.gl_Position.z = _348;
    out.gl_Position.w = _287;
    int _356 = _352;
    if (_67)
    {
        out.m_27.x = as_type<float>(_336);
    }
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _366 = _362 || _364;
    if (!_247)
    {
        out.gl_Position.w = 0.0;
    }
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _376 = _372 || _374;
    bool _378 = !_79;
    if (!_378)
    {
        float _380 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _382 = _135 + _380;
        float _384 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _386 = _145 + _384;
        float _388 = _382 * _382;
        float _390 = fma(_386, _386, _388);
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _394 = sqrt(_390);
        bool _396 = _394 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _398 = isnan(_394);
        bool _400 = _396 || _398;
        bool _402 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _404 = _400 || _402;
        float _406 = _394 * _392;
        int _408 = as_type<int>(_406);
        if (!_404)
        {
            float _410 = -_406;
            float _412 = _410 + 1.0;
            _316 = _412;
        }
        float _414 = _316;
        float _416 = _414;
        if (_404)
        {
            _408 = 1065353216;
        }
        int _418 = _408;
        int _420 = _418;
        if (!_404)
        {
            float _422 = _414 * _414;
            _416 = _422;
        }
        float _424 = _416;
        if (!_404)
        {
            float _426 = fma(_424, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _420 = as_type<int>(_426);
        }
        int _428 = _420;
        _356 = _428;
        if (!_404)
        {
            out.m_39.x = as_type<float>(_428);
        }
    }
    int _430 = _356;
    if (!_376)
    {
        _332 = _430;
    }
    int _432 = _332;
    bool _434 = !_376;
    int _436 = _432;
    float _438 = as_type<float>(_432);
    if (!_434)
    {
        float _440 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _442 = _135 + _440;
        float _444 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _446 = _145 + _444;
        float _448 = _442 * _442;
        float _450 = fma(_446, _446, _448);
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _454 = sqrt(_450);
        bool _456 = _454 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _458 = isnan(_454);
        bool _460 = _456 || _458;
        bool _462 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _464 = _460 || _462;
        float _466 = _454 * _452;
        float _468 = _466;
        if (!_464)
        {
            float _470 = -_466;
            float _472 = _470 + 1.0;
            _468 = _472;
        }
        float _474 = _468;
        float _476 = _474;
        if (_464)
        {
            _436 = _430;
        }
        int _478 = _436;
        int _480 = _478;
        if (!_464)
        {
            float _482 = _474 * _474;
            _476 = _482;
        }
        float _484 = _476;
        if (!_464)
        {
            float _486 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_430));
            _480 = as_type<int>(_486);
        }
        int _488 = _480;
        _438 = as_type<float>(_488);
        if (!_464)
        {
            out.m_39.x = as_type<float>(_488);
        }
    }
    float _490 = _438;
    bool _492 = !_366;
    int _494 = as_type<int>(_490);
    float _496 = _490;
    if (!_492)
    {
        float _498 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _500 = _135 + _498;
        float _502 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _504 = _145 + _502;
        float _506 = _500 * _500;
        float _508 = fma(_504, _504, _506);
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _512 = sqrt(_508);
        bool _514 = _512 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _516 = isnan(_512);
        bool _518 = _514 || _516;
        bool _520 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _522 = _518 || _520;
        float _524 = _512 * _510;
        float _526 = _524;
        if (!_522)
        {
            float _528 = -_524;
            float _530 = _528 + 1.0;
            _526 = _530;
        }
        float _532 = _526;
        float _534 = _532;
        if (!_522)
        {
            float _536 = _532 * _532;
            _534 = _536;
        }
        float _538 = _534;
        if (!_522)
        {
            float _540 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[23].x, _490);
            _494 = as_type<int>(_540);
        }
        int _542 = _494;
        _496 = as_type<float>(_542);
        if (!_522)
        {
            out.m_39.x = as_type<float>(_542);
        }
    }
    float _544 = _496;
    if (!_89)
    {
        return out;
    }
    float _546 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _548 = _135 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _552 = _145 + _550;
    float _554 = _548 * _548;
    float _556 = fma(_552, _552, _554);
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _560 = sqrt(_556);
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _570 = _566 || _568;
    float _572 = _560 * _558;
    float _574 = _572;
    if (!_570)
    {
        float _576 = -_572;
        float _578 = _576 + 1.0;
        _574 = _578;
    }
    float _580 = _574;
    float _582 = _580;
    if (!_570)
    {
        float _584 = _580 * _580;
        _582 = _584;
    }
    float _586 = _582;
    int _588 = as_type<int>(_586);
    if (!_570)
    {
        float _590 = fma(_586, (*spvDescriptorSet0.vp_c4)._m0[24].x, _544);
        _588 = as_type<int>(_590);
    }
    int _592 = _588;
    if (!_570)
    {
        out.m_39.x = as_type<float>(_592);
    }
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_24.y;
    float _55 = in.m_24.z;
    bool _59 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _67 = _63 || _65;
    float _69 = in.m_24.x;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _79 = _75 || _77;
    out.m_27.x = 0.0;
    bool _81 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _89 = _85 || _87;
    float _91 = 0.0;
    if (_67)
    {
        float _93 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _91 = _93;
    }
    float _95 = _91;
    bool _97 = _53 >= 0.100000001490116119384765625;
    bool _99 = isnan(_53);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.100000001490116119384765625);
    bool _105 = _101 || _103;
    float _107 = _53 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _109 = _53 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _111 = _53 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _113 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[32].x, _107);
    float _115 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[34].x, _109);
    float _117 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _119 = fma(2.0, _117, 0.5);
    float _121 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _123 = fma(_69, (*spvDescriptorSet0.vp_c4)._m0[33].x, _111);
    float _125 = 0.0;
    float _127 = _95;
    if (_105)
    {
        _125 = _55;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_105)
    {
        float _133 = _55 * 1.0499999523162841796875;
        _131 = _133;
    }
    float _135 = _131;
    float _137 = 0.0;
    if (_105)
    {
        _137 = _69;
    }
    float _139 = _137;
    float _141 = _139;
    if (!_105)
    {
        float _143 = _69 * 1.0499999523162841796875;
        _141 = _143;
    }
    float _145 = _141;
    float _147 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[5].w, _121);
    float _149 = _135 * _135;
    float _151 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[33].z, _123);
    float _153 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _155 = fma(2.0, _153, 0.5);
    float _157 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[32].z, _113);
    float _159 = fma(_145, _145, _149);
    float _161 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _163 = _151 * _151;
    float _165 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _167 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _169 = fma(_155, (*spvDescriptorSet0.vp_c4)._m0[5].w, _161);
    float _171 = _161;
    if (_105)
    {
        _171 = _53;
    }
    float _173 = _171;
    float _175 = fma(_55, (*spvDescriptorSet0.vp_c4)._m0[34].z, _115);
    float _177 = fma(_157, _157, _163);
    float _179 = _173;
    if (!_105)
    {
        float _181 = _53 + (-0.007000000216066837310791015625);
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _165 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _187 = _167 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _189 = fma(_175, _175, _177);
    float _191 = _183 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _193 = _183 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _195 = _183 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _197 = _183 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    out.m_29.x = _169;
    out.m_29.y = _147;
    out.m_29.z = _185;
    out.m_29.w = _187;
    float _199 = sqrt(_159);
    float _201 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[7].x, _197);
    float _203 = _145 + (-0.5);
    float _205 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[7].z, _201);
    float _207 = _203 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _209 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[6].x, _195);
    float _211 = _205 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _213 = _207 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _215 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[5].x, _193);
    float _217 = _135 + (-0.5);
    float _219 = fma(_145, (*spvDescriptorSet0.vp_c3)._m0[4].x, _191);
    float _221 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[6].z, _209);
    float _223 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[5].z, _215);
    float _225 = _217 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _227 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[4].z, _219);
    float _229 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _231 = fma(_213, 10.0, _229);
    float _233 = _223 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _235 = _225 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _237 = _227 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    bool _239 = _199 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _241 = isnan(_199);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _247 = _243 || _245;
    float _249 = _233 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _251 = _233 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _253 = _233 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _255 = _233 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _257 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _259 = fma(_235, 10.0, _257);
    float _261 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[11].x, _249);
    float _263 = _221 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    if (_67)
    {
        float _265 = _199 * _95;
        float _267 = precise::clamp(_265, 0.0, 1.0);
        _127 = _267;
    }
    float _269 = _127;
    float _271 = _231 * 0.15915493667125701904296875;
    float _273 = rsqrt(_189);
    float _275 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[10].x, _251);
    float _277 = _259 * 0.15915493667125701904296875;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[11].z, _261);
    float _281 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[8].x, _253);
    float _283 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[10].z, _275);
    float _285 = fma(_237, (*spvDescriptorSet0.vp_c3)._m0[9].x, _255);
    float _287 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[11].w, _279);
    float _289 = _271 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[8].z, _281);
    float _295 = fma(_263, (*spvDescriptorSet0.vp_c3)._m0[9].z, _285);
    float _297 = _269;
    float _299 = _281;
    if (_67)
    {
        float _301 = -_269;
        float _303 = _301 + 1.0;
        _297 = _303;
    }
    float _305 = _297;
    int _308 = as_type<int>(_305);
    if (_247)
    {
        _299 = _287;
    }
    float _310 = _299;
    float _312 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[8].w, _293);
    float _314 = _310;
    float _316 = _312;
    if (!_247)
    {
        _314 = 0.0;
    }
    float _318 = _314;
    float _320 = _277 * 6.283185482025146484375;
    float _322 = sin(_320);
    float _324 = _151 * _273;
    float _326 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[9].w, _295);
    float _328 = _312 + _318;
    out.m_31.x = _318;
    int _330 = as_type<int>(_328);
    int _332 = as_type<int>(_326);
    if (_67)
    {
        float _334 = _305 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _308 = as_type<int>(_334);
    }
    int _336 = _308;
    float _338 = fma(_291, 0.0350000001490116119384765625, _213);
    float _340 = fma(_211, (*spvDescriptorSet0.vp_c3)._m0[10].w, _283);
    float _342 = _318 * 0.5;
    float _344 = _328 * 0.5;
    out.m_33.x = _324;
    float _346 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c4)._m0[45].y, _340);
    float _350 = fma(_326, -0.5, _342);
    if (!_79)
    {
        _330 = 1065353216;
    }
    int _352 = _330;
    float _354 = fma(_322, -0.01750000007450580596923828125, _235);
    out.m_35.w = _318;
    out.m_37.x = _338;
    out.m_37.y = _354;
    out.m_35.x = _344;
    out.m_35.y = _350;
    out.m_39.x = 1.0;
    out.gl_Position.x = _312;
    out.gl_Position.y = _326;
    out.gl_Position.z = _348;
    out.gl_Position.w = _287;
    int _356 = _352;
    if (_67)
    {
        out.m_27.x = as_type<float>(_336);
    }
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _366 = _362 || _364;
    if (!_247)
    {
        out.gl_Position.w = 0.0;
    }
    bool _368 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _370 = isnan(0.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _376 = _372 || _374;
    bool _378 = !_79;
    if (!_378)
    {
        float _380 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _382 = _135 + _380;
        float _384 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _386 = _145 + _384;
        float _388 = _382 * _382;
        float _390 = fma(_386, _386, _388);
        float _392 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _394 = sqrt(_390);
        bool _396 = _394 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _398 = isnan(_394);
        bool _400 = _396 || _398;
        bool _402 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _404 = _400 || _402;
        float _406 = _394 * _392;
        int _408 = as_type<int>(_406);
        if (!_404)
        {
            float _410 = -_406;
            float _412 = _410 + 1.0;
            _316 = _412;
        }
        float _414 = _316;
        float _416 = _414;
        if (_404)
        {
            _408 = 1065353216;
        }
        int _418 = _408;
        int _420 = _418;
        if (!_404)
        {
            float _422 = _414 * _414;
            _416 = _422;
        }
        float _424 = _416;
        if (!_404)
        {
            float _426 = fma(_424, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _420 = as_type<int>(_426);
        }
        int _428 = _420;
        _356 = _428;
        if (!_404)
        {
            out.m_39.x = as_type<float>(_428);
        }
    }
    int _430 = _356;
    if (!_376)
    {
        _332 = _430;
    }
    int _432 = _332;
    bool _434 = !_376;
    int _436 = _432;
    float _438 = as_type<float>(_432);
    if (!_434)
    {
        float _440 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _442 = _135 + _440;
        float _444 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _446 = _145 + _444;
        float _448 = _442 * _442;
        float _450 = fma(_446, _446, _448);
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _454 = sqrt(_450);
        bool _456 = _454 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _458 = isnan(_454);
        bool _460 = _456 || _458;
        bool _462 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _464 = _460 || _462;
        float _466 = _454 * _452;
        float _468 = _466;
        if (!_464)
        {
            float _470 = -_466;
            float _472 = _470 + 1.0;
            _468 = _472;
        }
        float _474 = _468;
        float _476 = _474;
        if (_464)
        {
            _436 = _430;
        }
        int _478 = _436;
        int _480 = _478;
        if (!_464)
        {
            float _482 = _474 * _474;
            _476 = _482;
        }
        float _484 = _476;
        if (!_464)
        {
            float _486 = fma(_484, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_430));
            _480 = as_type<int>(_486);
        }
        int _488 = _480;
        _438 = as_type<float>(_488);
        if (!_464)
        {
            out.m_39.x = as_type<float>(_488);
        }
    }
    float _490 = _438;
    bool _492 = !_366;
    int _494 = as_type<int>(_490);
    float _496 = _490;
    if (!_492)
    {
        float _498 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _500 = _135 + _498;
        float _502 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _504 = _145 + _502;
        float _506 = _500 * _500;
        float _508 = fma(_504, _504, _506);
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _512 = sqrt(_508);
        bool _514 = _512 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _516 = isnan(_512);
        bool _518 = _514 || _516;
        bool _520 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _522 = _518 || _520;
        float _524 = _512 * _510;
        float _526 = _524;
        if (!_522)
        {
            float _528 = -_524;
            float _530 = _528 + 1.0;
            _526 = _530;
        }
        float _532 = _526;
        float _534 = _532;
        if (!_522)
        {
            float _536 = _532 * _532;
            _534 = _536;
        }
        float _538 = _534;
        if (!_522)
        {
            float _540 = fma(_538, (*spvDescriptorSet0.vp_c4)._m0[23].x, _490);
            _494 = as_type<int>(_540);
        }
        int _542 = _494;
        _496 = as_type<float>(_542);
        if (!_522)
        {
            out.m_39.x = as_type<float>(_542);
        }
    }
    float _544 = _496;
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _546 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _548 = _135 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _552 = _145 + _550;
    float _554 = _548 * _548;
    float _556 = fma(_552, _552, _554);
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _560 = sqrt(_556);
    bool _562 = _560 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _564 = isnan(_560);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _570 = _566 || _568;
    float _572 = _560 * _558;
    float _574 = _572;
    if (!_570)
    {
        float _576 = -_572;
        float _578 = _576 + 1.0;
        _574 = _578;
    }
    float _580 = _574;
    float _582 = _580;
    if (!_570)
    {
        float _584 = _580 * _580;
        _582 = _584;
    }
    float _586 = _582;
    int _588 = as_type<int>(_586);
    if (!_570)
    {
        float _590 = fma(_586, (*spvDescriptorSet0.vp_c4)._m0[24].x, _544);
        _588 = as_type<int>(_590);
    }
    int _592 = _588;
    if (!_570)
    {
        out.m_39.x = as_type<float>(_592);
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

