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
    float4 m_27 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_29 [[user(locn5)]];
    float4 m_33 [[user(locn6)]];
    float4 m_31 [[user(locn7)]];
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_24.y;
    bool _55 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _63 = _59 || _61;
    float _65 = in.m_24.z;
    float _67 = in.m_24.x;
    bool _69 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _77 = _73 || _75;
    bool _79 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    bool _85 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _87 = _83 || _85;
    out.m_27.x = 0.0;
    float _89 = 0.0;
    if (_63)
    {
        float _91 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _89 = _91;
    }
    float _93 = _89;
    bool _95 = _51 >= 0.100000001490116119384765625;
    bool _97 = isnan(_51);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.100000001490116119384765625);
    bool _103 = _99 || _101;
    float _105 = _51 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _107 = _51 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _109 = _51 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _111 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[33].x, _105);
    float _113 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[32].x, _107);
    float _115 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[34].x, _109);
    float _117 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _119 = fma(2.0, _117, 0.5);
    float _121 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[33].z, _111);
    float _123 = 0.0;
    float _125 = _115;
    if (_103)
    {
        _123 = _65;
    }
    float _127 = _123;
    float _129 = _127;
    if (!_103)
    {
        float _131 = _65 * 1.0499999523162841796875;
        _129 = _131;
    }
    float _133 = _129;
    float _135 = 0.0;
    if (_103)
    {
        _135 = _67;
    }
    float _137 = _135;
    float _139 = _137;
    if (!_103)
    {
        float _141 = _67 * 1.0499999523162841796875;
        _139 = _141;
    }
    float _143 = _139;
    float _145 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _147 = _133 * _133;
    float _149 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _151 = fma(2.0, _149, 0.5);
    float _153 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _155 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[5].w, _145);
    float _157 = fma(_143, _143, _147);
    float _159 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[32].z, _113);
    float _161 = _121 * _121;
    float _163 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _165 = sqrt(_157);
    float _167 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _169 = fma(_151, (*spvDescriptorSet0.vp_c4)._m0[5].w, _153);
    float _171 = fma(_159, _159, _161);
    float _173 = _163 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _175 = _167 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _177 = _153;
    if (_103)
    {
        _177 = _51;
    }
    float _179 = _177;
    float _181 = _179;
    if (!_103)
    {
        float _183 = _51 + (-0.007000000216066837310791015625);
        _181 = _183;
    }
    float _185 = _181;
    float _187 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[34].z, _115);
    out.m_29.x = _155;
    out.m_29.y = _169;
    out.m_29.z = _173;
    out.m_29.w = _175;
    float _189 = _185 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    if (_63)
    {
        float _191 = _165 * _93;
        float _193 = precise::clamp(_191, 0.0, 1.0);
        _125 = _193;
    }
    float _195 = _125;
    float _197 = fma(_187, _187, _171);
    float _199 = _143 + (-0.5);
    float _201 = _185 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _203 = _165 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _205 = isnan(_165);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _211 = _207 || _209;
    float _213 = rsqrt(_197);
    float _215 = _195;
    if (_63)
    {
        float _217 = -_195;
        float _219 = _217 + 1.0;
        _215 = _219;
    }
    float _221 = _215;
    float _223 = _133 + (-0.5);
    float _225 = _199 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _227 = _185 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _229 = _185 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _231 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _201);
    float _233 = _223 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _235 = _225 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _237 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[5].x, _189);
    float _239 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[6].x, _227);
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _243 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _245 = fma(_235, 10.0, _243);
    float _247 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[5].z, _237);
    float _249 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[4].z, _231);
    float _251 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _253 = fma(_241, 10.0, _251);
    float _255 = _245 * 0.15915493667125701904296875;
    float _257 = _247 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _259 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[7].x, _229);
    float _261 = _253 * 0.15915493667125701904296875;
    float _263 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[6].z, _239);
    float _265 = _249 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _267 = _257 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _269 = _257 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _271 = _255 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _263 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _277 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[10].x, _267);
    float _279 = _257 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[11].x, _269);
    float _283 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[7].z, _259);
    float _285 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[10].z, _277);
    float _287 = _257 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _289 = _261 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[8].x, _279);
    float _295 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[11].z, _281);
    float _297 = _283 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _299 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[9].x, _287);
    float _301 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[8].z, _293);
    float _303 = _121 * _213;
    float _305 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[11].w, _295);
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[9].z, _299);
    float _309 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[8].w, _301);
    float _311 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[10].w, _285);
    float _313 = fma(_273, 0.0350000001490116119384765625, _235);
    int _316 = as_type<int>(_301);
    int _318 = as_type<int>(_221);
    int _320 = as_type<int>(_265);
    float _322 = _309;
    if (_211)
    {
        _316 = as_type<int>(_305);
    }
    int _324 = _316;
    out.m_31.x = _303;
    int _326 = _324;
    if (!_211)
    {
        _326 = 0;
    }
    int _328 = _326;
    float _330 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[9].w, _307);
    float _332 = fma(_291, -0.01750000007450580596923828125, _241);
    int _334 = as_type<int>(_330);
    if (_63)
    {
        float _336 = _221 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _318 = as_type<int>(_336);
    }
    int _338 = _318;
    out.m_33.x = as_type<float>(_328);
    if (!_77)
    {
        _320 = 1065353216;
    }
    int _340 = _320;
    out.m_35.x = _313;
    out.m_35.y = _332;
    float _342 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[45].y, _311);
    out.m_37.x = 1.0;
    out.gl_Position.x = _309;
    out.gl_Position.y = _330;
    out.gl_Position.z = _344;
    out.gl_Position.w = _305;
    int _346 = _340;
    if (_63)
    {
        out.m_27.x = as_type<float>(_338);
    }
    bool _348 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _356 = _352 || _354;
    if (!_211)
    {
        out.gl_Position.w = 0.0;
    }
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _366 = _362 || _364;
    bool _368 = !_77;
    if (!_368)
    {
        float _370 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _372 = _133 + _370;
        float _374 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _376 = _143 + _374;
        float _378 = _372 * _372;
        float _380 = fma(_376, _376, _378);
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _384 = sqrt(_380);
        bool _386 = _384 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _388 = isnan(_384);
        bool _390 = _386 || _388;
        bool _392 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _394 = _390 || _392;
        float _396 = _384 * _382;
        int _398 = as_type<int>(_396);
        if (!_394)
        {
            float _400 = -_396;
            float _402 = _400 + 1.0;
            _322 = _402;
        }
        float _404 = _322;
        float _406 = _404;
        if (_394)
        {
            _398 = 1065353216;
        }
        int _408 = _398;
        int _410 = _408;
        if (!_394)
        {
            float _412 = _404 * _404;
            _406 = _412;
        }
        float _414 = _406;
        if (!_394)
        {
            float _416 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _410 = as_type<int>(_416);
        }
        int _418 = _410;
        _346 = _418;
        if (!_394)
        {
            out.m_37.x = as_type<float>(_418);
        }
    }
    int _420 = _346;
    if (!_366)
    {
        _334 = _420;
    }
    int _422 = _334;
    bool _424 = !_366;
    int _426 = _422;
    float _428 = as_type<float>(_422);
    if (!_424)
    {
        float _430 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _432 = _133 + _430;
        float _434 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _436 = _143 + _434;
        float _438 = _432 * _432;
        float _440 = fma(_436, _436, _438);
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _444 = sqrt(_440);
        bool _446 = _444 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _448 = isnan(_444);
        bool _450 = _446 || _448;
        bool _452 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _454 = _450 || _452;
        float _456 = _444 * _442;
        float _458 = _456;
        if (!_454)
        {
            float _460 = -_456;
            float _462 = _460 + 1.0;
            _458 = _462;
        }
        float _464 = _458;
        float _466 = _464;
        if (_454)
        {
            _426 = _420;
        }
        int _468 = _426;
        int _470 = _468;
        if (!_454)
        {
            float _472 = _464 * _464;
            _466 = _472;
        }
        float _474 = _466;
        if (!_454)
        {
            float _476 = fma(_474, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_420));
            _470 = as_type<int>(_476);
        }
        int _478 = _470;
        _428 = as_type<float>(_478);
        if (!_454)
        {
            out.m_37.x = as_type<float>(_478);
        }
    }
    float _480 = _428;
    bool _482 = !_356;
    int _484 = as_type<int>(_480);
    float _486 = _480;
    if (!_482)
    {
        float _488 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _490 = _133 + _488;
        float _492 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _494 = _143 + _492;
        float _496 = _490 * _490;
        float _498 = fma(_494, _494, _496);
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _502 = sqrt(_498);
        bool _504 = _502 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _506 = isnan(_502);
        bool _508 = _504 || _506;
        bool _510 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _512 = _508 || _510;
        float _514 = _502 * _500;
        float _516 = _514;
        if (!_512)
        {
            float _518 = -_514;
            float _520 = _518 + 1.0;
            _516 = _520;
        }
        float _522 = _516;
        float _524 = _522;
        if (!_512)
        {
            float _526 = _522 * _522;
            _524 = _526;
        }
        float _528 = _524;
        if (!_512)
        {
            float _530 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[23].x, _480);
            _484 = as_type<int>(_530);
        }
        int _532 = _484;
        _486 = as_type<float>(_532);
        if (!_512)
        {
            out.m_37.x = as_type<float>(_532);
        }
    }
    float _534 = _486;
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _536 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _538 = _133 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _542 = _143 + _540;
    float _544 = _538 * _538;
    float _546 = fma(_542, _542, _544);
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _550 = sqrt(_546);
    bool _552 = _550 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _554 = isnan(_550);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _560 = _556 || _558;
    float _562 = _550 * _548;
    float _564 = _562;
    if (!_560)
    {
        float _566 = -_562;
        float _568 = _566 + 1.0;
        _564 = _568;
    }
    float _570 = _564;
    float _572 = _570;
    if (!_560)
    {
        float _574 = _570 * _570;
        _572 = _574;
    }
    float _576 = _572;
    int _578 = as_type<int>(_576);
    if (!_560)
    {
        float _580 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[24].x, _534);
        _578 = as_type<int>(_580);
    }
    int _582 = _578;
    if (!_560)
    {
        out.m_37.x = as_type<float>(_582);
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_24.y;
    bool _55 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _63 = _59 || _61;
    float _65 = in.m_24.z;
    float _67 = in.m_24.x;
    bool _69 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _77 = _73 || _75;
    bool _79 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    bool _85 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _87 = _83 || _85;
    out.m_27.x = 0.0;
    float _89 = 0.0;
    if (_63)
    {
        float _91 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _89 = _91;
    }
    float _93 = _89;
    bool _95 = _51 >= 0.100000001490116119384765625;
    bool _97 = isnan(_51);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.100000001490116119384765625);
    bool _103 = _99 || _101;
    float _105 = _51 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _107 = _51 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _109 = _51 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _111 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[33].x, _105);
    float _113 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[32].x, _107);
    float _115 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[34].x, _109);
    float _117 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _119 = fma(2.0, _117, 0.5);
    float _121 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[33].z, _111);
    float _123 = 0.0;
    float _125 = _115;
    if (_103)
    {
        _123 = _65;
    }
    float _127 = _123;
    float _129 = _127;
    if (!_103)
    {
        float _131 = _65 * 1.0499999523162841796875;
        _129 = _131;
    }
    float _133 = _129;
    float _135 = 0.0;
    if (_103)
    {
        _135 = _67;
    }
    float _137 = _135;
    float _139 = _137;
    if (!_103)
    {
        float _141 = _67 * 1.0499999523162841796875;
        _139 = _141;
    }
    float _143 = _139;
    float _145 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _147 = _133 * _133;
    float _149 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _151 = fma(2.0, _149, 0.5);
    float _153 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _155 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[5].w, _145);
    float _157 = fma(_143, _143, _147);
    float _159 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[32].z, _113);
    float _161 = _121 * _121;
    float _163 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _165 = sqrt(_157);
    float _167 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _169 = fma(_151, (*spvDescriptorSet0.vp_c4)._m0[5].w, _153);
    float _171 = fma(_159, _159, _161);
    float _173 = _163 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _175 = _167 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _177 = _153;
    if (_103)
    {
        _177 = _51;
    }
    float _179 = _177;
    float _181 = _179;
    if (!_103)
    {
        float _183 = _51 + (-0.007000000216066837310791015625);
        _181 = _183;
    }
    float _185 = _181;
    float _187 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[34].z, _115);
    out.m_29.x = _155;
    out.m_29.y = _169;
    out.m_29.z = _173;
    out.m_29.w = _175;
    float _189 = _185 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    if (_63)
    {
        float _191 = _165 * _93;
        float _193 = precise::clamp(_191, 0.0, 1.0);
        _125 = _193;
    }
    float _195 = _125;
    float _197 = fma(_187, _187, _171);
    float _199 = _143 + (-0.5);
    float _201 = _185 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _203 = _165 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _205 = isnan(_165);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _211 = _207 || _209;
    float _213 = rsqrt(_197);
    float _215 = _195;
    if (_63)
    {
        float _217 = -_195;
        float _219 = _217 + 1.0;
        _215 = _219;
    }
    float _221 = _215;
    float _223 = _133 + (-0.5);
    float _225 = _199 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _227 = _185 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _229 = _185 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _231 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _201);
    float _233 = _223 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _235 = _225 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _237 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[5].x, _189);
    float _239 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[6].x, _227);
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _243 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _245 = fma(_235, 10.0, _243);
    float _247 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[5].z, _237);
    float _249 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[4].z, _231);
    float _251 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _253 = fma(_241, 10.0, _251);
    float _255 = _245 * 0.15915493667125701904296875;
    float _257 = _247 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _259 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[7].x, _229);
    float _261 = _253 * 0.15915493667125701904296875;
    float _263 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[6].z, _239);
    float _265 = _249 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _267 = _257 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _269 = _257 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _271 = _255 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _263 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _277 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[10].x, _267);
    float _279 = _257 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[11].x, _269);
    float _283 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[7].z, _259);
    float _285 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[10].z, _277);
    float _287 = _257 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _289 = _261 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[8].x, _279);
    float _295 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[11].z, _281);
    float _297 = _283 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _299 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[9].x, _287);
    float _301 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[8].z, _293);
    float _303 = _121 * _213;
    float _305 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[11].w, _295);
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[9].z, _299);
    float _309 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[8].w, _301);
    float _311 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[10].w, _285);
    float _313 = fma(_273, 0.0350000001490116119384765625, _235);
    int _316 = as_type<int>(_301);
    int _318 = as_type<int>(_221);
    int _320 = as_type<int>(_265);
    float _322 = _309;
    if (_211)
    {
        _316 = as_type<int>(_305);
    }
    int _324 = _316;
    out.m_31.x = _303;
    int _326 = _324;
    if (!_211)
    {
        _326 = 0;
    }
    int _328 = _326;
    float _330 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[9].w, _307);
    float _332 = fma(_291, -0.01750000007450580596923828125, _241);
    int _334 = as_type<int>(_330);
    if (_63)
    {
        float _336 = _221 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _318 = as_type<int>(_336);
    }
    int _338 = _318;
    out.m_33.x = as_type<float>(_328);
    if (!_77)
    {
        _320 = 1065353216;
    }
    int _340 = _320;
    out.m_35.x = _313;
    out.m_35.y = _332;
    float _342 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[45].y, _311);
    out.m_37.x = 1.0;
    out.gl_Position.x = _309;
    out.gl_Position.y = _330;
    out.gl_Position.z = _344;
    out.gl_Position.w = _305;
    int _346 = _340;
    if (_63)
    {
        out.m_27.x = as_type<float>(_338);
    }
    bool _348 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _356 = _352 || _354;
    if (!_211)
    {
        out.gl_Position.w = 0.0;
    }
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _366 = _362 || _364;
    bool _368 = !_77;
    if (!_368)
    {
        float _370 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _372 = _133 + _370;
        float _374 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _376 = _143 + _374;
        float _378 = _372 * _372;
        float _380 = fma(_376, _376, _378);
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _384 = sqrt(_380);
        bool _386 = _384 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _388 = isnan(_384);
        bool _390 = _386 || _388;
        bool _392 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _394 = _390 || _392;
        float _396 = _384 * _382;
        int _398 = as_type<int>(_396);
        if (!_394)
        {
            float _400 = -_396;
            float _402 = _400 + 1.0;
            _322 = _402;
        }
        float _404 = _322;
        float _406 = _404;
        if (_394)
        {
            _398 = 1065353216;
        }
        int _408 = _398;
        int _410 = _408;
        if (!_394)
        {
            float _412 = _404 * _404;
            _406 = _412;
        }
        float _414 = _406;
        if (!_394)
        {
            float _416 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _410 = as_type<int>(_416);
        }
        int _418 = _410;
        _346 = _418;
        if (!_394)
        {
            out.m_37.x = as_type<float>(_418);
        }
    }
    int _420 = _346;
    if (!_366)
    {
        _334 = _420;
    }
    int _422 = _334;
    bool _424 = !_366;
    int _426 = _422;
    float _428 = as_type<float>(_422);
    if (!_424)
    {
        float _430 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _432 = _133 + _430;
        float _434 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _436 = _143 + _434;
        float _438 = _432 * _432;
        float _440 = fma(_436, _436, _438);
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _444 = sqrt(_440);
        bool _446 = _444 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _448 = isnan(_444);
        bool _450 = _446 || _448;
        bool _452 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _454 = _450 || _452;
        float _456 = _444 * _442;
        float _458 = _456;
        if (!_454)
        {
            float _460 = -_456;
            float _462 = _460 + 1.0;
            _458 = _462;
        }
        float _464 = _458;
        float _466 = _464;
        if (_454)
        {
            _426 = _420;
        }
        int _468 = _426;
        int _470 = _468;
        if (!_454)
        {
            float _472 = _464 * _464;
            _466 = _472;
        }
        float _474 = _466;
        if (!_454)
        {
            float _476 = fma(_474, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_420));
            _470 = as_type<int>(_476);
        }
        int _478 = _470;
        _428 = as_type<float>(_478);
        if (!_454)
        {
            out.m_37.x = as_type<float>(_478);
        }
    }
    float _480 = _428;
    bool _482 = !_356;
    int _484 = as_type<int>(_480);
    float _486 = _480;
    if (!_482)
    {
        float _488 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _490 = _133 + _488;
        float _492 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _494 = _143 + _492;
        float _496 = _490 * _490;
        float _498 = fma(_494, _494, _496);
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _502 = sqrt(_498);
        bool _504 = _502 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _506 = isnan(_502);
        bool _508 = _504 || _506;
        bool _510 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _512 = _508 || _510;
        float _514 = _502 * _500;
        float _516 = _514;
        if (!_512)
        {
            float _518 = -_514;
            float _520 = _518 + 1.0;
            _516 = _520;
        }
        float _522 = _516;
        float _524 = _522;
        if (!_512)
        {
            float _526 = _522 * _522;
            _524 = _526;
        }
        float _528 = _524;
        if (!_512)
        {
            float _530 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[23].x, _480);
            _484 = as_type<int>(_530);
        }
        int _532 = _484;
        _486 = as_type<float>(_532);
        if (!_512)
        {
            out.m_37.x = as_type<float>(_532);
        }
    }
    float _534 = _486;
    if (!_87)
    {
        return out;
    }
    float _536 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _538 = _133 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _542 = _143 + _540;
    float _544 = _538 * _538;
    float _546 = fma(_542, _542, _544);
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _550 = sqrt(_546);
    bool _552 = _550 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _554 = isnan(_550);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _560 = _556 || _558;
    float _562 = _550 * _548;
    float _564 = _562;
    if (!_560)
    {
        float _566 = -_562;
        float _568 = _566 + 1.0;
        _564 = _568;
    }
    float _570 = _564;
    float _572 = _570;
    if (!_560)
    {
        float _574 = _570 * _570;
        _572 = _574;
    }
    float _576 = _572;
    int _578 = as_type<int>(_576);
    if (!_560)
    {
        float _580 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[24].x, _534);
        _578 = as_type<int>(_580);
    }
    int _582 = _578;
    if (!_560)
    {
        out.m_37.x = as_type<float>(_582);
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
    out.m_27 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = in.m_24.y;
    bool _55 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _57 = isnan(0.0);
    bool _59 = _55 || _57;
    bool _61 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _63 = _59 || _61;
    float _65 = in.m_24.z;
    float _67 = in.m_24.x;
    bool _69 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _71 = isnan(0.0);
    bool _73 = _69 || _71;
    bool _75 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _77 = _73 || _75;
    bool _79 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _81 = isnan(0.0);
    bool _83 = _79 || _81;
    bool _85 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _87 = _83 || _85;
    out.m_27.x = 0.0;
    float _89 = 0.0;
    if (_63)
    {
        float _91 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _89 = _91;
    }
    float _93 = _89;
    bool _95 = _51 >= 0.100000001490116119384765625;
    bool _97 = isnan(_51);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.100000001490116119384765625);
    bool _103 = _99 || _101;
    float _105 = _51 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _107 = _51 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _109 = _51 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _111 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[33].x, _105);
    float _113 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[32].x, _107);
    float _115 = fma(_67, (*spvDescriptorSet0.vp_c4)._m0[34].x, _109);
    float _117 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _119 = fma(2.0, _117, 0.5);
    float _121 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[33].z, _111);
    float _123 = 0.0;
    float _125 = _115;
    if (_103)
    {
        _123 = _65;
    }
    float _127 = _123;
    float _129 = _127;
    if (!_103)
    {
        float _131 = _65 * 1.0499999523162841796875;
        _129 = _131;
    }
    float _133 = _129;
    float _135 = 0.0;
    if (_103)
    {
        _135 = _67;
    }
    float _137 = _135;
    float _139 = _137;
    if (!_103)
    {
        float _141 = _67 * 1.0499999523162841796875;
        _139 = _141;
    }
    float _143 = _139;
    float _145 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _147 = _133 * _133;
    float _149 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _151 = fma(2.0, _149, 0.5);
    float _153 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _155 = fma(_119, (*spvDescriptorSet0.vp_c4)._m0[5].w, _145);
    float _157 = fma(_143, _143, _147);
    float _159 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[32].z, _113);
    float _161 = _121 * _121;
    float _163 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _165 = sqrt(_157);
    float _167 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _169 = fma(_151, (*spvDescriptorSet0.vp_c4)._m0[5].w, _153);
    float _171 = fma(_159, _159, _161);
    float _173 = _163 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _175 = _167 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _177 = _153;
    if (_103)
    {
        _177 = _51;
    }
    float _179 = _177;
    float _181 = _179;
    if (!_103)
    {
        float _183 = _51 + (-0.007000000216066837310791015625);
        _181 = _183;
    }
    float _185 = _181;
    float _187 = fma(_65, (*spvDescriptorSet0.vp_c4)._m0[34].z, _115);
    out.m_29.x = _155;
    out.m_29.y = _169;
    out.m_29.z = _173;
    out.m_29.w = _175;
    float _189 = _185 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    if (_63)
    {
        float _191 = _165 * _93;
        float _193 = precise::clamp(_191, 0.0, 1.0);
        _125 = _193;
    }
    float _195 = _125;
    float _197 = fma(_187, _187, _171);
    float _199 = _143 + (-0.5);
    float _201 = _185 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    bool _203 = _165 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _205 = isnan(_165);
    bool _207 = _203 || _205;
    bool _209 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _211 = _207 || _209;
    float _213 = rsqrt(_197);
    float _215 = _195;
    if (_63)
    {
        float _217 = -_195;
        float _219 = _217 + 1.0;
        _215 = _219;
    }
    float _221 = _215;
    float _223 = _133 + (-0.5);
    float _225 = _199 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _227 = _185 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _229 = _185 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _231 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[4].x, _201);
    float _233 = _223 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _235 = _225 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _237 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[5].x, _189);
    float _239 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[6].x, _227);
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _243 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _245 = fma(_235, 10.0, _243);
    float _247 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[5].z, _237);
    float _249 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[4].z, _231);
    float _251 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _253 = fma(_241, 10.0, _251);
    float _255 = _245 * 0.15915493667125701904296875;
    float _257 = _247 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _259 = fma(_143, (*spvDescriptorSet0.vp_c3)._m0[7].x, _229);
    float _261 = _253 * 0.15915493667125701904296875;
    float _263 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[6].z, _239);
    float _265 = _249 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _267 = _257 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _269 = _257 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _271 = _255 * 6.283185482025146484375;
    float _273 = sin(_271);
    float _275 = _263 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _277 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[10].x, _267);
    float _279 = _257 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[11].x, _269);
    float _283 = fma(_133, (*spvDescriptorSet0.vp_c3)._m0[7].z, _259);
    float _285 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[10].z, _277);
    float _287 = _257 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _289 = _261 * 6.283185482025146484375;
    float _291 = sin(_289);
    float _293 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[8].x, _279);
    float _295 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[11].z, _281);
    float _297 = _283 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _299 = fma(_265, (*spvDescriptorSet0.vp_c3)._m0[9].x, _287);
    float _301 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[8].z, _293);
    float _303 = _121 * _213;
    float _305 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[11].w, _295);
    float _307 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[9].z, _299);
    float _309 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[8].w, _301);
    float _311 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[10].w, _285);
    float _313 = fma(_273, 0.0350000001490116119384765625, _235);
    int _316 = as_type<int>(_301);
    int _318 = as_type<int>(_221);
    int _320 = as_type<int>(_265);
    float _322 = _309;
    if (_211)
    {
        _316 = as_type<int>(_305);
    }
    int _324 = _316;
    out.m_31.x = _303;
    int _326 = _324;
    if (!_211)
    {
        _326 = 0;
    }
    int _328 = _326;
    float _330 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[9].w, _307);
    float _332 = fma(_291, -0.01750000007450580596923828125, _241);
    int _334 = as_type<int>(_330);
    if (_63)
    {
        float _336 = _221 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _318 = as_type<int>(_336);
    }
    int _338 = _318;
    out.m_33.x = as_type<float>(_328);
    if (!_77)
    {
        _320 = 1065353216;
    }
    int _340 = _320;
    out.m_35.x = _313;
    out.m_35.y = _332;
    float _342 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[45].y, _311);
    out.m_37.x = 1.0;
    out.gl_Position.x = _309;
    out.gl_Position.y = _330;
    out.gl_Position.z = _344;
    out.gl_Position.w = _305;
    int _346 = _340;
    if (_63)
    {
        out.m_27.x = as_type<float>(_338);
    }
    bool _348 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _350 = isnan(0.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _356 = _352 || _354;
    if (!_211)
    {
        out.gl_Position.w = 0.0;
    }
    bool _358 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _360 = isnan(0.0);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _366 = _362 || _364;
    bool _368 = !_77;
    if (!_368)
    {
        float _370 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _372 = _133 + _370;
        float _374 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _376 = _143 + _374;
        float _378 = _372 * _372;
        float _380 = fma(_376, _376, _378);
        float _382 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _384 = sqrt(_380);
        bool _386 = _384 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _388 = isnan(_384);
        bool _390 = _386 || _388;
        bool _392 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _394 = _390 || _392;
        float _396 = _384 * _382;
        int _398 = as_type<int>(_396);
        if (!_394)
        {
            float _400 = -_396;
            float _402 = _400 + 1.0;
            _322 = _402;
        }
        float _404 = _322;
        float _406 = _404;
        if (_394)
        {
            _398 = 1065353216;
        }
        int _408 = _398;
        int _410 = _408;
        if (!_394)
        {
            float _412 = _404 * _404;
            _406 = _412;
        }
        float _414 = _406;
        if (!_394)
        {
            float _416 = fma(_414, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _410 = as_type<int>(_416);
        }
        int _418 = _410;
        _346 = _418;
        if (!_394)
        {
            out.m_37.x = as_type<float>(_418);
        }
    }
    int _420 = _346;
    if (!_366)
    {
        _334 = _420;
    }
    int _422 = _334;
    bool _424 = !_366;
    int _426 = _422;
    float _428 = as_type<float>(_422);
    if (!_424)
    {
        float _430 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _432 = _133 + _430;
        float _434 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _436 = _143 + _434;
        float _438 = _432 * _432;
        float _440 = fma(_436, _436, _438);
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _444 = sqrt(_440);
        bool _446 = _444 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _448 = isnan(_444);
        bool _450 = _446 || _448;
        bool _452 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _454 = _450 || _452;
        float _456 = _444 * _442;
        float _458 = _456;
        if (!_454)
        {
            float _460 = -_456;
            float _462 = _460 + 1.0;
            _458 = _462;
        }
        float _464 = _458;
        float _466 = _464;
        if (_454)
        {
            _426 = _420;
        }
        int _468 = _426;
        int _470 = _468;
        if (!_454)
        {
            float _472 = _464 * _464;
            _466 = _472;
        }
        float _474 = _466;
        if (!_454)
        {
            float _476 = fma(_474, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_420));
            _470 = as_type<int>(_476);
        }
        int _478 = _470;
        _428 = as_type<float>(_478);
        if (!_454)
        {
            out.m_37.x = as_type<float>(_478);
        }
    }
    float _480 = _428;
    bool _482 = !_356;
    int _484 = as_type<int>(_480);
    float _486 = _480;
    if (!_482)
    {
        float _488 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _490 = _133 + _488;
        float _492 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _494 = _143 + _492;
        float _496 = _490 * _490;
        float _498 = fma(_494, _494, _496);
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _502 = sqrt(_498);
        bool _504 = _502 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _506 = isnan(_502);
        bool _508 = _504 || _506;
        bool _510 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _512 = _508 || _510;
        float _514 = _502 * _500;
        float _516 = _514;
        if (!_512)
        {
            float _518 = -_514;
            float _520 = _518 + 1.0;
            _516 = _520;
        }
        float _522 = _516;
        float _524 = _522;
        if (!_512)
        {
            float _526 = _522 * _522;
            _524 = _526;
        }
        float _528 = _524;
        if (!_512)
        {
            float _530 = fma(_528, (*spvDescriptorSet0.vp_c4)._m0[23].x, _480);
            _484 = as_type<int>(_530);
        }
        int _532 = _484;
        _486 = as_type<float>(_532);
        if (!_512)
        {
            out.m_37.x = as_type<float>(_532);
        }
    }
    float _534 = _486;
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _536 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
    float _538 = _133 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
    float _542 = _143 + _540;
    float _544 = _538 * _538;
    float _546 = fma(_542, _542, _544);
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
    float _550 = sqrt(_546);
    bool _552 = _550 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _554 = isnan(_550);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _560 = _556 || _558;
    float _562 = _550 * _548;
    float _564 = _562;
    if (!_560)
    {
        float _566 = -_562;
        float _568 = _566 + 1.0;
        _564 = _568;
    }
    float _570 = _564;
    float _572 = _570;
    if (!_560)
    {
        float _574 = _570 * _570;
        _572 = _574;
    }
    float _576 = _572;
    int _578 = as_type<int>(_576);
    if (!_560)
    {
        float _580 = fma(_576, (*spvDescriptorSet0.vp_c4)._m0[24].x, _534);
        _578 = as_type<int>(_580);
    }
    int _582 = _578;
    if (!_560)
    {
        out.m_37.x = as_type<float>(_582);
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_27.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_27.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_27.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_27.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

