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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_37 [[attribute(6)]];
    float4 m_41 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_30.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    float _74 = as_type<float>(_66);
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _72;
    if (!_70)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _551 = as_type<float>(_82);
        out.gl_Position.z = _551;
    }
    if (!_70)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _86 = in.m_35.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_96)
    {
        float _102 = float(_66);
        _74 = _102;
    }
    float _104 = _74;
    bool _106 = _100 >= _104;
    bool _108 = !_96;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_33.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _84 = as_type<int>(_116);
    }
    int _118 = _84;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _620 = as_type<float>(_118);
        out.gl_Position.z = _620;
    }
    if (_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_37.x;
    float _122 = in.m_37.y;
    float _124 = in.m_37.z;
    float _126 = in.m_37.w;
    float _128 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_39.x;
    float _132 = in.m_39.y;
    float _134 = in.m_39.z;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = _120 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _160 = _122 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _130);
    float _164 = _158 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _132);
    float _168 = _160 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _134);
    float _172 = _164 * _162;
    float _174 = _162;
    float _176 = _124;
    float _178 = _128;
    if (!_144)
    {
        float _180 = _128 * _128;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _124 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _188 = _168 * _166;
    if (!_144)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _190;
    }
    float _192 = _176;
    bool _194 = !_144;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _128 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _128);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_144;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _128 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _178 = _250;
    }
    float _252 = _178;
    float _254 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _262 = fma(_252, _148, _254);
    float _264 = fma(_252, _146, _256);
    float _266 = fma(_252, _150, _258);
    float _268 = _188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _270 = fma(_262, _126, _154);
    float _272 = fma(_264, _126, _152);
    float _274 = _188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _276 = fma(_266, _126, _156);
    float _278 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _280 = _260 * _170;
    float _282 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _274);
    float _284 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _286 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _278);
    float _288 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _268);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[26].z, _282);
    float _292 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _284);
    float _294 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _286);
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[24].z, _288);
    float _298 = _290 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _300 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _302 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _304 = _296 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _306 = _188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _308 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _310 = _302 + _298;
    float _312 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = in.m_41.z;
    float _316 = _308 + _304;
    float _318 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _320 = _310 + _318;
    float _322 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _306);
    float _324 = in.m_41.w;
    float _326 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _328 = _316 + _326;
    float _330 = _320 * _320;
    float _332 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _334 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[25].z, _322);
    float _336 = fma(_328, _328, _330);
    float _338 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _340 = _334 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _342 = sqrt(_336);
    float _344 = _338 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _346 = _344 + _340;
    out.m_43.z = _314;
    bool _348 = _342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _350 = _330;
    float _352 = _340;
    float _354 = _334;
    if (!_348)
    {
        _350 = _316;
    }
    float _356 = _350;
    float _358 = _356;
    if (!_348)
    {
        _352 = _310;
    }
    float _360 = _352;
    float _362 = _360;
    if (!_348)
    {
        _354 = _346;
    }
    float _364 = _354;
    bool _366 = !_348;
    float _368 = _364;
    if (!_366)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _374 = _342 + _372;
        float _376 = rsqrt(_336);
        float _378 = _374 * _370;
        float _380 = _346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = _378 * 0.15915493667125701904296875;
        float _384 = _382 * 6.283185482025146484375;
        float _386 = cos(_384);
        float _388 = _382 * 6.283185482025146484375;
        float _390 = sin(_388);
        float _392 = _386 + (-1.0);
        float _394 = _392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = fma(_390, _380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _398 = fma(_346, _386, _394);
        float _400 = _376 * _396;
        float _402 = fma(_328, _400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _404 = fma(_320, _400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _368 = _398;
        _358 = _402;
        _362 = _404;
    }
    float _406 = _368;
    float _408 = _358;
    float _410 = _362;
    float _412 = _406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _414 = _406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _416 = _406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _418 = _406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _412);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _414);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _416);
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _418);
    float _428 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _420);
    float _430 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _422);
    float _432 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _424);
    out.m_43.w = _324;
    float _434 = _428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _436 = _430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _438 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _426);
    float _440 = _432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _442 = _434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _446 = _434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _448 = _434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[5].x, _442);
    float _452 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[6].x, _444);
    float _454 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[4].x, _446);
    float _456 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[7].x, _448);
    float _458 = _438 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _450);
    float _462 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _452);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _454);
    float _466 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _456);
    float _468 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _460);
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _462);
    float _472 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _464);
    float _474 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _466);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _470 + _474;
    float _486 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _492 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _494 = _484 * 0.5;
    out.m_45.x = _486;
    out.m_45.y = _482;
    out.m_45.z = _488;
    out.m_45.w = _490;
    out.m_33.x = _492;
    out.gl_Position.x = _472;
    out.gl_Position.y = _468;
    out.gl_Position.z = _470;
    out.gl_Position.w = _474;
    out.m_47.z = _494;
    out.m_47.w = _474;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_30.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    float _74 = as_type<float>(_66);
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _72;
    if (!_70)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _551 = as_type<float>(_82);
        out.gl_Position.z = _551;
    }
    if (!_70)
    {
        return out;
    }
    float _86 = in.m_35.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_96)
    {
        float _102 = float(_66);
        _74 = _102;
    }
    float _104 = _74;
    bool _106 = _100 >= _104;
    bool _108 = !_96;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_33.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _84 = as_type<int>(_116);
    }
    int _118 = _84;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _620 = as_type<float>(_118);
        out.gl_Position.z = _620;
    }
    if (_110)
    {
        return out;
    }
    float _120 = in.m_37.x;
    float _122 = in.m_37.y;
    float _124 = in.m_37.z;
    float _126 = in.m_37.w;
    float _128 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_39.x;
    float _132 = in.m_39.y;
    float _134 = in.m_39.z;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = _120 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _160 = _122 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _130);
    float _164 = _158 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _132);
    float _168 = _160 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _134);
    float _172 = _164 * _162;
    float _174 = _162;
    float _176 = _124;
    float _178 = _128;
    if (!_144)
    {
        float _180 = _128 * _128;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _124 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _188 = _168 * _166;
    if (!_144)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _190;
    }
    float _192 = _176;
    bool _194 = !_144;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _128 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _128);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_144;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _128 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _178 = _250;
    }
    float _252 = _178;
    float _254 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _262 = fma(_252, _148, _254);
    float _264 = fma(_252, _146, _256);
    float _266 = fma(_252, _150, _258);
    float _268 = _188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _270 = fma(_262, _126, _154);
    float _272 = fma(_264, _126, _152);
    float _274 = _188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _276 = fma(_266, _126, _156);
    float _278 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _280 = _260 * _170;
    float _282 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _274);
    float _284 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _286 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _278);
    float _288 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _268);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[26].z, _282);
    float _292 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _284);
    float _294 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _286);
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[24].z, _288);
    float _298 = _290 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _300 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _302 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _304 = _296 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _306 = _188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _308 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _310 = _302 + _298;
    float _312 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = in.m_41.z;
    float _316 = _308 + _304;
    float _318 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _320 = _310 + _318;
    float _322 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _306);
    float _324 = in.m_41.w;
    float _326 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _328 = _316 + _326;
    float _330 = _320 * _320;
    float _332 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _334 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[25].z, _322);
    float _336 = fma(_328, _328, _330);
    float _338 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _340 = _334 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _342 = sqrt(_336);
    float _344 = _338 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _346 = _344 + _340;
    out.m_43.z = _314;
    bool _348 = _342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _350 = _330;
    float _352 = _340;
    float _354 = _334;
    if (!_348)
    {
        _350 = _316;
    }
    float _356 = _350;
    float _358 = _356;
    if (!_348)
    {
        _352 = _310;
    }
    float _360 = _352;
    float _362 = _360;
    if (!_348)
    {
        _354 = _346;
    }
    float _364 = _354;
    bool _366 = !_348;
    float _368 = _364;
    if (!_366)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _374 = _342 + _372;
        float _376 = rsqrt(_336);
        float _378 = _374 * _370;
        float _380 = _346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = _378 * 0.15915493667125701904296875;
        float _384 = _382 * 6.283185482025146484375;
        float _386 = cos(_384);
        float _388 = _382 * 6.283185482025146484375;
        float _390 = sin(_388);
        float _392 = _386 + (-1.0);
        float _394 = _392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = fma(_390, _380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _398 = fma(_346, _386, _394);
        float _400 = _376 * _396;
        float _402 = fma(_328, _400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _404 = fma(_320, _400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _368 = _398;
        _358 = _402;
        _362 = _404;
    }
    float _406 = _368;
    float _408 = _358;
    float _410 = _362;
    float _412 = _406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _414 = _406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _416 = _406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _418 = _406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _412);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _414);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _416);
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _418);
    float _428 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _420);
    float _430 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _422);
    float _432 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _424);
    out.m_43.w = _324;
    float _434 = _428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _436 = _430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _438 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _426);
    float _440 = _432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _442 = _434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _446 = _434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _448 = _434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[5].x, _442);
    float _452 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[6].x, _444);
    float _454 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[4].x, _446);
    float _456 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[7].x, _448);
    float _458 = _438 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _450);
    float _462 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _452);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _454);
    float _466 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _456);
    float _468 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _460);
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _462);
    float _472 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _464);
    float _474 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _466);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _470 + _474;
    float _486 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _492 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _494 = _484 * 0.5;
    out.m_45.x = _486;
    out.m_45.y = _482;
    out.m_45.z = _488;
    out.m_45.w = _490;
    out.m_33.x = _492;
    out.gl_Position.x = _472;
    out.gl_Position.y = _468;
    out.gl_Position.z = _470;
    out.gl_Position.w = _474;
    out.m_47.z = _494;
    out.m_47.w = _474;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_30.w;
    float _63 = trunc(_61);
    int _66 = int(_63);
    bool _70 = _66 >= 1;
    float _72 = 0.0;
    float _74 = as_type<float>(_66);
    if (!_70)
    {
        _72 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _76 = _72;
    if (!_70)
    {
        out.m_33.x = 0.0;
    }
    int _78 = 0;
    if (!_70)
    {
        float _80 = _76 * 5.0;
        _78 = as_type<int>(_80);
    }
    int _82 = _78;
    int _84 = _82;
    if (!_70)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _551 = as_type<float>(_82);
        out.gl_Position.z = _551;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _86 = in.m_35.w;
    bool _88 = _86 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _90 = isnan(_86);
    bool _92 = _88 || _90;
    bool _94 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _96 = _92 || _94;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_96)
    {
        float _102 = float(_66);
        _74 = _102;
    }
    float _104 = _74;
    bool _106 = _100 >= _104;
    bool _108 = !_96;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_33.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _84 = as_type<int>(_116);
    }
    int _118 = _84;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _620 = as_type<float>(_118);
        out.gl_Position.z = _620;
    }
    if (_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_37.x;
    float _122 = in.m_37.y;
    float _124 = in.m_37.z;
    float _126 = in.m_37.w;
    float _128 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _130 = in.m_39.x;
    float _132 = in.m_39.y;
    float _134 = in.m_39.z;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_35.x;
    float _148 = in.m_35.y;
    float _150 = in.m_35.z;
    float _152 = in.m_30.x;
    float _154 = in.m_30.y;
    float _156 = in.m_30.z;
    float _158 = _120 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _160 = _122 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _130);
    float _164 = _158 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _132);
    float _168 = _160 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _134);
    float _172 = _164 * _162;
    float _174 = _162;
    float _176 = _124;
    float _178 = _128;
    if (!_144)
    {
        float _180 = _128 * _128;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _124 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _188 = _168 * _166;
    if (!_144)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _190;
    }
    float _192 = _176;
    bool _194 = !_144;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _128 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _128);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_144;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _128 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _178 = _250;
    }
    float _252 = _178;
    float _254 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _262 = fma(_252, _148, _254);
    float _264 = fma(_252, _146, _256);
    float _266 = fma(_252, _150, _258);
    float _268 = _188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _270 = fma(_262, _126, _154);
    float _272 = fma(_264, _126, _152);
    float _274 = _188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _276 = fma(_266, _126, _156);
    float _278 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _280 = _260 * _170;
    float _282 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _274);
    float _284 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _286 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _278);
    float _288 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _268);
    float _290 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[26].z, _282);
    float _292 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _284);
    float _294 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _286);
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[24].z, _288);
    float _298 = _290 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _300 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _302 = _294 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _304 = _296 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _306 = _188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _308 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _310 = _302 + _298;
    float _312 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = in.m_41.z;
    float _316 = _308 + _304;
    float _318 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _320 = _310 + _318;
    float _322 = fma(_172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _306);
    float _324 = in.m_41.w;
    float _326 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _328 = _316 + _326;
    float _330 = _320 * _320;
    float _332 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _334 = fma(_280, (*spvDescriptorSet0.vp_c8)._m0[25].z, _322);
    float _336 = fma(_328, _328, _330);
    float _338 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _340 = _334 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _342 = sqrt(_336);
    float _344 = _338 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _346 = _344 + _340;
    out.m_43.z = _314;
    bool _348 = _342 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _350 = _330;
    float _352 = _340;
    float _354 = _334;
    if (!_348)
    {
        _350 = _316;
    }
    float _356 = _350;
    float _358 = _356;
    if (!_348)
    {
        _352 = _310;
    }
    float _360 = _352;
    float _362 = _360;
    if (!_348)
    {
        _354 = _346;
    }
    float _364 = _354;
    bool _366 = !_348;
    float _368 = _364;
    if (!_366)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _374 = _342 + _372;
        float _376 = rsqrt(_336);
        float _378 = _374 * _370;
        float _380 = _346 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = _378 * 0.15915493667125701904296875;
        float _384 = _382 * 6.283185482025146484375;
        float _386 = cos(_384);
        float _388 = _382 * 6.283185482025146484375;
        float _390 = sin(_388);
        float _392 = _386 + (-1.0);
        float _394 = _392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _396 = fma(_390, _380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _398 = fma(_346, _386, _394);
        float _400 = _376 * _396;
        float _402 = fma(_328, _400, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _404 = fma(_320, _400, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _368 = _398;
        _358 = _402;
        _362 = _404;
    }
    float _406 = _368;
    float _408 = _358;
    float _410 = _362;
    float _412 = _406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _414 = _406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _416 = _406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _418 = _406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _420 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _412);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _414);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _416);
    float _426 = fma(_408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _418);
    float _428 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _420);
    float _430 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _422);
    float _432 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _424);
    out.m_43.w = _324;
    float _434 = _428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _436 = _430 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _438 = fma(_410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _426);
    float _440 = _432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _442 = _434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _444 = _434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _446 = _434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _448 = _434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _450 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[5].x, _442);
    float _452 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[6].x, _444);
    float _454 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[4].x, _446);
    float _456 = fma(_436, (*spvDescriptorSet0.vp_c8)._m0[7].x, _448);
    float _458 = _438 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _450);
    float _462 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _452);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _454);
    float _466 = fma(_440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _456);
    float _468 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _460);
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _462);
    float _472 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _464);
    float _474 = fma(_458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _466);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _482 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _470 + _474;
    float _486 = _478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _492 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _494 = _484 * 0.5;
    out.m_45.x = _486;
    out.m_45.y = _482;
    out.m_45.z = _488;
    out.m_45.w = _490;
    out.m_33.x = _492;
    out.gl_Position.x = _472;
    out.gl_Position.y = _468;
    out.gl_Position.z = _470;
    out.gl_Position.w = _474;
    out.m_47.z = _494;
    out.m_47.w = _474;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

