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
    float4 m_29 [[user(locn2)]];
    float4 m_27 [[user(locn3)]];
    float4 m_33 [[user(locn5)]];
    float4 m_31 [[user(locn6)]];
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.z;
    float _53 = in.m_24.x;
    float _55 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _57 = fma(2.0, _55, 1.0);
    float _59 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _61 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _63 = fma(2.0, _61, 1.0);
    float _65 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _67 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _79 = _75 || _77;
    float _81 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    out.m_27.x = 1.0;
    bool _83 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _91 = _87 || _89;
    bool _93 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _101 = _97 || _99;
    out.m_29.x = 0.0;
    bool _103 = _49 >= 0.100000001490116119384765625;
    bool _105 = isnan(_49);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.100000001490116119384765625);
    bool _111 = _107 || _109;
    float _113 = 0.0;
    float _115 = _49;
    if (_79)
    {
        float _117 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _113 = _117;
    }
    float _119 = _113;
    float _121 = _51;
    if (!_111)
    {
        float _123 = _51 * 1.0499999523162841796875;
        _121 = _123;
    }
    float _125 = _121;
    if (!_111)
    {
        float _127 = _49 + (-0.007000000216066837310791015625);
        _115 = _127;
    }
    float _129 = _115;
    float _131 = _53;
    if (!_111)
    {
        float _133 = _53 * 1.0499999523162841796875;
        _131 = _133;
    }
    float _135 = _131;
    float _137 = _125 * _125;
    float _139 = _129 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _141 = _135 + (-0.5);
    float _143 = fma(_135, _135, _137);
    float _145 = _129 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[5].x, _139);
    float _149 = _125 + (-0.5);
    float _151 = _63 + _141;
    float _153 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[4].x, _145);
    float _155 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[5].z, _147);
    float _157 = sqrt(_143);
    float _159 = _57 + _149;
    float _161 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[4].z, _153);
    float _163 = _155 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _165 = _65 + _151;
    float _167 = _59 + _159;
    float _169 = _161 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _163 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _173 = _57 * _57;
    float _175 = -_59;
    float _177 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[26].y, _175);
    float _179 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[11].x, _171);
    float _181 = _129 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _183 = _177 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _185 = _129 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _187 = _157 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _189 = isnan(_157);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _195 = _191 || _193;
    float _197 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[6].x, _181);
    float _199 = -_65;
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c4)._m0[26].y, _199);
    float _203 = _183 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _205 = fma(_63, _63, _173);
    float _207 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[6].z, _197);
    float _209 = _201 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _211 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _213 = fma(2.0, _211, 0.5);
    float _215 = _65;
    if (_79)
    {
        float _217 = sqrt(_205);
        _215 = _217;
    }
    float _219 = _215;
    float _221 = _207 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _223 = _209 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _225 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].z, _179);
    float _227 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _229 = fma(_223, 10.0, _227);
    float _231 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _233 = fma(_203, 10.0, _231);
    float _235 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[5].w, _67);
    float _237 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[7].x, _185);
    float _239 = _229 * 0.15915493667125701904296875;
    float _241 = _233 * 0.15915493667125701904296875;
    float _243 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _245 = fma(2.0, _243, 0.5);
    float _247 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _249 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[7].z, _237);
    float _251 = _125 * 0.89999997615814208984375;
    float _253 = _239 * 6.283185482025146484375;
    float _255 = sin(_253);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[5].w, _81);
    float _259 = _247 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _261 = _249 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _263 = _219;
    int _266 = as_type<int>(_235);
    float _268 = _257;
    float _270 = _257;
    if (_79)
    {
        float _272 = _219 * _119;
        float _274 = precise::clamp(_272, 0.0, 1.0);
        _263 = _274;
    }
    float _276 = _263;
    float _278 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _280 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[11].w, _225);
    float _282 = _241 * 6.283185482025146484375;
    float _284 = sin(_282);
    float _286 = fma(_135, 0.800000011920928955078125, 0.100000001490116119384765625);
    int _288 = as_type<int>(_280);
    float _290 = _276;
    if (!_195)
    {
        _288 = 0;
    }
    int _292 = _288;
    if (_79)
    {
        float _294 = -_276;
        float _296 = _294 + 1.0;
        _290 = _296;
    }
    float _298 = _290;
    float _300 = _278 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _310 = _306 || _308;
    out.gl_Position.x = _286;
    out.gl_Position.y = _251;
    out.gl_Position.z = 1.0;
    int _312 = as_type<int>(_298);
    if (_79)
    {
        float _314 = _298 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _312 = as_type<int>(_314);
    }
    int _316 = _312;
    float _318 = fma(_255, 0.0350000001490116119384765625, _223);
    out.m_31.x = as_type<float>(_292);
    out.m_33.x = _235;
    out.m_33.y = _257;
    out.m_33.z = _300;
    out.m_33.w = _259;
    float _320 = fma(_284, -0.01750000007450580596923828125, _203);
    if (_79)
    {
        out.m_29.x = as_type<float>(_316);
    }
    bool _322 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _330 = _326 || _328;
    out.m_35.x = _318;
    out.m_35.y = _320;
    if (!_91)
    {
        _266 = 1065353216;
    }
    int _332 = _266;
    bool _334 = !_91;
    int _336 = _332;
    float _338 = as_type<float>(_332);
    if (!_334)
    {
        float _340 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _342 = _57 + _340;
        float _344 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _346 = _63 + _344;
        float _348 = _342 * _342;
        float _350 = fma(_346, _346, _348);
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _354 = sqrt(_350);
        bool _356 = _354 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _358 = isnan(_354);
        bool _360 = _356 || _358;
        bool _362 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _364 = _360 || _362;
        float _366 = _354 * _352;
        float _368 = _366;
        if (!_364)
        {
            float _370 = -_366;
            float _372 = _370 + 1.0;
            _368 = _372;
        }
        float _374 = _368;
        if (_364)
        {
            _336 = 1065353216;
        }
        int _376 = _336;
        int _378 = _376;
        if (!_364)
        {
            float _380 = _374 * _374;
            _268 = _380;
        }
        float _382 = _268;
        _270 = _382;
        if (!_364)
        {
            float _384 = fma(_382, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _378 = as_type<int>(_384);
        }
        int _386 = _378;
        _338 = as_type<float>(_386);
        if (!_364)
        {
            out.m_27.x = as_type<float>(_386);
        }
    }
    float _388 = _270;
    float _390 = _338;
    bool _392 = !_310;
    float _394 = _388;
    int _396 = as_type<int>(_390);
    float _398 = _390;
    if (!_392)
    {
        float _400 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _402 = _57 + _400;
        float _404 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _406 = _63 + _404;
        float _408 = _402 * _402;
        float _410 = fma(_406, _406, _408);
        float _412 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _414 = sqrt(_410);
        bool _416 = _414 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _418 = isnan(_414);
        bool _420 = _416 || _418;
        bool _422 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _424 = _420 || _422;
        float _426 = _414 * _412;
        float _428 = _426;
        if (!_424)
        {
            float _430 = -_426;
            float _432 = _430 + 1.0;
            _428 = _432;
        }
        float _434 = _428;
        if (!_424)
        {
            float _436 = _434 * _434;
            _394 = _436;
        }
        float _438 = _394;
        if (!_424)
        {
            float _440 = fma(_438, (*spvDescriptorSet0.vp_c4)._m0[22].x, _390);
            _396 = as_type<int>(_440);
        }
        int _442 = _396;
        _398 = as_type<float>(_442);
        if (!_424)
        {
            out.m_27.x = as_type<float>(_442);
        }
    }
    float _444 = _398;
    bool _446 = !_330;
    int _448 = as_type<int>(_444);
    float _450 = _444;
    if (!_446)
    {
        float _452 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _454 = _57 + _452;
        float _456 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _458 = _63 + _456;
        float _460 = _454 * _454;
        float _462 = fma(_458, _458, _460);
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _466 = sqrt(_462);
        bool _468 = _466 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _470 = isnan(_466);
        bool _472 = _468 || _470;
        bool _474 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _476 = _472 || _474;
        float _478 = _466 * _464;
        float _480 = _478;
        if (!_476)
        {
            float _482 = -_478;
            float _484 = _482 + 1.0;
            _480 = _484;
        }
        float _486 = _480;
        float _488 = _486;
        if (!_476)
        {
            float _490 = _486 * _486;
            _488 = _490;
        }
        float _492 = _488;
        if (!_476)
        {
            float _494 = fma(_492, (*spvDescriptorSet0.vp_c4)._m0[23].x, _444);
            _448 = as_type<int>(_494);
        }
        int _496 = _448;
        _450 = as_type<float>(_496);
        if (!_476)
        {
            out.m_27.x = as_type<float>(_496);
        }
    }
    float _498 = _450;
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _500 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _502 = _57 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _506 = _63 + _504;
    float _508 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _510 = _502 * _502;
    float _512 = fma(_506, _506, _510);
    float _514 = sqrt(_512);
    bool _516 = _514 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _518 = isnan(_514);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _524 = _520 || _522;
    float _526 = _514 * _508;
    float _528 = _526;
    if (!_524)
    {
        float _530 = -_526;
        float _532 = _530 + 1.0;
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_524)
    {
        float _538 = _534 * _534;
        _536 = _538;
    }
    float _540 = _536;
    int _542 = as_type<int>(_540);
    if (!_524)
    {
        float _544 = fma(_540, (*spvDescriptorSet0.vp_c4)._m0[24].x, _498);
        _542 = as_type<int>(_544);
    }
    int _546 = _542;
    if (!_524)
    {
        out.m_27.x = as_type<float>(_546);
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.z;
    float _53 = in.m_24.x;
    float _55 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _57 = fma(2.0, _55, 1.0);
    float _59 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _61 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _63 = fma(2.0, _61, 1.0);
    float _65 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _67 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _79 = _75 || _77;
    float _81 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    out.m_27.x = 1.0;
    bool _83 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _91 = _87 || _89;
    bool _93 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _101 = _97 || _99;
    out.m_29.x = 0.0;
    bool _103 = _49 >= 0.100000001490116119384765625;
    bool _105 = isnan(_49);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.100000001490116119384765625);
    bool _111 = _107 || _109;
    float _113 = 0.0;
    float _115 = _49;
    if (_79)
    {
        float _117 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _113 = _117;
    }
    float _119 = _113;
    float _121 = _51;
    if (!_111)
    {
        float _123 = _51 * 1.0499999523162841796875;
        _121 = _123;
    }
    float _125 = _121;
    if (!_111)
    {
        float _127 = _49 + (-0.007000000216066837310791015625);
        _115 = _127;
    }
    float _129 = _115;
    float _131 = _53;
    if (!_111)
    {
        float _133 = _53 * 1.0499999523162841796875;
        _131 = _133;
    }
    float _135 = _131;
    float _137 = _125 * _125;
    float _139 = _129 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _141 = _135 + (-0.5);
    float _143 = fma(_135, _135, _137);
    float _145 = _129 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[5].x, _139);
    float _149 = _125 + (-0.5);
    float _151 = _63 + _141;
    float _153 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[4].x, _145);
    float _155 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[5].z, _147);
    float _157 = sqrt(_143);
    float _159 = _57 + _149;
    float _161 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[4].z, _153);
    float _163 = _155 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _165 = _65 + _151;
    float _167 = _59 + _159;
    float _169 = _161 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _163 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _173 = _57 * _57;
    float _175 = -_59;
    float _177 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[26].y, _175);
    float _179 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[11].x, _171);
    float _181 = _129 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _183 = _177 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _185 = _129 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _187 = _157 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _189 = isnan(_157);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _195 = _191 || _193;
    float _197 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[6].x, _181);
    float _199 = -_65;
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c4)._m0[26].y, _199);
    float _203 = _183 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _205 = fma(_63, _63, _173);
    float _207 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[6].z, _197);
    float _209 = _201 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _211 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _213 = fma(2.0, _211, 0.5);
    float _215 = _65;
    if (_79)
    {
        float _217 = sqrt(_205);
        _215 = _217;
    }
    float _219 = _215;
    float _221 = _207 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _223 = _209 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _225 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].z, _179);
    float _227 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _229 = fma(_223, 10.0, _227);
    float _231 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _233 = fma(_203, 10.0, _231);
    float _235 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[5].w, _67);
    float _237 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[7].x, _185);
    float _239 = _229 * 0.15915493667125701904296875;
    float _241 = _233 * 0.15915493667125701904296875;
    float _243 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _245 = fma(2.0, _243, 0.5);
    float _247 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _249 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[7].z, _237);
    float _251 = _125 * 0.89999997615814208984375;
    float _253 = _239 * 6.283185482025146484375;
    float _255 = sin(_253);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[5].w, _81);
    float _259 = _247 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _261 = _249 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _263 = _219;
    int _266 = as_type<int>(_235);
    float _268 = _257;
    float _270 = _257;
    if (_79)
    {
        float _272 = _219 * _119;
        float _274 = precise::clamp(_272, 0.0, 1.0);
        _263 = _274;
    }
    float _276 = _263;
    float _278 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _280 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[11].w, _225);
    float _282 = _241 * 6.283185482025146484375;
    float _284 = sin(_282);
    float _286 = fma(_135, 0.800000011920928955078125, 0.100000001490116119384765625);
    int _288 = as_type<int>(_280);
    float _290 = _276;
    if (!_195)
    {
        _288 = 0;
    }
    int _292 = _288;
    if (_79)
    {
        float _294 = -_276;
        float _296 = _294 + 1.0;
        _290 = _296;
    }
    float _298 = _290;
    float _300 = _278 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _310 = _306 || _308;
    out.gl_Position.x = _286;
    out.gl_Position.y = _251;
    out.gl_Position.z = 1.0;
    int _312 = as_type<int>(_298);
    if (_79)
    {
        float _314 = _298 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _312 = as_type<int>(_314);
    }
    int _316 = _312;
    float _318 = fma(_255, 0.0350000001490116119384765625, _223);
    out.m_31.x = as_type<float>(_292);
    out.m_33.x = _235;
    out.m_33.y = _257;
    out.m_33.z = _300;
    out.m_33.w = _259;
    float _320 = fma(_284, -0.01750000007450580596923828125, _203);
    if (_79)
    {
        out.m_29.x = as_type<float>(_316);
    }
    bool _322 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _330 = _326 || _328;
    out.m_35.x = _318;
    out.m_35.y = _320;
    if (!_91)
    {
        _266 = 1065353216;
    }
    int _332 = _266;
    bool _334 = !_91;
    int _336 = _332;
    float _338 = as_type<float>(_332);
    if (!_334)
    {
        float _340 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _342 = _57 + _340;
        float _344 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _346 = _63 + _344;
        float _348 = _342 * _342;
        float _350 = fma(_346, _346, _348);
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _354 = sqrt(_350);
        bool _356 = _354 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _358 = isnan(_354);
        bool _360 = _356 || _358;
        bool _362 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _364 = _360 || _362;
        float _366 = _354 * _352;
        float _368 = _366;
        if (!_364)
        {
            float _370 = -_366;
            float _372 = _370 + 1.0;
            _368 = _372;
        }
        float _374 = _368;
        if (_364)
        {
            _336 = 1065353216;
        }
        int _376 = _336;
        int _378 = _376;
        if (!_364)
        {
            float _380 = _374 * _374;
            _268 = _380;
        }
        float _382 = _268;
        _270 = _382;
        if (!_364)
        {
            float _384 = fma(_382, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _378 = as_type<int>(_384);
        }
        int _386 = _378;
        _338 = as_type<float>(_386);
        if (!_364)
        {
            out.m_27.x = as_type<float>(_386);
        }
    }
    float _388 = _270;
    float _390 = _338;
    bool _392 = !_310;
    float _394 = _388;
    int _396 = as_type<int>(_390);
    float _398 = _390;
    if (!_392)
    {
        float _400 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _402 = _57 + _400;
        float _404 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _406 = _63 + _404;
        float _408 = _402 * _402;
        float _410 = fma(_406, _406, _408);
        float _412 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _414 = sqrt(_410);
        bool _416 = _414 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _418 = isnan(_414);
        bool _420 = _416 || _418;
        bool _422 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _424 = _420 || _422;
        float _426 = _414 * _412;
        float _428 = _426;
        if (!_424)
        {
            float _430 = -_426;
            float _432 = _430 + 1.0;
            _428 = _432;
        }
        float _434 = _428;
        if (!_424)
        {
            float _436 = _434 * _434;
            _394 = _436;
        }
        float _438 = _394;
        if (!_424)
        {
            float _440 = fma(_438, (*spvDescriptorSet0.vp_c4)._m0[22].x, _390);
            _396 = as_type<int>(_440);
        }
        int _442 = _396;
        _398 = as_type<float>(_442);
        if (!_424)
        {
            out.m_27.x = as_type<float>(_442);
        }
    }
    float _444 = _398;
    bool _446 = !_330;
    int _448 = as_type<int>(_444);
    float _450 = _444;
    if (!_446)
    {
        float _452 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _454 = _57 + _452;
        float _456 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _458 = _63 + _456;
        float _460 = _454 * _454;
        float _462 = fma(_458, _458, _460);
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _466 = sqrt(_462);
        bool _468 = _466 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _470 = isnan(_466);
        bool _472 = _468 || _470;
        bool _474 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _476 = _472 || _474;
        float _478 = _466 * _464;
        float _480 = _478;
        if (!_476)
        {
            float _482 = -_478;
            float _484 = _482 + 1.0;
            _480 = _484;
        }
        float _486 = _480;
        float _488 = _486;
        if (!_476)
        {
            float _490 = _486 * _486;
            _488 = _490;
        }
        float _492 = _488;
        if (!_476)
        {
            float _494 = fma(_492, (*spvDescriptorSet0.vp_c4)._m0[23].x, _444);
            _448 = as_type<int>(_494);
        }
        int _496 = _448;
        _450 = as_type<float>(_496);
        if (!_476)
        {
            out.m_27.x = as_type<float>(_496);
        }
    }
    float _498 = _450;
    if (!_101)
    {
        return out;
    }
    float _500 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _502 = _57 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _506 = _63 + _504;
    float _508 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _510 = _502 * _502;
    float _512 = fma(_506, _506, _510);
    float _514 = sqrt(_512);
    bool _516 = _514 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _518 = isnan(_514);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _524 = _520 || _522;
    float _526 = _514 * _508;
    float _528 = _526;
    if (!_524)
    {
        float _530 = -_526;
        float _532 = _530 + 1.0;
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_524)
    {
        float _538 = _534 * _534;
        _536 = _538;
    }
    float _540 = _536;
    int _542 = as_type<int>(_540);
    if (!_524)
    {
        float _544 = fma(_540, (*spvDescriptorSet0.vp_c4)._m0[24].x, _498);
        _542 = as_type<int>(_544);
    }
    int _546 = _542;
    if (!_524)
    {
        out.m_27.x = as_type<float>(_546);
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = in.m_24.y;
    float _51 = in.m_24.z;
    float _53 = in.m_24.x;
    float _55 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _57 = fma(2.0, _55, 1.0);
    float _59 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].w, -0.5);
    float _61 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _63 = fma(2.0, _61, 1.0);
    float _65 = fma(2.0, (*spvDescriptorSet0.vp_c4)._m0[6].z, -0.5);
    float _67 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    bool _71 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _79 = _75 || _77;
    float _81 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    out.m_27.x = 1.0;
    bool _83 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _91 = _87 || _89;
    bool _93 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _101 = _97 || _99;
    out.m_29.x = 0.0;
    bool _103 = _49 >= 0.100000001490116119384765625;
    bool _105 = isnan(_49);
    bool _107 = _103 || _105;
    bool _109 = isnan(0.100000001490116119384765625);
    bool _111 = _107 || _109;
    float _113 = 0.0;
    float _115 = _49;
    if (_79)
    {
        float _117 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _113 = _117;
    }
    float _119 = _113;
    float _121 = _51;
    if (!_111)
    {
        float _123 = _51 * 1.0499999523162841796875;
        _121 = _123;
    }
    float _125 = _121;
    if (!_111)
    {
        float _127 = _49 + (-0.007000000216066837310791015625);
        _115 = _127;
    }
    float _129 = _115;
    float _131 = _53;
    if (!_111)
    {
        float _133 = _53 * 1.0499999523162841796875;
        _131 = _133;
    }
    float _135 = _131;
    float _137 = _125 * _125;
    float _139 = _129 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _141 = _135 + (-0.5);
    float _143 = fma(_135, _135, _137);
    float _145 = _129 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _147 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[5].x, _139);
    float _149 = _125 + (-0.5);
    float _151 = _63 + _141;
    float _153 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[4].x, _145);
    float _155 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[5].z, _147);
    float _157 = sqrt(_143);
    float _159 = _57 + _149;
    float _161 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[4].z, _153);
    float _163 = _155 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _165 = _65 + _151;
    float _167 = _59 + _159;
    float _169 = _161 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _171 = _163 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _173 = _57 * _57;
    float _175 = -_59;
    float _177 = fma(_167, (*spvDescriptorSet0.vp_c4)._m0[26].y, _175);
    float _179 = fma(_169, (*spvDescriptorSet0.vp_c3)._m0[11].x, _171);
    float _181 = _129 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _183 = _177 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _185 = _129 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    bool _187 = _157 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _189 = isnan(_157);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _195 = _191 || _193;
    float _197 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[6].x, _181);
    float _199 = -_65;
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c4)._m0[26].y, _199);
    float _203 = _183 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _205 = fma(_63, _63, _173);
    float _207 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[6].z, _197);
    float _209 = _201 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _211 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _213 = fma(2.0, _211, 0.5);
    float _215 = _65;
    if (_79)
    {
        float _217 = sqrt(_205);
        _215 = _217;
    }
    float _219 = _215;
    float _221 = _207 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _223 = _209 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _225 = fma(_221, (*spvDescriptorSet0.vp_c3)._m0[11].z, _179);
    float _227 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _229 = fma(_223, 10.0, _227);
    float _231 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _233 = fma(_203, 10.0, _231);
    float _235 = fma(_213, (*spvDescriptorSet0.vp_c4)._m0[5].w, _67);
    float _237 = fma(_135, (*spvDescriptorSet0.vp_c3)._m0[7].x, _185);
    float _239 = _229 * 0.15915493667125701904296875;
    float _241 = _233 * 0.15915493667125701904296875;
    float _243 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _245 = fma(2.0, _243, 0.5);
    float _247 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _249 = fma(_125, (*spvDescriptorSet0.vp_c3)._m0[7].z, _237);
    float _251 = _125 * 0.89999997615814208984375;
    float _253 = _239 * 6.283185482025146484375;
    float _255 = sin(_253);
    float _257 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[5].w, _81);
    float _259 = _247 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _261 = _249 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _263 = _219;
    int _266 = as_type<int>(_235);
    float _268 = _257;
    float _270 = _257;
    if (_79)
    {
        float _272 = _219 * _119;
        float _274 = precise::clamp(_272, 0.0, 1.0);
        _263 = _274;
    }
    float _276 = _263;
    float _278 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _280 = fma(_261, (*spvDescriptorSet0.vp_c3)._m0[11].w, _225);
    float _282 = _241 * 6.283185482025146484375;
    float _284 = sin(_282);
    float _286 = fma(_135, 0.800000011920928955078125, 0.100000001490116119384765625);
    int _288 = as_type<int>(_280);
    float _290 = _276;
    if (!_195)
    {
        _288 = 0;
    }
    int _292 = _288;
    if (_79)
    {
        float _294 = -_276;
        float _296 = _294 + 1.0;
        _290 = _296;
    }
    float _298 = _290;
    float _300 = _278 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    bool _302 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _304 = isnan(0.0);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _310 = _306 || _308;
    out.gl_Position.x = _286;
    out.gl_Position.y = _251;
    out.gl_Position.z = 1.0;
    int _312 = as_type<int>(_298);
    if (_79)
    {
        float _314 = _298 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _312 = as_type<int>(_314);
    }
    int _316 = _312;
    float _318 = fma(_255, 0.0350000001490116119384765625, _223);
    out.m_31.x = as_type<float>(_292);
    out.m_33.x = _235;
    out.m_33.y = _257;
    out.m_33.z = _300;
    out.m_33.w = _259;
    float _320 = fma(_284, -0.01750000007450580596923828125, _203);
    if (_79)
    {
        out.m_29.x = as_type<float>(_316);
    }
    bool _322 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _324 = isnan(0.0);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _330 = _326 || _328;
    out.m_35.x = _318;
    out.m_35.y = _320;
    if (!_91)
    {
        _266 = 1065353216;
    }
    int _332 = _266;
    bool _334 = !_91;
    int _336 = _332;
    float _338 = as_type<float>(_332);
    if (!_334)
    {
        float _340 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _342 = _57 + _340;
        float _344 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _346 = _63 + _344;
        float _348 = _342 * _342;
        float _350 = fma(_346, _346, _348);
        float _352 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _354 = sqrt(_350);
        bool _356 = _354 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _358 = isnan(_354);
        bool _360 = _356 || _358;
        bool _362 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _364 = _360 || _362;
        float _366 = _354 * _352;
        float _368 = _366;
        if (!_364)
        {
            float _370 = -_366;
            float _372 = _370 + 1.0;
            _368 = _372;
        }
        float _374 = _368;
        if (_364)
        {
            _336 = 1065353216;
        }
        int _376 = _336;
        int _378 = _376;
        if (!_364)
        {
            float _380 = _374 * _374;
            _268 = _380;
        }
        float _382 = _268;
        _270 = _382;
        if (!_364)
        {
            float _384 = fma(_382, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _378 = as_type<int>(_384);
        }
        int _386 = _378;
        _338 = as_type<float>(_386);
        if (!_364)
        {
            out.m_27.x = as_type<float>(_386);
        }
    }
    float _388 = _270;
    float _390 = _338;
    bool _392 = !_310;
    float _394 = _388;
    int _396 = as_type<int>(_390);
    float _398 = _390;
    if (!_392)
    {
        float _400 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _402 = _57 + _400;
        float _404 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _406 = _63 + _404;
        float _408 = _402 * _402;
        float _410 = fma(_406, _406, _408);
        float _412 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _414 = sqrt(_410);
        bool _416 = _414 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _418 = isnan(_414);
        bool _420 = _416 || _418;
        bool _422 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _424 = _420 || _422;
        float _426 = _414 * _412;
        float _428 = _426;
        if (!_424)
        {
            float _430 = -_426;
            float _432 = _430 + 1.0;
            _428 = _432;
        }
        float _434 = _428;
        if (!_424)
        {
            float _436 = _434 * _434;
            _394 = _436;
        }
        float _438 = _394;
        if (!_424)
        {
            float _440 = fma(_438, (*spvDescriptorSet0.vp_c4)._m0[22].x, _390);
            _396 = as_type<int>(_440);
        }
        int _442 = _396;
        _398 = as_type<float>(_442);
        if (!_424)
        {
            out.m_27.x = as_type<float>(_442);
        }
    }
    float _444 = _398;
    bool _446 = !_330;
    int _448 = as_type<int>(_444);
    float _450 = _444;
    if (!_446)
    {
        float _452 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _454 = _57 + _452;
        float _456 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _458 = _63 + _456;
        float _460 = _454 * _454;
        float _462 = fma(_458, _458, _460);
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _466 = sqrt(_462);
        bool _468 = _466 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _470 = isnan(_466);
        bool _472 = _468 || _470;
        bool _474 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _476 = _472 || _474;
        float _478 = _466 * _464;
        float _480 = _478;
        if (!_476)
        {
            float _482 = -_478;
            float _484 = _482 + 1.0;
            _480 = _484;
        }
        float _486 = _480;
        float _488 = _486;
        if (!_476)
        {
            float _490 = _486 * _486;
            _488 = _490;
        }
        float _492 = _488;
        if (!_476)
        {
            float _494 = fma(_492, (*spvDescriptorSet0.vp_c4)._m0[23].x, _444);
            _448 = as_type<int>(_494);
        }
        int _496 = _448;
        _450 = as_type<float>(_496);
        if (!_476)
        {
            out.m_27.x = as_type<float>(_496);
        }
    }
    float _498 = _450;
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _500 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _502 = _57 + _500;
    float _504 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _506 = _63 + _504;
    float _508 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _510 = _502 * _502;
    float _512 = fma(_506, _506, _510);
    float _514 = sqrt(_512);
    bool _516 = _514 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _518 = isnan(_514);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _524 = _520 || _522;
    float _526 = _514 * _508;
    float _528 = _526;
    if (!_524)
    {
        float _530 = -_526;
        float _532 = _530 + 1.0;
        _528 = _532;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_524)
    {
        float _538 = _534 * _534;
        _536 = _538;
    }
    float _540 = _536;
    int _542 = as_type<int>(_540);
    if (!_524)
    {
        float _544 = fma(_540, (*spvDescriptorSet0.vp_c4)._m0[24].x, _498);
        _542 = as_type<int>(_544);
    }
    int _546 = _542;
    if (!_524)
    {
        out.m_27.x = as_type<float>(_546);
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

