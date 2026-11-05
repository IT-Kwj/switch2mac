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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_37 [[attribute(5)]];
    float4 m_35 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_28.w;
    float _59 = trunc(_57);
    int _62 = int(_59);
    bool _66 = _62 >= 1;
    float _68 = 0.0;
    float _70 = as_type<float>(_62);
    if (!_66)
    {
        _68 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _72 = _68;
    if (!_66)
    {
        out.m_31.x = 0.0;
    }
    int _74 = 0;
    if (!_66)
    {
        float _76 = _72 * 5.0;
        _74 = as_type<int>(_76);
    }
    int _78 = _74;
    int _80 = _78;
    if (!_66)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _543 = as_type<float>(_78);
        out.gl_Position.z = _543;
    }
    if (!_66)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _82 = in.m_33.w;
    bool _84 = _82 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _86 = isnan(_82);
    bool _88 = _84 || _86;
    bool _90 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _92 = _88 || _90;
    float _94 = -_82;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_92)
    {
        float _98 = float(_62);
        _70 = _98;
    }
    float _100 = _70;
    bool _102 = _96 >= _100;
    bool _104 = !_92;
    bool _106 = _102 || _104;
    float _108 = _100;
    if (_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (_106)
    {
        out.m_31.x = 0.0;
    }
    if (_106)
    {
        float _112 = _110 * 5.0;
        _80 = as_type<int>(_112);
    }
    int _114 = _80;
    if (_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _612 = as_type<float>(_114);
        out.gl_Position.z = _612;
    }
    if (_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_35.x;
    float _118 = in.m_35.y;
    float _120 = in.m_35.z;
    float _122 = in.m_35.w;
    float _124 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _126 = in.m_37.x;
    float _128 = in.m_37.y;
    float _130 = in.m_37.z;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_33.x;
    float _144 = in.m_33.y;
    float _146 = in.m_33.z;
    float _148 = in.m_28.x;
    float _150 = in.m_28.y;
    float _152 = in.m_28.z;
    float _154 = _120 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _156 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _130);
    float _158 = _154 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _160 = _154;
    float _162 = _124;
    float _164 = _126;
    if (!_140)
    {
        float _166 = _124 * _124;
        float _168 = _166 * 0.5;
        _160 = _168;
    }
    float _170 = _160;
    float _172 = _158 * _156;
    float _174 = _170;
    if (!_140)
    {
        float _176 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_140;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _124 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _124);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_140;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _124 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _162 = _236;
    }
    float _238 = _162;
    float _240 = _118 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = _116 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _128);
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _250 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _126);
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _256 = _248 * _244;
    float _258 = fma(_238, _144, _246);
    float _260 = fma(_238, _142, _250);
    float _262 = _254 * _252;
    float _264 = _256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _266 = fma(_258, _122, _150);
    float _268 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = _256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _272 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _264);
    float _274 = fma(_260, _122, _148);
    float _276 = fma(_238, _146, _268);
    float _278 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _280 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _270);
    float _284 = fma(_276, _122, _152);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _278);
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _280);
    float _290 = _256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _292 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _282);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _286);
    float _298 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _272);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _288);
    float _302 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _290);
    float _304 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _308 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _310 = _298 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _312 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _302);
    float _316 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _318 = _308 + _306;
    float _320 = _312 + _310;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _324 = _314 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _326 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = _318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _332 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = _326 + _324;
    float _336 = _318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _328);
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _342 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _336);
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _338);
    float _348 = abs(_126);
    float _350 = _348 + (-1.0);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _354 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = _318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _358 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[0].z, _344);
    float _360 = _346 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _362 = abs(_350);
    bool _364 = _362 >= 0.001000000047497451305389404296875;
    bool _366 = isnan(_362);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.001000000047497451305389404296875);
    bool _372 = _368 || _370;
    out.m_39.x = _342;
    out.m_39.y = _354;
    out.m_39.z = _332;
    out.m_39.w = _352;
    float _374 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _356);
    float _376 = _358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _378 = _360 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _380 = _318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _382 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[2].z, _374);
    float _384 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[7].x, _378);
    float _386 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _380);
    float _388 = _382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _390 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[3].z, _386);
    float _392 = _126 * (*spvDescriptorSet0.vp_c13)._m0[0].x;
    float _394 = _392 * 2.0;
    float _396 = 2.0 * (*spvDescriptorSet0.vp_c13)._m0[0].y;
    float _398 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _384);
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    float _400 = _390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _402 = abs(_394);
    bool _404 = _402 < 1.0;
    float _406 = abs(_394);
    bool _408 = _406 < 1.0;
    bool _410 = !_372;
    bool _412 = _408 && _410;
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _398);
    float _416 = fma(_396, _128, (*spvDescriptorSet0.vp_c13)._m0[2].w);
    float _418 = _396;
    if (_412)
    {
        _418 = _126;
    }
    float _420 = _418;
    float _422 = _420;
    float _424 = _420;
    if (_412)
    {
        _164 = _416;
    }
    float _426 = _164;
    bool _428 = !_372;
    bool _430 = _428 && _404;
    float _432 = _426;
    if (!_430)
    {
        float _434 = abs(_128);
        float _436 = _434 + (-1.0);
        float _438 = abs(_436);
        bool _440 = _438 >= 0.001000000047497451305389404296875;
        bool _442 = isnan(_438);
        bool _444 = _440 || _442;
        bool _446 = isnan(0.001000000047497451305389404296875);
        bool _448 = _444 || _446;
        float _450 = abs(_416);
        bool _452 = _450 < 1.0;
        bool _454 = !_448;
        bool _456 = _452 && _454;
        float _458 = _436;
        if (!_456)
        {
            _422 = _394;
        }
        float _460 = _422;
        float _462 = _460;
        if (!_456)
        {
            _458 = _416;
        }
        float _464 = _458;
        _432 = _464;
        if (_456)
        {
            _462 = _394;
        }
        float _466 = _462;
        _424 = _466;
        if (_456)
        {
            _432 = _128;
        }
    }
    float _468 = _424;
    float _470 = _432;
    float _472 = _414 * _468;
    float _474 = fma(_470, -0.5, 0.5);
    float _476 = _414 * _470;
    float _478 = -_414;
    float _480 = (-0.0) + _478;
    float _482 = _414 + _472;
    float _484 = _414 * _474;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _486 = _482 * 0.5;
    out.gl_Position.w = _414;
    out.m_43.w = _414;
    out.gl_Position.x = _472;
    out.gl_Position.y = _476;
    out.gl_Position.z = _480;
    out.m_43.y = _484;
    out.m_43.x = _486;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_28.w;
    float _59 = trunc(_57);
    int _62 = int(_59);
    bool _66 = _62 >= 1;
    float _68 = 0.0;
    float _70 = as_type<float>(_62);
    if (!_66)
    {
        _68 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _72 = _68;
    if (!_66)
    {
        out.m_31.x = 0.0;
    }
    int _74 = 0;
    if (!_66)
    {
        float _76 = _72 * 5.0;
        _74 = as_type<int>(_76);
    }
    int _78 = _74;
    int _80 = _78;
    if (!_66)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _543 = as_type<float>(_78);
        out.gl_Position.z = _543;
    }
    if (!_66)
    {
        return out;
    }
    float _82 = in.m_33.w;
    bool _84 = _82 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _86 = isnan(_82);
    bool _88 = _84 || _86;
    bool _90 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _92 = _88 || _90;
    float _94 = -_82;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_92)
    {
        float _98 = float(_62);
        _70 = _98;
    }
    float _100 = _70;
    bool _102 = _96 >= _100;
    bool _104 = !_92;
    bool _106 = _102 || _104;
    float _108 = _100;
    if (_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (_106)
    {
        out.m_31.x = 0.0;
    }
    if (_106)
    {
        float _112 = _110 * 5.0;
        _80 = as_type<int>(_112);
    }
    int _114 = _80;
    if (_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _612 = as_type<float>(_114);
        out.gl_Position.z = _612;
    }
    if (_106)
    {
        return out;
    }
    float _116 = in.m_35.x;
    float _118 = in.m_35.y;
    float _120 = in.m_35.z;
    float _122 = in.m_35.w;
    float _124 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _126 = in.m_37.x;
    float _128 = in.m_37.y;
    float _130 = in.m_37.z;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_33.x;
    float _144 = in.m_33.y;
    float _146 = in.m_33.z;
    float _148 = in.m_28.x;
    float _150 = in.m_28.y;
    float _152 = in.m_28.z;
    float _154 = _120 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _156 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _130);
    float _158 = _154 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _160 = _154;
    float _162 = _124;
    float _164 = _126;
    if (!_140)
    {
        float _166 = _124 * _124;
        float _168 = _166 * 0.5;
        _160 = _168;
    }
    float _170 = _160;
    float _172 = _158 * _156;
    float _174 = _170;
    if (!_140)
    {
        float _176 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_140;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _124 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _124);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_140;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _124 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _162 = _236;
    }
    float _238 = _162;
    float _240 = _118 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = _116 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _128);
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _250 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _126);
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _256 = _248 * _244;
    float _258 = fma(_238, _144, _246);
    float _260 = fma(_238, _142, _250);
    float _262 = _254 * _252;
    float _264 = _256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _266 = fma(_258, _122, _150);
    float _268 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = _256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _272 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _264);
    float _274 = fma(_260, _122, _148);
    float _276 = fma(_238, _146, _268);
    float _278 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _280 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _270);
    float _284 = fma(_276, _122, _152);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _278);
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _280);
    float _290 = _256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _292 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _282);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _286);
    float _298 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _272);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _288);
    float _302 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _290);
    float _304 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _308 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _310 = _298 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _312 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _302);
    float _316 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _318 = _308 + _306;
    float _320 = _312 + _310;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _324 = _314 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _326 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = _318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _332 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = _326 + _324;
    float _336 = _318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _328);
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _342 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _336);
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _338);
    float _348 = abs(_126);
    float _350 = _348 + (-1.0);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _354 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = _318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _358 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[0].z, _344);
    float _360 = _346 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _362 = abs(_350);
    bool _364 = _362 >= 0.001000000047497451305389404296875;
    bool _366 = isnan(_362);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.001000000047497451305389404296875);
    bool _372 = _368 || _370;
    out.m_39.x = _342;
    out.m_39.y = _354;
    out.m_39.z = _332;
    out.m_39.w = _352;
    float _374 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _356);
    float _376 = _358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _378 = _360 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _380 = _318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _382 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[2].z, _374);
    float _384 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[7].x, _378);
    float _386 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _380);
    float _388 = _382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _390 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[3].z, _386);
    float _392 = _126 * (*spvDescriptorSet0.vp_c13)._m0[0].x;
    float _394 = _392 * 2.0;
    float _396 = 2.0 * (*spvDescriptorSet0.vp_c13)._m0[0].y;
    float _398 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _384);
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    float _400 = _390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _402 = abs(_394);
    bool _404 = _402 < 1.0;
    float _406 = abs(_394);
    bool _408 = _406 < 1.0;
    bool _410 = !_372;
    bool _412 = _408 && _410;
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _398);
    float _416 = fma(_396, _128, (*spvDescriptorSet0.vp_c13)._m0[2].w);
    float _418 = _396;
    if (_412)
    {
        _418 = _126;
    }
    float _420 = _418;
    float _422 = _420;
    float _424 = _420;
    if (_412)
    {
        _164 = _416;
    }
    float _426 = _164;
    bool _428 = !_372;
    bool _430 = _428 && _404;
    float _432 = _426;
    if (!_430)
    {
        float _434 = abs(_128);
        float _436 = _434 + (-1.0);
        float _438 = abs(_436);
        bool _440 = _438 >= 0.001000000047497451305389404296875;
        bool _442 = isnan(_438);
        bool _444 = _440 || _442;
        bool _446 = isnan(0.001000000047497451305389404296875);
        bool _448 = _444 || _446;
        float _450 = abs(_416);
        bool _452 = _450 < 1.0;
        bool _454 = !_448;
        bool _456 = _452 && _454;
        float _458 = _436;
        if (!_456)
        {
            _422 = _394;
        }
        float _460 = _422;
        float _462 = _460;
        if (!_456)
        {
            _458 = _416;
        }
        float _464 = _458;
        _432 = _464;
        if (_456)
        {
            _462 = _394;
        }
        float _466 = _462;
        _424 = _466;
        if (_456)
        {
            _432 = _128;
        }
    }
    float _468 = _424;
    float _470 = _432;
    float _472 = _414 * _468;
    float _474 = fma(_470, -0.5, 0.5);
    float _476 = _414 * _470;
    float _478 = -_414;
    float _480 = (-0.0) + _478;
    float _482 = _414 + _472;
    float _484 = _414 * _474;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _486 = _482 * 0.5;
    out.gl_Position.w = _414;
    out.m_43.w = _414;
    out.gl_Position.x = _472;
    out.gl_Position.y = _476;
    out.gl_Position.z = _480;
    out.m_43.y = _484;
    out.m_43.x = _486;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = in.m_28.w;
    float _59 = trunc(_57);
    int _62 = int(_59);
    bool _66 = _62 >= 1;
    float _68 = 0.0;
    float _70 = as_type<float>(_62);
    if (!_66)
    {
        _68 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _72 = _68;
    if (!_66)
    {
        out.m_31.x = 0.0;
    }
    int _74 = 0;
    if (!_66)
    {
        float _76 = _72 * 5.0;
        _74 = as_type<int>(_76);
    }
    int _78 = _74;
    int _80 = _78;
    if (!_66)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _543 = as_type<float>(_78);
        out.gl_Position.z = _543;
    }
    if (!_66)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _82 = in.m_33.w;
    bool _84 = _82 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _86 = isnan(_82);
    bool _88 = _84 || _86;
    bool _90 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _92 = _88 || _90;
    float _94 = -_82;
    float _96 = _94 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_92)
    {
        float _98 = float(_62);
        _70 = _98;
    }
    float _100 = _70;
    bool _102 = _96 >= _100;
    bool _104 = !_92;
    bool _106 = _102 || _104;
    float _108 = _100;
    if (_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (_106)
    {
        out.m_31.x = 0.0;
    }
    if (_106)
    {
        float _112 = _110 * 5.0;
        _80 = as_type<int>(_112);
    }
    int _114 = _80;
    if (_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _612 = as_type<float>(_114);
        out.gl_Position.z = _612;
    }
    if (_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_35.x;
    float _118 = in.m_35.y;
    float _120 = in.m_35.z;
    float _122 = in.m_35.w;
    float _124 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _126 = in.m_37.x;
    float _128 = in.m_37.y;
    float _130 = in.m_37.z;
    bool _132 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _134 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _136 = _132 || _134;
    bool _138 = isnan(1.0);
    bool _140 = _136 || _138;
    float _142 = in.m_33.x;
    float _144 = in.m_33.y;
    float _146 = in.m_33.z;
    float _148 = in.m_28.x;
    float _150 = in.m_28.y;
    float _152 = in.m_28.z;
    float _154 = _120 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _156 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _130);
    float _158 = _154 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _160 = _154;
    float _162 = _124;
    float _164 = _126;
    if (!_140)
    {
        float _166 = _124 * _124;
        float _168 = _166 * 0.5;
        _160 = _168;
    }
    float _170 = _160;
    float _172 = _158 * _156;
    float _174 = _170;
    if (!_140)
    {
        float _176 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _174 = _176;
    }
    float _178 = _174;
    bool _180 = !_140;
    float _182 = _178;
    if (!_180)
    {
        float _184 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _186 = log2(_184);
        float _188 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _190 = _188 + 1.0;
        float _192 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = _124 * _186;
        float _196 = 1.0 / _190;
        float _198 = _192 * 0.693147182464599609375;
        float _200 = exp2(_194);
        float _202 = 1.0 / _198;
        float _204 = _200 + (-1.0);
        float _206 = -_204;
        float _208 = fma(_206, _202, _124);
        float _210 = _208 * _196;
        float _212 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _212;
    }
    float _214 = _182;
    bool _216 = !_140;
    if (!_216)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = 1.0 / _224;
        float _228 = _124 * _220;
        float _230 = exp2(_228);
        float _232 = -_230;
        float _234 = _232 + 1.0;
        float _236 = _234 * _226;
        _162 = _236;
    }
    float _238 = _162;
    float _240 = _118 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = _116 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _128);
    float _246 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _240 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _250 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _126);
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _256 = _248 * _244;
    float _258 = fma(_238, _144, _246);
    float _260 = fma(_238, _142, _250);
    float _262 = _254 * _252;
    float _264 = _256 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _266 = fma(_258, _122, _150);
    float _268 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = _256 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _272 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _264);
    float _274 = fma(_260, _122, _148);
    float _276 = fma(_238, _146, _268);
    float _278 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _280 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _282 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _270);
    float _284 = fma(_276, _122, _152);
    float _286 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _278);
    float _288 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _280);
    float _290 = _256 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _292 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[25].z, _282);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _286);
    float _298 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[24].z, _272);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _288);
    float _302 = fma(_262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _290);
    float _304 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _294 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _308 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _310 = _298 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _312 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _314 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[26].z, _302);
    float _316 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _318 = _308 + _306;
    float _320 = _312 + _310;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _324 = _314 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _326 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _328 = _318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _332 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = _326 + _324;
    float _336 = _318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _328);
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _342 = _330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _336);
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _338);
    float _348 = abs(_126);
    float _350 = _348 + (-1.0);
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _354 = _340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _356 = _318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _358 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[0].z, _344);
    float _360 = _346 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _362 = abs(_350);
    bool _364 = _362 >= 0.001000000047497451305389404296875;
    bool _366 = isnan(_362);
    bool _368 = _364 || _366;
    bool _370 = isnan(0.001000000047497451305389404296875);
    bool _372 = _368 || _370;
    out.m_39.x = _342;
    out.m_39.y = _354;
    out.m_39.z = _332;
    out.m_39.w = _352;
    float _374 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _356);
    float _376 = _358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _378 = _360 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _380 = _318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _382 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[2].z, _374);
    float _384 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[7].x, _378);
    float _386 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _380);
    float _388 = _382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _390 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[3].z, _386);
    float _392 = _126 * (*spvDescriptorSet0.vp_c13)._m0[0].x;
    float _394 = _392 * 2.0;
    float _396 = 2.0 * (*spvDescriptorSet0.vp_c13)._m0[0].y;
    float _398 = fma(_388, (*spvDescriptorSet0.vp_c8)._m0[7].z, _384);
    out.m_41.x = 1.0;
    out.m_41.y = 1.0;
    out.m_41.z = 1.0;
    float _400 = _390 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _402 = abs(_394);
    bool _404 = _402 < 1.0;
    float _406 = abs(_394);
    bool _408 = _406 < 1.0;
    bool _410 = !_372;
    bool _412 = _408 && _410;
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _398);
    float _416 = fma(_396, _128, (*spvDescriptorSet0.vp_c13)._m0[2].w);
    float _418 = _396;
    if (_412)
    {
        _418 = _126;
    }
    float _420 = _418;
    float _422 = _420;
    float _424 = _420;
    if (_412)
    {
        _164 = _416;
    }
    float _426 = _164;
    bool _428 = !_372;
    bool _430 = _428 && _404;
    float _432 = _426;
    if (!_430)
    {
        float _434 = abs(_128);
        float _436 = _434 + (-1.0);
        float _438 = abs(_436);
        bool _440 = _438 >= 0.001000000047497451305389404296875;
        bool _442 = isnan(_438);
        bool _444 = _440 || _442;
        bool _446 = isnan(0.001000000047497451305389404296875);
        bool _448 = _444 || _446;
        float _450 = abs(_416);
        bool _452 = _450 < 1.0;
        bool _454 = !_448;
        bool _456 = _452 && _454;
        float _458 = _436;
        if (!_456)
        {
            _422 = _394;
        }
        float _460 = _422;
        float _462 = _460;
        if (!_456)
        {
            _458 = _416;
        }
        float _464 = _458;
        _432 = _464;
        if (_456)
        {
            _462 = _394;
        }
        float _466 = _462;
        _424 = _466;
        if (_456)
        {
            _432 = _128;
        }
    }
    float _468 = _424;
    float _470 = _432;
    float _472 = _414 * _468;
    float _474 = fma(_470, -0.5, 0.5);
    float _476 = _414 * _470;
    float _478 = -_414;
    float _480 = (-0.0) + _478;
    float _482 = _414 + _472;
    float _484 = _414 * _474;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _486 = _482 * 0.5;
    out.gl_Position.w = _414;
    out.m_43.w = _414;
    out.gl_Position.x = _472;
    out.gl_Position.y = _476;
    out.gl_Position.z = _480;
    out.m_43.y = _484;
    out.m_43.x = _486;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

