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
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_39 [[attribute(5)]];
    float4 m_37 [[attribute(7)]];
    float4 m_41 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _617 = as_type<float>(_82);
        out.gl_Position.z = _617;
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
        float _686 = as_type<float>(_118);
        out.gl_Position.z = _686;
    }
    if (_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_35.x;
    float _122 = in.m_35.y;
    float _124 = in.m_35.z;
    float _126 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_30.x;
    float _140 = in.m_30.y;
    float _142 = in.m_30.z;
    float _144 = in.m_37.x;
    float _146 = in.m_37.y;
    float _148 = in.m_37.z;
    float _150 = in.m_37.w;
    float _152 = 0.0;
    float _154 = _126;
    if (!_136)
    {
        float _156 = _126 * _126;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = _160;
    if (!_136)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = !_136;
    float _170 = _166;
    if (!_168)
    {
        float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _174 = log2(_172);
        float _176 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _178 = _176 + 1.0;
        float _180 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = _126 * _174;
        float _184 = exp2(_182);
        float _186 = _180 * 0.693147182464599609375;
        float _188 = 1.0 / _186;
        float _190 = 1.0 / _178;
        float _192 = _184 + (-1.0);
        float _194 = -_192;
        float _196 = fma(_194, _188, _126);
        float _198 = _196 * _190;
        float _200 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _200;
    }
    float _202 = _170;
    bool _204 = !_136;
    if (!_204)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = 1.0 / _212;
        float _216 = _126 * _208;
        float _218 = exp2(_216);
        float _220 = -_218;
        float _222 = _220 + 1.0;
        float _224 = _222 * _214;
        _154 = _224;
    }
    float _226 = _154;
    float _228 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _236 = fma(_226, _122, _228);
    float _238 = fma(_226, _120, _230);
    float _240 = fma(_226, _124, _232);
    float _242 = fma(_236, _150, _140);
    float _244 = fma(_238, _150, _138);
    float _246 = fma(_240, _150, _142);
    float _248 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _250 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _256 = _234 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _258 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].x, _254);
    float _264 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _262);
    float _272 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _274 = _266 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _276 = _268 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _278 = _270 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _280 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _284 = _274 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _292 = _278 + _290;
    float _294 = _284 * _284;
    float _296 = fma(_288, _288, _294);
    float _298 = fma(_292, _292, _296);
    float _300 = rsqrt(_298);
    float _302 = _284 * _300;
    float _304 = _288 * _300;
    float _306 = _292 * _300;
    float _308 = -_302;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[18].w, _284);
    float _312 = -_304;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _320 = _310 * _310;
    float _322 = fma(_314, _314, _320);
    float _324 = in.m_39.x;
    float _326 = in.m_39.y;
    float _328 = in.m_39.z;
    float _330 = fma(_318, _318, _322);
    float _332 = sqrt(_330);
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _340 = _300 * _332;
    float _342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _326);
    float _344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _324);
    float _346 = _256 * _340;
    float _348 = _272 * _340;
    float _350 = _280 * _340;
    float _352 = _346 * _342;
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _328);
    float _356 = _348 * _344;
    float _358 = _352 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _360 = _350 * _354;
    float _362 = _352 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _364 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _358);
    float _366 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _362);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[10].z, _364);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[8].z, _366);
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _374 = _278 + _368;
    float _376 = _276 + _370;
    float _378 = _352 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _382 = _374 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _386 = _376 + _384;
    float _388 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _378);
    float _390 = _382 * _382;
    float _392 = _372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _396 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[9].z, _388);
    float _398 = fma(_386, _386, _390);
    float _400 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _402 = _274 + _396;
    float _404 = sqrt(_398);
    bool _406 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = _390;
    float _410 = _360;
    float _412 = _396;
    if (!_406)
    {
        _408 = _376;
    }
    float _414 = _408;
    float _416 = _414;
    if (!_406)
    {
        _410 = _374;
    }
    float _418 = _410;
    float _420 = _418;
    if (!_406)
    {
        _412 = _402;
    }
    float _422 = _412;
    bool _424 = !_406;
    float _426 = _422;
    if (!_424)
    {
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _432 = _404 + _430;
        float _434 = _402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _436 = rsqrt(_398);
        float _438 = _432 * _428;
        float _440 = _438 * 0.15915493667125701904296875;
        float _442 = _440 * 6.283185482025146484375;
        float _444 = cos(_442);
        float _446 = _440 * 6.283185482025146484375;
        float _448 = sin(_446);
        float _450 = _444 + (-1.0);
        float _452 = fma(_448, _434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _454 = _450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = _436 * _452;
        float _458 = fma(_402, _444, _454);
        float _460 = fma(_386, _456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _462 = fma(_382, _456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _426 = _458;
        _416 = _460;
        _420 = _462;
    }
    float _464 = _426;
    float _466 = _416;
    float _468 = _420;
    float _470 = -_302;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _474 = -_304;
    float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _466);
    float _478 = -_306;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _482 = in.m_41.w;
    float _484 = _472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _486 = _472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _488 = _472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _490 = _472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _484);
    float _494 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _486);
    float _496 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _488);
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _490);
    float _500 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _492);
    float _502 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _494);
    float _504 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _496);
    float _506 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _498);
    float _508 = _500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _510 = _502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _512 = _504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _514 = _506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _516 = _508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _518 = _508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _520 = _508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _522 = _508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[4].x, _516);
    float _526 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[5].x, _518);
    float _528 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[7].x, _520);
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[6].x, _522);
    float _532 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[4].z, _524);
    float _534 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[5].z, _526);
    float _536 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[7].z, _528);
    float _538 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[6].z, _530);
    float _540 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _532);
    float _542 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _534);
    float _544 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _536);
    float _546 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _538);
    out.m_43.x = _400;
    out.m_43.y = _392;
    out.m_43.z = _336;
    out.m_43.w = _338;
    float _548 = _540 + _544;
    float _550 = _546 + _544;
    float _552 = _544 * 0.5;
    float _554 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _556 = _548 * 0.5;
    float _558 = _550 * 0.5;
    float _560 = fma(_542, -0.5, _552);
    out.m_45.w = _482;
    out.m_33.x = _554;
    out.gl_Position.x = _540;
    out.gl_Position.y = _542;
    out.gl_Position.z = _546;
    out.gl_Position.w = _544;
    out.m_47.x = _556;
    out.m_47.y = _560;
    out.m_47.z = _558;
    out.m_47.w = _544;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _617 = as_type<float>(_82);
        out.gl_Position.z = _617;
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
        float _686 = as_type<float>(_118);
        out.gl_Position.z = _686;
    }
    if (_110)
    {
        return out;
    }
    float _120 = in.m_35.x;
    float _122 = in.m_35.y;
    float _124 = in.m_35.z;
    float _126 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_30.x;
    float _140 = in.m_30.y;
    float _142 = in.m_30.z;
    float _144 = in.m_37.x;
    float _146 = in.m_37.y;
    float _148 = in.m_37.z;
    float _150 = in.m_37.w;
    float _152 = 0.0;
    float _154 = _126;
    if (!_136)
    {
        float _156 = _126 * _126;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = _160;
    if (!_136)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = !_136;
    float _170 = _166;
    if (!_168)
    {
        float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _174 = log2(_172);
        float _176 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _178 = _176 + 1.0;
        float _180 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = _126 * _174;
        float _184 = exp2(_182);
        float _186 = _180 * 0.693147182464599609375;
        float _188 = 1.0 / _186;
        float _190 = 1.0 / _178;
        float _192 = _184 + (-1.0);
        float _194 = -_192;
        float _196 = fma(_194, _188, _126);
        float _198 = _196 * _190;
        float _200 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _200;
    }
    float _202 = _170;
    bool _204 = !_136;
    if (!_204)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = 1.0 / _212;
        float _216 = _126 * _208;
        float _218 = exp2(_216);
        float _220 = -_218;
        float _222 = _220 + 1.0;
        float _224 = _222 * _214;
        _154 = _224;
    }
    float _226 = _154;
    float _228 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _236 = fma(_226, _122, _228);
    float _238 = fma(_226, _120, _230);
    float _240 = fma(_226, _124, _232);
    float _242 = fma(_236, _150, _140);
    float _244 = fma(_238, _150, _138);
    float _246 = fma(_240, _150, _142);
    float _248 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _250 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _256 = _234 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _258 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].x, _254);
    float _264 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _262);
    float _272 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _274 = _266 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _276 = _268 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _278 = _270 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _280 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _284 = _274 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _292 = _278 + _290;
    float _294 = _284 * _284;
    float _296 = fma(_288, _288, _294);
    float _298 = fma(_292, _292, _296);
    float _300 = rsqrt(_298);
    float _302 = _284 * _300;
    float _304 = _288 * _300;
    float _306 = _292 * _300;
    float _308 = -_302;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[18].w, _284);
    float _312 = -_304;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _320 = _310 * _310;
    float _322 = fma(_314, _314, _320);
    float _324 = in.m_39.x;
    float _326 = in.m_39.y;
    float _328 = in.m_39.z;
    float _330 = fma(_318, _318, _322);
    float _332 = sqrt(_330);
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _340 = _300 * _332;
    float _342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _326);
    float _344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _324);
    float _346 = _256 * _340;
    float _348 = _272 * _340;
    float _350 = _280 * _340;
    float _352 = _346 * _342;
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _328);
    float _356 = _348 * _344;
    float _358 = _352 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _360 = _350 * _354;
    float _362 = _352 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _364 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _358);
    float _366 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _362);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[10].z, _364);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[8].z, _366);
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _374 = _278 + _368;
    float _376 = _276 + _370;
    float _378 = _352 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _382 = _374 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _386 = _376 + _384;
    float _388 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _378);
    float _390 = _382 * _382;
    float _392 = _372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _396 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[9].z, _388);
    float _398 = fma(_386, _386, _390);
    float _400 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _402 = _274 + _396;
    float _404 = sqrt(_398);
    bool _406 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = _390;
    float _410 = _360;
    float _412 = _396;
    if (!_406)
    {
        _408 = _376;
    }
    float _414 = _408;
    float _416 = _414;
    if (!_406)
    {
        _410 = _374;
    }
    float _418 = _410;
    float _420 = _418;
    if (!_406)
    {
        _412 = _402;
    }
    float _422 = _412;
    bool _424 = !_406;
    float _426 = _422;
    if (!_424)
    {
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _432 = _404 + _430;
        float _434 = _402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _436 = rsqrt(_398);
        float _438 = _432 * _428;
        float _440 = _438 * 0.15915493667125701904296875;
        float _442 = _440 * 6.283185482025146484375;
        float _444 = cos(_442);
        float _446 = _440 * 6.283185482025146484375;
        float _448 = sin(_446);
        float _450 = _444 + (-1.0);
        float _452 = fma(_448, _434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _454 = _450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = _436 * _452;
        float _458 = fma(_402, _444, _454);
        float _460 = fma(_386, _456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _462 = fma(_382, _456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _426 = _458;
        _416 = _460;
        _420 = _462;
    }
    float _464 = _426;
    float _466 = _416;
    float _468 = _420;
    float _470 = -_302;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _474 = -_304;
    float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _466);
    float _478 = -_306;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _482 = in.m_41.w;
    float _484 = _472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _486 = _472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _488 = _472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _490 = _472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _484);
    float _494 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _486);
    float _496 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _488);
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _490);
    float _500 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _492);
    float _502 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _494);
    float _504 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _496);
    float _506 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _498);
    float _508 = _500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _510 = _502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _512 = _504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _514 = _506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _516 = _508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _518 = _508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _520 = _508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _522 = _508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[4].x, _516);
    float _526 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[5].x, _518);
    float _528 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[7].x, _520);
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[6].x, _522);
    float _532 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[4].z, _524);
    float _534 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[5].z, _526);
    float _536 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[7].z, _528);
    float _538 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[6].z, _530);
    float _540 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _532);
    float _542 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _534);
    float _544 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _536);
    float _546 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _538);
    out.m_43.x = _400;
    out.m_43.y = _392;
    out.m_43.z = _336;
    out.m_43.w = _338;
    float _548 = _540 + _544;
    float _550 = _546 + _544;
    float _552 = _544 * 0.5;
    float _554 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _556 = _548 * 0.5;
    float _558 = _550 * 0.5;
    float _560 = fma(_542, -0.5, _552);
    out.m_45.w = _482;
    out.m_33.x = _554;
    out.gl_Position.x = _540;
    out.gl_Position.y = _542;
    out.gl_Position.z = _546;
    out.gl_Position.w = _544;
    out.m_47.x = _556;
    out.m_47.y = _560;
    out.m_47.z = _558;
    out.m_47.w = _544;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _617 = as_type<float>(_82);
        out.gl_Position.z = _617;
    }
    if (!_70)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _686 = as_type<float>(_118);
        out.gl_Position.z = _686;
    }
    if (_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_35.x;
    float _122 = in.m_35.y;
    float _124 = in.m_35.z;
    float _126 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _128 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _130 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = in.m_30.x;
    float _140 = in.m_30.y;
    float _142 = in.m_30.z;
    float _144 = in.m_37.x;
    float _146 = in.m_37.y;
    float _148 = in.m_37.z;
    float _150 = in.m_37.w;
    float _152 = 0.0;
    float _154 = _126;
    if (!_136)
    {
        float _156 = _126 * _126;
        float _158 = _156 * 0.5;
        _152 = _158;
    }
    float _160 = _152;
    float _162 = _160;
    if (!_136)
    {
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _162 = _164;
    }
    float _166 = _162;
    bool _168 = !_136;
    float _170 = _166;
    if (!_168)
    {
        float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _174 = log2(_172);
        float _176 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _178 = _176 + 1.0;
        float _180 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = _126 * _174;
        float _184 = exp2(_182);
        float _186 = _180 * 0.693147182464599609375;
        float _188 = 1.0 / _186;
        float _190 = 1.0 / _178;
        float _192 = _184 + (-1.0);
        float _194 = -_192;
        float _196 = fma(_194, _188, _126);
        float _198 = _196 * _190;
        float _200 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _200;
    }
    float _202 = _170;
    bool _204 = !_136;
    if (!_204)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = 1.0 / _212;
        float _216 = _126 * _208;
        float _218 = exp2(_216);
        float _220 = -_218;
        float _222 = _220 + 1.0;
        float _224 = _222 * _214;
        _154 = _224;
    }
    float _226 = _154;
    float _228 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _230 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _232 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _234 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _236 = fma(_226, _122, _228);
    float _238 = fma(_226, _120, _230);
    float _240 = fma(_226, _124, _232);
    float _242 = fma(_236, _150, _140);
    float _244 = fma(_238, _150, _138);
    float _246 = fma(_240, _150, _142);
    float _248 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _250 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _252 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _254 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _256 = _234 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _258 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].x, _254);
    float _264 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _266 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _262);
    float _272 = _248 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _274 = _266 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _276 = _268 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _278 = _270 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _280 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _284 = _274 + _282;
    float _286 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _288 = _276 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _292 = _278 + _290;
    float _294 = _284 * _284;
    float _296 = fma(_288, _288, _294);
    float _298 = fma(_292, _292, _296);
    float _300 = rsqrt(_298);
    float _302 = _284 * _300;
    float _304 = _288 * _300;
    float _306 = _292 * _300;
    float _308 = -_302;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[18].w, _284);
    float _312 = -_304;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _316 = -_306;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _320 = _310 * _310;
    float _322 = fma(_314, _314, _320);
    float _324 = in.m_39.x;
    float _326 = in.m_39.y;
    float _328 = in.m_39.z;
    float _330 = fma(_318, _318, _322);
    float _332 = sqrt(_330);
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _340 = _300 * _332;
    float _342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _326);
    float _344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _324);
    float _346 = _256 * _340;
    float _348 = _272 * _340;
    float _350 = _280 * _340;
    float _352 = _346 * _342;
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _328);
    float _356 = _348 * _344;
    float _358 = _352 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _360 = _350 * _354;
    float _362 = _352 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _364 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[10].x, _358);
    float _366 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[8].x, _362);
    float _368 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[10].z, _364);
    float _370 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[8].z, _366);
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _374 = _278 + _368;
    float _376 = _276 + _370;
    float _378 = _352 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _382 = _374 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _386 = _376 + _384;
    float _388 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[9].x, _378);
    float _390 = _382 * _382;
    float _392 = _372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _396 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[9].z, _388);
    float _398 = fma(_386, _386, _390);
    float _400 = _394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _402 = _274 + _396;
    float _404 = sqrt(_398);
    bool _406 = _404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = _390;
    float _410 = _360;
    float _412 = _396;
    if (!_406)
    {
        _408 = _376;
    }
    float _414 = _408;
    float _416 = _414;
    if (!_406)
    {
        _410 = _374;
    }
    float _418 = _410;
    float _420 = _418;
    if (!_406)
    {
        _412 = _402;
    }
    float _422 = _412;
    bool _424 = !_406;
    float _426 = _422;
    if (!_424)
    {
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _432 = _404 + _430;
        float _434 = _402 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _436 = rsqrt(_398);
        float _438 = _432 * _428;
        float _440 = _438 * 0.15915493667125701904296875;
        float _442 = _440 * 6.283185482025146484375;
        float _444 = cos(_442);
        float _446 = _440 * 6.283185482025146484375;
        float _448 = sin(_446);
        float _450 = _444 + (-1.0);
        float _452 = fma(_448, _434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _454 = _450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = _436 * _452;
        float _458 = fma(_402, _444, _454);
        float _460 = fma(_386, _456, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _462 = fma(_382, _456, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _426 = _458;
        _416 = _460;
        _420 = _462;
    }
    float _464 = _426;
    float _466 = _416;
    float _468 = _420;
    float _470 = -_302;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _474 = -_304;
    float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _466);
    float _478 = -_306;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _482 = in.m_41.w;
    float _484 = _472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _486 = _472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _488 = _472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _490 = _472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _484);
    float _494 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _486);
    float _496 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _488);
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _490);
    float _500 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _492);
    float _502 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _494);
    float _504 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _496);
    float _506 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _498);
    float _508 = _500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _510 = _502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _512 = _504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _514 = _506 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _516 = _508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _518 = _508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _520 = _508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _522 = _508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[4].x, _516);
    float _526 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[5].x, _518);
    float _528 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[7].x, _520);
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[6].x, _522);
    float _532 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[4].z, _524);
    float _534 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[5].z, _526);
    float _536 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[7].z, _528);
    float _538 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[6].z, _530);
    float _540 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _532);
    float _542 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _534);
    float _544 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _536);
    float _546 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _538);
    out.m_43.x = _400;
    out.m_43.y = _392;
    out.m_43.z = _336;
    out.m_43.w = _338;
    float _548 = _540 + _544;
    float _550 = _546 + _544;
    float _552 = _544 * 0.5;
    float _554 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _556 = _548 * 0.5;
    float _558 = _550 * 0.5;
    float _560 = fma(_542, -0.5, _552);
    out.m_45.w = _482;
    out.m_33.x = _554;
    out.gl_Position.x = _540;
    out.gl_Position.y = _542;
    out.gl_Position.z = _546;
    out.gl_Position.w = _544;
    out.m_47.x = _556;
    out.m_47.y = _560;
    out.m_47.z = _558;
    out.m_47.w = _544;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

