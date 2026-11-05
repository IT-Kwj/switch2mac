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
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_29 [[user(locn3)]];
    float4 m_27 [[user(locn4)]];
    float4 m_35 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_24.y;
    float _53 = in.m_24.x;
    float _55 = in.m_24.z;
    float _57 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _59 = fma(2.0, _57, 1.0);
    float _61 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _63 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _65 = fma(2.0, _63, 1.0);
    float _67 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    out.m_27.x = 1.0;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _79 = _75 || _77;
    bool _81 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _89 = _85 || _87;
    out.m_29.x = 0.0;
    bool _91 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _99 = _95 || _97;
    bool _101 = _51 >= 0.100000001490116119384765625;
    bool _103 = isnan(_51);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.100000001490116119384765625);
    bool _109 = _105 || _107;
    float _111 = 0.0;
    float _113 = _51;
    int _116 = 1056964608;
    if (_79)
    {
        float _118 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _111 = _118;
    }
    float _120 = _111;
    if (!_109)
    {
        float _122 = _51 + (-0.007000000216066837310791015625);
        _113 = _122;
    }
    float _124 = _113;
    float _126 = _53;
    if (!_109)
    {
        float _128 = _53 * 1.0499999523162841796875;
        _126 = _128;
    }
    float _130 = _126;
    float _132 = _55;
    if (!_109)
    {
        float _134 = _55 * 1.0499999523162841796875;
        _132 = _134;
    }
    float _136 = _132;
    float _138 = _124 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _140 = _124 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _142 = _136 * _136;
    float _144 = _130 + (-0.5);
    float _146 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[5].x, _138);
    float _148 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[4].x, _140);
    float _150 = fma(_130, _130, _142);
    float _152 = _124 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _154 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[5].z, _146);
    float _156 = _136 + (-0.5);
    float _158 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[4].z, _148);
    float _160 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[6].x, _152);
    float _162 = _154 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _164 = sqrt(_150);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _168 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[6].z, _160);
    float _170 = _162 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _172 = _59 + _144;
    float _174 = _65 + _156;
    float _176 = _168 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _178 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].x, _170);
    float _180 = _61 + _172;
    float _182 = _67 + _174;
    float _184 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _186 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _188 = fma(2.0, _186, 0.5);
    float _190 = -_61;
    float _192 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[26].y, _190);
    float _194 = -_67;
    float _196 = fma(_182, (*spvDescriptorSet0.vp_c4)._m0[26].y, _194);
    float _198 = fma(_176, (*spvDescriptorSet0.vp_c3)._m0[11].z, _178);
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _202 = fma(2.0, _200, 0.5);
    float _204 = _192 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _206 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _208 = _124 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _210 = fma(_202, (*spvDescriptorSet0.vp_c4)._m0[5].w, _184);
    float _212 = _204 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _214 = _196 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _216 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[5].w, _206);
    float _218 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[7].x, _208);
    float _220 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _222 = fma(_212, 10.0, _220);
    float _224 = _214 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _226 = _164 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _228 = isnan(_164);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _234 = _230 || _232;
    float _236 = _65 * _65;
    float _238 = _222 * 0.15915493667125701904296875;
    float _240 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _242 = fma(_224, 10.0, _240);
    float _244 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[7].z, _218);
    float _246 = fma(_59, _59, _236);
    float _248 = _242 * 0.15915493667125701904296875;
    float _250 = _238 * 6.283185482025146484375;
    float _252 = sin(_250);
    float _254 = _244 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _256 = fma(_130, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _258 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _260 = _136 * 0.89999997615814208984375;
    float _262 = fma(_254, (*spvDescriptorSet0.vp_c3)._m0[11].w, _198);
    float _264 = fma(_136, -0.449999988079071044921875, 0.5);
    float _266 = fma(_256, 0.5, 0.5);
    float _268 = _248 * 6.283185482025146484375;
    float _270 = sin(_268);
    float _272 = _258 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    out.gl_Position.x = _256;
    out.gl_Position.y = _260;
    out.gl_Position.z = 1.0;
    out.m_31.x = _266;
    out.m_31.y = _264;
    float _274 = _67;
    int _276 = as_type<int>(_256);
    float _278 = _210;
    float _280 = _216;
    int _282 = as_type<int>(_216);
    if (_79)
    {
        float _284 = sqrt(_246);
        _274 = _284;
    }
    float _286 = _274;
    float _288 = fma(_252, 0.0350000001490116119384765625, _212);
    if (!_89)
    {
        _276 = 1065353216;
    }
    int _290 = _276;
    float _292 = fma(_270, -0.01750000007450580596923828125, _224);
    float _294 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    int _296 = _290;
    if (_234)
    {
        _116 = as_type<int>(_262);
    }
    int _298 = _116;
    int _300 = _298;
    if (!_234)
    {
        _300 = 0;
    }
    int _302 = _300;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    out.m_33.x = _288;
    out.m_33.y = _292;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _314 = _310 || _312;
    float _316 = _286;
    if (_79)
    {
        float _318 = _286 * _120;
        float _320 = precise::clamp(_318, 0.0, 1.0);
        _316 = _320;
    }
    float _322 = _316;
    out.m_35.x = _210;
    out.m_35.y = _216;
    out.m_35.z = _304;
    out.m_35.w = _272;
    float _324 = _322;
    if (_79)
    {
        float _326 = -_322;
        float _328 = _326 + 1.0;
        _324 = _328;
    }
    float _330 = _324;
    out.m_37.x = as_type<float>(_302);
    int _332 = as_type<int>(_330);
    if (_79)
    {
        float _334 = _330 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _332 = as_type<int>(_334);
    }
    int _336 = _332;
    if (_79)
    {
        out.m_29.x = as_type<float>(_336);
    }
    bool _338 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _346 = _342 || _344;
    bool _348 = !_89;
    if (!_348)
    {
        float _350 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _352 = _65 + _350;
        float _354 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _356 = _59 + _354;
        float _358 = _352 * _352;
        float _360 = fma(_356, _356, _358);
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _364 = sqrt(_360);
        bool _366 = _364 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _374 = _370 || _372;
        float _376 = _364 * _362;
        int _378 = as_type<int>(_376);
        if (!_374)
        {
            float _380 = -_376;
            float _382 = _380 + 1.0;
            _278 = _382;
        }
        float _384 = _278;
        if (_374)
        {
            _378 = 1065353216;
        }
        int _386 = _378;
        int _388 = _386;
        if (!_374)
        {
            float _390 = _384 * _384;
            _280 = _390;
        }
        float _392 = _280;
        _282 = as_type<int>(_392);
        if (!_374)
        {
            float _394 = fma(_392, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _388 = as_type<int>(_394);
        }
        int _396 = _388;
        _296 = _396;
        if (!_374)
        {
            out.m_27.x = as_type<float>(_396);
        }
    }
    int _398 = _296;
    int _400 = _282;
    int _402 = _400;
    if (!_314)
    {
        _402 = _398;
    }
    int _404 = _402;
    bool _406 = !_314;
    int _408 = _404;
    float _410 = as_type<float>(_404);
    if (!_406)
    {
        float _412 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _414 = _65 + _412;
        float _416 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _418 = _59 + _416;
        float _420 = _414 * _414;
        float _422 = fma(_418, _418, _420);
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _426 = sqrt(_422);
        bool _428 = _426 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _430 = isnan(_426);
        bool _432 = _428 || _430;
        bool _434 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _436 = _432 || _434;
        float _438 = _426 * _424;
        float _440 = _438;
        if (!_436)
        {
            float _442 = -_438;
            float _444 = _442 + 1.0;
            _440 = _444;
        }
        float _446 = _440;
        float _448 = _446;
        if (_436)
        {
            _408 = _398;
        }
        int _450 = _408;
        int _452 = _450;
        if (!_436)
        {
            float _454 = _446 * _446;
            _448 = _454;
        }
        float _456 = _448;
        if (!_436)
        {
            float _458 = fma(_456, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_398));
            _452 = as_type<int>(_458);
        }
        int _460 = _452;
        _410 = as_type<float>(_460);
        if (!_436)
        {
            out.m_27.x = as_type<float>(_460);
        }
    }
    float _462 = _410;
    bool _464 = !_346;
    int _466 = as_type<int>(_462);
    float _468 = _462;
    if (!_464)
    {
        float _470 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _472 = _65 + _470;
        float _474 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _476 = _59 + _474;
        float _478 = _472 * _472;
        float _480 = fma(_476, _476, _478);
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _484 = sqrt(_480);
        bool _486 = _484 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _488 = isnan(_484);
        bool _490 = _486 || _488;
        bool _492 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _494 = _490 || _492;
        float _496 = _484 * _482;
        float _498 = _496;
        if (!_494)
        {
            float _500 = -_496;
            float _502 = _500 + 1.0;
            _498 = _502;
        }
        float _504 = _498;
        float _506 = _504;
        if (!_494)
        {
            float _508 = _504 * _504;
            _506 = _508;
        }
        float _510 = _506;
        if (!_494)
        {
            float _512 = fma(_510, (*spvDescriptorSet0.vp_c4)._m0[23].x, _462);
            _466 = as_type<int>(_512);
        }
        int _514 = _466;
        _468 = as_type<float>(_514);
        if (!_494)
        {
            out.m_27.x = as_type<float>(_514);
        }
    }
    float _516 = _468;
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _518 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _520 = _65 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _524 = _59 + _522;
    float _526 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _528 = _520 * _520;
    float _530 = fma(_524, _524, _528);
    float _532 = sqrt(_530);
    bool _534 = _532 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _542 = _538 || _540;
    float _544 = _532 * _526;
    float _546 = _544;
    if (!_542)
    {
        float _548 = -_544;
        float _550 = _548 + 1.0;
        _546 = _550;
    }
    float _552 = _546;
    float _554 = _552;
    if (!_542)
    {
        float _556 = _552 * _552;
        _554 = _556;
    }
    float _558 = _554;
    int _560 = as_type<int>(_558);
    if (!_542)
    {
        float _562 = fma(_558, (*spvDescriptorSet0.vp_c4)._m0[24].x, _516);
        _560 = as_type<int>(_562);
    }
    int _564 = _560;
    if (!_542)
    {
        out.m_27.x = as_type<float>(_564);
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_24.y;
    float _53 = in.m_24.x;
    float _55 = in.m_24.z;
    float _57 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _59 = fma(2.0, _57, 1.0);
    float _61 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _63 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _65 = fma(2.0, _63, 1.0);
    float _67 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    out.m_27.x = 1.0;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _79 = _75 || _77;
    bool _81 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _89 = _85 || _87;
    out.m_29.x = 0.0;
    bool _91 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _99 = _95 || _97;
    bool _101 = _51 >= 0.100000001490116119384765625;
    bool _103 = isnan(_51);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.100000001490116119384765625);
    bool _109 = _105 || _107;
    float _111 = 0.0;
    float _113 = _51;
    int _116 = 1056964608;
    if (_79)
    {
        float _118 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _111 = _118;
    }
    float _120 = _111;
    if (!_109)
    {
        float _122 = _51 + (-0.007000000216066837310791015625);
        _113 = _122;
    }
    float _124 = _113;
    float _126 = _53;
    if (!_109)
    {
        float _128 = _53 * 1.0499999523162841796875;
        _126 = _128;
    }
    float _130 = _126;
    float _132 = _55;
    if (!_109)
    {
        float _134 = _55 * 1.0499999523162841796875;
        _132 = _134;
    }
    float _136 = _132;
    float _138 = _124 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _140 = _124 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _142 = _136 * _136;
    float _144 = _130 + (-0.5);
    float _146 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[5].x, _138);
    float _148 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[4].x, _140);
    float _150 = fma(_130, _130, _142);
    float _152 = _124 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _154 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[5].z, _146);
    float _156 = _136 + (-0.5);
    float _158 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[4].z, _148);
    float _160 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[6].x, _152);
    float _162 = _154 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _164 = sqrt(_150);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _168 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[6].z, _160);
    float _170 = _162 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _172 = _59 + _144;
    float _174 = _65 + _156;
    float _176 = _168 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _178 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].x, _170);
    float _180 = _61 + _172;
    float _182 = _67 + _174;
    float _184 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _186 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _188 = fma(2.0, _186, 0.5);
    float _190 = -_61;
    float _192 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[26].y, _190);
    float _194 = -_67;
    float _196 = fma(_182, (*spvDescriptorSet0.vp_c4)._m0[26].y, _194);
    float _198 = fma(_176, (*spvDescriptorSet0.vp_c3)._m0[11].z, _178);
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _202 = fma(2.0, _200, 0.5);
    float _204 = _192 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _206 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _208 = _124 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _210 = fma(_202, (*spvDescriptorSet0.vp_c4)._m0[5].w, _184);
    float _212 = _204 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _214 = _196 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _216 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[5].w, _206);
    float _218 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[7].x, _208);
    float _220 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _222 = fma(_212, 10.0, _220);
    float _224 = _214 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _226 = _164 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _228 = isnan(_164);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _234 = _230 || _232;
    float _236 = _65 * _65;
    float _238 = _222 * 0.15915493667125701904296875;
    float _240 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _242 = fma(_224, 10.0, _240);
    float _244 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[7].z, _218);
    float _246 = fma(_59, _59, _236);
    float _248 = _242 * 0.15915493667125701904296875;
    float _250 = _238 * 6.283185482025146484375;
    float _252 = sin(_250);
    float _254 = _244 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _256 = fma(_130, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _258 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _260 = _136 * 0.89999997615814208984375;
    float _262 = fma(_254, (*spvDescriptorSet0.vp_c3)._m0[11].w, _198);
    float _264 = fma(_136, -0.449999988079071044921875, 0.5);
    float _266 = fma(_256, 0.5, 0.5);
    float _268 = _248 * 6.283185482025146484375;
    float _270 = sin(_268);
    float _272 = _258 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    out.gl_Position.x = _256;
    out.gl_Position.y = _260;
    out.gl_Position.z = 1.0;
    out.m_31.x = _266;
    out.m_31.y = _264;
    float _274 = _67;
    int _276 = as_type<int>(_256);
    float _278 = _210;
    float _280 = _216;
    int _282 = as_type<int>(_216);
    if (_79)
    {
        float _284 = sqrt(_246);
        _274 = _284;
    }
    float _286 = _274;
    float _288 = fma(_252, 0.0350000001490116119384765625, _212);
    if (!_89)
    {
        _276 = 1065353216;
    }
    int _290 = _276;
    float _292 = fma(_270, -0.01750000007450580596923828125, _224);
    float _294 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    int _296 = _290;
    if (_234)
    {
        _116 = as_type<int>(_262);
    }
    int _298 = _116;
    int _300 = _298;
    if (!_234)
    {
        _300 = 0;
    }
    int _302 = _300;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    out.m_33.x = _288;
    out.m_33.y = _292;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _314 = _310 || _312;
    float _316 = _286;
    if (_79)
    {
        float _318 = _286 * _120;
        float _320 = precise::clamp(_318, 0.0, 1.0);
        _316 = _320;
    }
    float _322 = _316;
    out.m_35.x = _210;
    out.m_35.y = _216;
    out.m_35.z = _304;
    out.m_35.w = _272;
    float _324 = _322;
    if (_79)
    {
        float _326 = -_322;
        float _328 = _326 + 1.0;
        _324 = _328;
    }
    float _330 = _324;
    out.m_37.x = as_type<float>(_302);
    int _332 = as_type<int>(_330);
    if (_79)
    {
        float _334 = _330 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _332 = as_type<int>(_334);
    }
    int _336 = _332;
    if (_79)
    {
        out.m_29.x = as_type<float>(_336);
    }
    bool _338 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _346 = _342 || _344;
    bool _348 = !_89;
    if (!_348)
    {
        float _350 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _352 = _65 + _350;
        float _354 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _356 = _59 + _354;
        float _358 = _352 * _352;
        float _360 = fma(_356, _356, _358);
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _364 = sqrt(_360);
        bool _366 = _364 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _374 = _370 || _372;
        float _376 = _364 * _362;
        int _378 = as_type<int>(_376);
        if (!_374)
        {
            float _380 = -_376;
            float _382 = _380 + 1.0;
            _278 = _382;
        }
        float _384 = _278;
        if (_374)
        {
            _378 = 1065353216;
        }
        int _386 = _378;
        int _388 = _386;
        if (!_374)
        {
            float _390 = _384 * _384;
            _280 = _390;
        }
        float _392 = _280;
        _282 = as_type<int>(_392);
        if (!_374)
        {
            float _394 = fma(_392, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _388 = as_type<int>(_394);
        }
        int _396 = _388;
        _296 = _396;
        if (!_374)
        {
            out.m_27.x = as_type<float>(_396);
        }
    }
    int _398 = _296;
    int _400 = _282;
    int _402 = _400;
    if (!_314)
    {
        _402 = _398;
    }
    int _404 = _402;
    bool _406 = !_314;
    int _408 = _404;
    float _410 = as_type<float>(_404);
    if (!_406)
    {
        float _412 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _414 = _65 + _412;
        float _416 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _418 = _59 + _416;
        float _420 = _414 * _414;
        float _422 = fma(_418, _418, _420);
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _426 = sqrt(_422);
        bool _428 = _426 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _430 = isnan(_426);
        bool _432 = _428 || _430;
        bool _434 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _436 = _432 || _434;
        float _438 = _426 * _424;
        float _440 = _438;
        if (!_436)
        {
            float _442 = -_438;
            float _444 = _442 + 1.0;
            _440 = _444;
        }
        float _446 = _440;
        float _448 = _446;
        if (_436)
        {
            _408 = _398;
        }
        int _450 = _408;
        int _452 = _450;
        if (!_436)
        {
            float _454 = _446 * _446;
            _448 = _454;
        }
        float _456 = _448;
        if (!_436)
        {
            float _458 = fma(_456, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_398));
            _452 = as_type<int>(_458);
        }
        int _460 = _452;
        _410 = as_type<float>(_460);
        if (!_436)
        {
            out.m_27.x = as_type<float>(_460);
        }
    }
    float _462 = _410;
    bool _464 = !_346;
    int _466 = as_type<int>(_462);
    float _468 = _462;
    if (!_464)
    {
        float _470 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _472 = _65 + _470;
        float _474 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _476 = _59 + _474;
        float _478 = _472 * _472;
        float _480 = fma(_476, _476, _478);
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _484 = sqrt(_480);
        bool _486 = _484 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _488 = isnan(_484);
        bool _490 = _486 || _488;
        bool _492 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _494 = _490 || _492;
        float _496 = _484 * _482;
        float _498 = _496;
        if (!_494)
        {
            float _500 = -_496;
            float _502 = _500 + 1.0;
            _498 = _502;
        }
        float _504 = _498;
        float _506 = _504;
        if (!_494)
        {
            float _508 = _504 * _504;
            _506 = _508;
        }
        float _510 = _506;
        if (!_494)
        {
            float _512 = fma(_510, (*spvDescriptorSet0.vp_c4)._m0[23].x, _462);
            _466 = as_type<int>(_512);
        }
        int _514 = _466;
        _468 = as_type<float>(_514);
        if (!_494)
        {
            out.m_27.x = as_type<float>(_514);
        }
    }
    float _516 = _468;
    if (!_99)
    {
        return out;
    }
    float _518 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _520 = _65 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _524 = _59 + _522;
    float _526 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _528 = _520 * _520;
    float _530 = fma(_524, _524, _528);
    float _532 = sqrt(_530);
    bool _534 = _532 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _542 = _538 || _540;
    float _544 = _532 * _526;
    float _546 = _544;
    if (!_542)
    {
        float _548 = -_544;
        float _550 = _548 + 1.0;
        _546 = _550;
    }
    float _552 = _546;
    float _554 = _552;
    if (!_542)
    {
        float _556 = _552 * _552;
        _554 = _556;
    }
    float _558 = _554;
    int _560 = as_type<int>(_558);
    if (!_542)
    {
        float _562 = fma(_558, (*spvDescriptorSet0.vp_c4)._m0[24].x, _516);
        _560 = as_type<int>(_562);
    }
    int _564 = _560;
    if (!_542)
    {
        out.m_27.x = as_type<float>(_564);
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
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_24.y;
    float _53 = in.m_24.x;
    float _55 = in.m_24.z;
    float _57 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _59 = fma(2.0, _57, 1.0);
    float _61 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _63 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _65 = fma(2.0, _63, 1.0);
    float _67 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    out.m_27.x = 1.0;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _79 = _75 || _77;
    bool _81 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _89 = _85 || _87;
    out.m_29.x = 0.0;
    bool _91 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _99 = _95 || _97;
    bool _101 = _51 >= 0.100000001490116119384765625;
    bool _103 = isnan(_51);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.100000001490116119384765625);
    bool _109 = _105 || _107;
    float _111 = 0.0;
    float _113 = _51;
    int _116 = 1056964608;
    if (_79)
    {
        float _118 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _111 = _118;
    }
    float _120 = _111;
    if (!_109)
    {
        float _122 = _51 + (-0.007000000216066837310791015625);
        _113 = _122;
    }
    float _124 = _113;
    float _126 = _53;
    if (!_109)
    {
        float _128 = _53 * 1.0499999523162841796875;
        _126 = _128;
    }
    float _130 = _126;
    float _132 = _55;
    if (!_109)
    {
        float _134 = _55 * 1.0499999523162841796875;
        _132 = _134;
    }
    float _136 = _132;
    float _138 = _124 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _140 = _124 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _142 = _136 * _136;
    float _144 = _130 + (-0.5);
    float _146 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[5].x, _138);
    float _148 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[4].x, _140);
    float _150 = fma(_130, _130, _142);
    float _152 = _124 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _154 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[5].z, _146);
    float _156 = _136 + (-0.5);
    float _158 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[4].z, _148);
    float _160 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[6].x, _152);
    float _162 = _154 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _164 = sqrt(_150);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _168 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[6].z, _160);
    float _170 = _162 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _172 = _59 + _144;
    float _174 = _65 + _156;
    float _176 = _168 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _178 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].x, _170);
    float _180 = _61 + _172;
    float _182 = _67 + _174;
    float _184 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _186 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _188 = fma(2.0, _186, 0.5);
    float _190 = -_61;
    float _192 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[26].y, _190);
    float _194 = -_67;
    float _196 = fma(_182, (*spvDescriptorSet0.vp_c4)._m0[26].y, _194);
    float _198 = fma(_176, (*spvDescriptorSet0.vp_c3)._m0[11].z, _178);
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _202 = fma(2.0, _200, 0.5);
    float _204 = _192 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _206 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _208 = _124 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _210 = fma(_202, (*spvDescriptorSet0.vp_c4)._m0[5].w, _184);
    float _212 = _204 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _214 = _196 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _216 = fma(_188, (*spvDescriptorSet0.vp_c4)._m0[5].w, _206);
    float _218 = fma(_130, (*spvDescriptorSet0.vp_c3)._m0[7].x, _208);
    float _220 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _222 = fma(_212, 10.0, _220);
    float _224 = _214 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _226 = _164 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _228 = isnan(_164);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _234 = _230 || _232;
    float _236 = _65 * _65;
    float _238 = _222 * 0.15915493667125701904296875;
    float _240 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _242 = fma(_224, 10.0, _240);
    float _244 = fma(_136, (*spvDescriptorSet0.vp_c3)._m0[7].z, _218);
    float _246 = fma(_59, _59, _236);
    float _248 = _242 * 0.15915493667125701904296875;
    float _250 = _238 * 6.283185482025146484375;
    float _252 = sin(_250);
    float _254 = _244 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _256 = fma(_130, 0.800000011920928955078125, 0.100000001490116119384765625);
    float _258 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _260 = _136 * 0.89999997615814208984375;
    float _262 = fma(_254, (*spvDescriptorSet0.vp_c3)._m0[11].w, _198);
    float _264 = fma(_136, -0.449999988079071044921875, 0.5);
    float _266 = fma(_256, 0.5, 0.5);
    float _268 = _248 * 6.283185482025146484375;
    float _270 = sin(_268);
    float _272 = _258 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    out.gl_Position.x = _256;
    out.gl_Position.y = _260;
    out.gl_Position.z = 1.0;
    out.m_31.x = _266;
    out.m_31.y = _264;
    float _274 = _67;
    int _276 = as_type<int>(_256);
    float _278 = _210;
    float _280 = _216;
    int _282 = as_type<int>(_216);
    if (_79)
    {
        float _284 = sqrt(_246);
        _274 = _284;
    }
    float _286 = _274;
    float _288 = fma(_252, 0.0350000001490116119384765625, _212);
    if (!_89)
    {
        _276 = 1065353216;
    }
    int _290 = _276;
    float _292 = fma(_270, -0.01750000007450580596923828125, _224);
    float _294 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    int _296 = _290;
    if (_234)
    {
        _116 = as_type<int>(_262);
    }
    int _298 = _116;
    int _300 = _298;
    if (!_234)
    {
        _300 = 0;
    }
    int _302 = _300;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    out.m_33.x = _288;
    out.m_33.y = _292;
    bool _306 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _314 = _310 || _312;
    float _316 = _286;
    if (_79)
    {
        float _318 = _286 * _120;
        float _320 = precise::clamp(_318, 0.0, 1.0);
        _316 = _320;
    }
    float _322 = _316;
    out.m_35.x = _210;
    out.m_35.y = _216;
    out.m_35.z = _304;
    out.m_35.w = _272;
    float _324 = _322;
    if (_79)
    {
        float _326 = -_322;
        float _328 = _326 + 1.0;
        _324 = _328;
    }
    float _330 = _324;
    out.m_37.x = as_type<float>(_302);
    int _332 = as_type<int>(_330);
    if (_79)
    {
        float _334 = _330 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _332 = as_type<int>(_334);
    }
    int _336 = _332;
    if (_79)
    {
        out.m_29.x = as_type<float>(_336);
    }
    bool _338 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _346 = _342 || _344;
    bool _348 = !_89;
    if (!_348)
    {
        float _350 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _352 = _65 + _350;
        float _354 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _356 = _59 + _354;
        float _358 = _352 * _352;
        float _360 = fma(_356, _356, _358);
        float _362 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _364 = sqrt(_360);
        bool _366 = _364 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _374 = _370 || _372;
        float _376 = _364 * _362;
        int _378 = as_type<int>(_376);
        if (!_374)
        {
            float _380 = -_376;
            float _382 = _380 + 1.0;
            _278 = _382;
        }
        float _384 = _278;
        if (_374)
        {
            _378 = 1065353216;
        }
        int _386 = _378;
        int _388 = _386;
        if (!_374)
        {
            float _390 = _384 * _384;
            _280 = _390;
        }
        float _392 = _280;
        _282 = as_type<int>(_392);
        if (!_374)
        {
            float _394 = fma(_392, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _388 = as_type<int>(_394);
        }
        int _396 = _388;
        _296 = _396;
        if (!_374)
        {
            out.m_27.x = as_type<float>(_396);
        }
    }
    int _398 = _296;
    int _400 = _282;
    int _402 = _400;
    if (!_314)
    {
        _402 = _398;
    }
    int _404 = _402;
    bool _406 = !_314;
    int _408 = _404;
    float _410 = as_type<float>(_404);
    if (!_406)
    {
        float _412 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _414 = _65 + _412;
        float _416 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _418 = _59 + _416;
        float _420 = _414 * _414;
        float _422 = fma(_418, _418, _420);
        float _424 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _426 = sqrt(_422);
        bool _428 = _426 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _430 = isnan(_426);
        bool _432 = _428 || _430;
        bool _434 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _436 = _432 || _434;
        float _438 = _426 * _424;
        float _440 = _438;
        if (!_436)
        {
            float _442 = -_438;
            float _444 = _442 + 1.0;
            _440 = _444;
        }
        float _446 = _440;
        float _448 = _446;
        if (_436)
        {
            _408 = _398;
        }
        int _450 = _408;
        int _452 = _450;
        if (!_436)
        {
            float _454 = _446 * _446;
            _448 = _454;
        }
        float _456 = _448;
        if (!_436)
        {
            float _458 = fma(_456, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_398));
            _452 = as_type<int>(_458);
        }
        int _460 = _452;
        _410 = as_type<float>(_460);
        if (!_436)
        {
            out.m_27.x = as_type<float>(_460);
        }
    }
    float _462 = _410;
    bool _464 = !_346;
    int _466 = as_type<int>(_462);
    float _468 = _462;
    if (!_464)
    {
        float _470 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _472 = _65 + _470;
        float _474 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _476 = _59 + _474;
        float _478 = _472 * _472;
        float _480 = fma(_476, _476, _478);
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _484 = sqrt(_480);
        bool _486 = _484 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _488 = isnan(_484);
        bool _490 = _486 || _488;
        bool _492 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _494 = _490 || _492;
        float _496 = _484 * _482;
        float _498 = _496;
        if (!_494)
        {
            float _500 = -_496;
            float _502 = _500 + 1.0;
            _498 = _502;
        }
        float _504 = _498;
        float _506 = _504;
        if (!_494)
        {
            float _508 = _504 * _504;
            _506 = _508;
        }
        float _510 = _506;
        if (!_494)
        {
            float _512 = fma(_510, (*spvDescriptorSet0.vp_c4)._m0[23].x, _462);
            _466 = as_type<int>(_512);
        }
        int _514 = _466;
        _468 = as_type<float>(_514);
        if (!_494)
        {
            out.m_27.x = as_type<float>(_514);
        }
    }
    float _516 = _468;
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _518 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _520 = _65 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _524 = _59 + _522;
    float _526 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _528 = _520 * _520;
    float _530 = fma(_524, _524, _528);
    float _532 = sqrt(_530);
    bool _534 = _532 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _542 = _538 || _540;
    float _544 = _532 * _526;
    float _546 = _544;
    if (!_542)
    {
        float _548 = -_544;
        float _550 = _548 + 1.0;
        _546 = _550;
    }
    float _552 = _546;
    float _554 = _552;
    if (!_542)
    {
        float _556 = _552 * _552;
        _554 = _556;
    }
    float _558 = _554;
    int _560 = as_type<int>(_558);
    if (!_542)
    {
        float _562 = fma(_558, (*spvDescriptorSet0.vp_c4)._m0[24].x, _516);
        _560 = as_type<int>(_562);
    }
    int _564 = _560;
    if (!_542)
    {
        out.m_27.x = as_type<float>(_564);
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

