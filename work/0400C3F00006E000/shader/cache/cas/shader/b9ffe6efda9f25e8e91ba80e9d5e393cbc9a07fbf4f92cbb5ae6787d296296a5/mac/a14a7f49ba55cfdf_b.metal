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
    float4 m_41 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
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
        float _637 = as_type<float>(_82);
        out.gl_Position.z = _637;
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
        float _706 = as_type<float>(_118);
        out.gl_Position.z = _706;
    }
    if (_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_37.x;
    float _122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _124 = _100 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _126 = in.m_39.x;
    float _128 = in.m_39.y;
    float _130 = in.m_39.z;
    float _132 = in.m_39.w;
    int _134 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _136 = _134 != 0;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
    float _160 = _124 * _122;
    float _162 = in.m_35.x;
    float _164 = in.m_35.y;
    float _166 = in.m_35.z;
    float _168 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[20].x, _160);
    float _170 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = _126 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _174 = floor(_168);
    float _176 = _128 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _178 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _140);
    float _186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _142);
    float _188 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _190 = _182 * _180;
    float _192 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _194 = _182;
    float _196 = _170;
    if (!_152)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _188 * _184;
    float _206 = _192 * _186;
    float _208 = _202;
    if (!_152)
    {
        float _210 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_152;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _170 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _170);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_152;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _170 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _196 = _270;
    }
    float _272 = _196;
    float _274 = -_174;
    float _276 = _168 + _274;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _168 * 6.283185482025146484375;
    float _282 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_272, _164, _278);
    float _288 = _280 * 0.15915493667125701904296875;
    float _290 = fma(_272, _162, _282);
    float _292 = fma(_272, _166, _284);
    float _294 = fma(_286, _132, _156);
    float _296 = _204 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _298 = fma(_290, _132, _154);
    float _300 = _288 * 6.283185482025146484375;
    float _302 = cos(_300);
    float _304 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_292, _132, _158);
    float _308 = _204 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _314 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _296);
    float _316 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _320 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[6].z, _312);
    float _322 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _314);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _316);
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[4].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _330 = _204 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = fma(_302, 0.5, 0.5);
    float _334 = _326 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _336 = _328 + _324;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _344 = _342 != 0;
    float _346 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _348 = _334 + _322;
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _352 = _336 + _350;
    float _354 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _346);
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _358 = _348 + _356;
    float _360 = _352 * _352;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _364 = fma(_358, _358, _360);
    bool _366 = !_340;
    int _368 = _366 ? 0 : 1;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _372 = sqrt(_364);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _376 = abs(_368);
    float _378 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _382 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _386 = !_136;
    int _388 = _386 ? 0 : 1;
    float _390 = float(_376);
    float _392 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _394 = -_276;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _398 = abs(_388);
    out.m_43.x = _378;
    out.m_43.y = _380;
    out.m_43.z = _384;
    bool _400 = !_344;
    int _402 = _400 ? 0 : 1;
    float _404 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    bool _406 = _372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = abs(_396);
    float _410 = _390 * _408;
    bool _412 = _276 < 0.5;
    float _414 = float(_412);
    float _416 = _404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _418 = abs(_402);
    float _420 = float(_398);
    float _422 = -_332;
    float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _426 = _416 + _354;
    float _428 = -_414;
    float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _432 = fma(_420, _424, _410);
    float _434 = float(_418);
    float _436 = _384;
    float _438 = as_type<float>(_418);
    float _440 = _424;
    if (!_406)
    {
        _436 = _348;
    }
    float _442 = _436;
    float _444 = _442;
    if (!_406)
    {
        _438 = _336;
    }
    float _446 = _438;
    float _448 = _446;
    if (!_406)
    {
        _440 = _426;
    }
    float _450 = _440;
    bool _452 = !_406;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _372 + _458;
        float _462 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = rsqrt(_364);
        float _466 = _460 * _456;
        float _468 = _466 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = cos(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _472 + (-1.0);
        float _480 = _478 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = fma(_476, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _484 = fma(_426, _472, _480);
        float _486 = _464 * _482;
        float _488 = fma(_358, _486, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _490 = fma(_352, _486, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _454 = _484;
        _444 = _488;
        _448 = _490;
    }
    float _492 = _454;
    float _494 = _444;
    float _496 = _448;
    float _498 = _492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _500 = _492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _502 = abs(_430);
    float _504 = fma(_434, _502, _432);
    float _506 = _492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _498);
    float _510 = _492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _512 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _500);
    float _514 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _506);
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _508);
    float _518 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _510);
    float _520 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _512);
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _514);
    float _524 = _516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _526 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _518);
    float _528 = _520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _530 = _522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _532 = _524 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _534 = _524 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _536 = _524 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _538 = _524 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _532);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _534);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _536);
    float _546 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _538);
    float _548 = _526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _550 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _540);
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _542);
    float _554 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _544);
    float _556 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _546);
    float _558 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[4].w, _550);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[7].w, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[6].w, _552);
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[5].w, _556);
    float _568 = _558 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _570 = _560 + _562;
    float _572 = _564 + _562;
    float _574 = _562 * 0.5;
    float _576 = _570 * 0.5;
    float _578 = _572 * 0.5;
    float _580 = fma(_566, -0.5, _574);
    out.m_45.x = _334;
    out.m_45.y = _416;
    out.m_45.z = _328;
    out.m_33.x = _568;
    out.gl_Position.x = _560;
    out.gl_Position.y = _566;
    out.gl_Position.z = _564;
    out.gl_Position.w = _562;
    out.m_47.x = _576;
    out.m_47.y = _580;
    out.m_47.z = _578;
    out.m_47.w = _562;
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
        float _637 = as_type<float>(_82);
        out.gl_Position.z = _637;
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
        float _706 = as_type<float>(_118);
        out.gl_Position.z = _706;
    }
    if (_110)
    {
        return out;
    }
    float _120 = in.m_37.x;
    float _122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _124 = _100 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _126 = in.m_39.x;
    float _128 = in.m_39.y;
    float _130 = in.m_39.z;
    float _132 = in.m_39.w;
    int _134 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _136 = _134 != 0;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
    float _160 = _124 * _122;
    float _162 = in.m_35.x;
    float _164 = in.m_35.y;
    float _166 = in.m_35.z;
    float _168 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[20].x, _160);
    float _170 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = _126 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _174 = floor(_168);
    float _176 = _128 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _178 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _140);
    float _186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _142);
    float _188 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _190 = _182 * _180;
    float _192 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _194 = _182;
    float _196 = _170;
    if (!_152)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _188 * _184;
    float _206 = _192 * _186;
    float _208 = _202;
    if (!_152)
    {
        float _210 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_152;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _170 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _170);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_152;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _170 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _196 = _270;
    }
    float _272 = _196;
    float _274 = -_174;
    float _276 = _168 + _274;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _168 * 6.283185482025146484375;
    float _282 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_272, _164, _278);
    float _288 = _280 * 0.15915493667125701904296875;
    float _290 = fma(_272, _162, _282);
    float _292 = fma(_272, _166, _284);
    float _294 = fma(_286, _132, _156);
    float _296 = _204 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _298 = fma(_290, _132, _154);
    float _300 = _288 * 6.283185482025146484375;
    float _302 = cos(_300);
    float _304 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_292, _132, _158);
    float _308 = _204 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _314 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _296);
    float _316 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _320 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[6].z, _312);
    float _322 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _314);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _316);
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[4].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _330 = _204 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = fma(_302, 0.5, 0.5);
    float _334 = _326 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _336 = _328 + _324;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _344 = _342 != 0;
    float _346 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _348 = _334 + _322;
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _352 = _336 + _350;
    float _354 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _346);
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _358 = _348 + _356;
    float _360 = _352 * _352;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _364 = fma(_358, _358, _360);
    bool _366 = !_340;
    int _368 = _366 ? 0 : 1;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _372 = sqrt(_364);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _376 = abs(_368);
    float _378 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _382 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _386 = !_136;
    int _388 = _386 ? 0 : 1;
    float _390 = float(_376);
    float _392 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _394 = -_276;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _398 = abs(_388);
    out.m_43.x = _378;
    out.m_43.y = _380;
    out.m_43.z = _384;
    bool _400 = !_344;
    int _402 = _400 ? 0 : 1;
    float _404 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    bool _406 = _372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = abs(_396);
    float _410 = _390 * _408;
    bool _412 = _276 < 0.5;
    float _414 = float(_412);
    float _416 = _404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _418 = abs(_402);
    float _420 = float(_398);
    float _422 = -_332;
    float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _426 = _416 + _354;
    float _428 = -_414;
    float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _432 = fma(_420, _424, _410);
    float _434 = float(_418);
    float _436 = _384;
    float _438 = as_type<float>(_418);
    float _440 = _424;
    if (!_406)
    {
        _436 = _348;
    }
    float _442 = _436;
    float _444 = _442;
    if (!_406)
    {
        _438 = _336;
    }
    float _446 = _438;
    float _448 = _446;
    if (!_406)
    {
        _440 = _426;
    }
    float _450 = _440;
    bool _452 = !_406;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _372 + _458;
        float _462 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = rsqrt(_364);
        float _466 = _460 * _456;
        float _468 = _466 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = cos(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _472 + (-1.0);
        float _480 = _478 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = fma(_476, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _484 = fma(_426, _472, _480);
        float _486 = _464 * _482;
        float _488 = fma(_358, _486, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _490 = fma(_352, _486, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _454 = _484;
        _444 = _488;
        _448 = _490;
    }
    float _492 = _454;
    float _494 = _444;
    float _496 = _448;
    float _498 = _492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _500 = _492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _502 = abs(_430);
    float _504 = fma(_434, _502, _432);
    float _506 = _492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _498);
    float _510 = _492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _512 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _500);
    float _514 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _506);
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _508);
    float _518 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _510);
    float _520 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _512);
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _514);
    float _524 = _516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _526 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _518);
    float _528 = _520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _530 = _522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _532 = _524 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _534 = _524 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _536 = _524 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _538 = _524 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _532);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _534);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _536);
    float _546 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _538);
    float _548 = _526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _550 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _540);
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _542);
    float _554 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _544);
    float _556 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _546);
    float _558 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[4].w, _550);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[7].w, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[6].w, _552);
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[5].w, _556);
    float _568 = _558 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _570 = _560 + _562;
    float _572 = _564 + _562;
    float _574 = _562 * 0.5;
    float _576 = _570 * 0.5;
    float _578 = _572 * 0.5;
    float _580 = fma(_566, -0.5, _574);
    out.m_45.x = _334;
    out.m_45.y = _416;
    out.m_45.z = _328;
    out.m_33.x = _568;
    out.gl_Position.x = _560;
    out.gl_Position.y = _566;
    out.gl_Position.z = _564;
    out.gl_Position.w = _562;
    out.m_47.x = _576;
    out.m_47.y = _580;
    out.m_47.z = _578;
    out.m_47.w = _562;
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
        float _637 = as_type<float>(_82);
        out.gl_Position.z = _637;
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
        float _706 = as_type<float>(_118);
        out.gl_Position.z = _706;
    }
    if (_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_37.x;
    float _122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _124 = _100 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _126 = in.m_39.x;
    float _128 = in.m_39.y;
    float _130 = in.m_39.z;
    float _132 = in.m_39.w;
    int _134 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _136 = _134 != 0;
    float _138 = in.m_41.x;
    float _140 = in.m_41.y;
    float _142 = in.m_41.z;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_30.x;
    float _156 = in.m_30.y;
    float _158 = in.m_30.z;
    float _160 = _124 * _122;
    float _162 = in.m_35.x;
    float _164 = in.m_35.y;
    float _166 = in.m_35.z;
    float _168 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[20].x, _160);
    float _170 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = _126 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _174 = floor(_168);
    float _176 = _128 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _178 = _130 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _140);
    float _186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _142);
    float _188 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _190 = _182 * _180;
    float _192 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _194 = _182;
    float _196 = _170;
    if (!_152)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _188 * _184;
    float _206 = _192 * _186;
    float _208 = _202;
    if (!_152)
    {
        float _210 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_152;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _170 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _170);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_152;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _170 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _196 = _270;
    }
    float _272 = _196;
    float _274 = -_174;
    float _276 = _168 + _274;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _168 * 6.283185482025146484375;
    float _282 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _284 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_272, _164, _278);
    float _288 = _280 * 0.15915493667125701904296875;
    float _290 = fma(_272, _162, _282);
    float _292 = fma(_272, _166, _284);
    float _294 = fma(_286, _132, _156);
    float _296 = _204 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _298 = fma(_290, _132, _154);
    float _300 = _288 * 6.283185482025146484375;
    float _302 = cos(_300);
    float _304 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_292, _132, _158);
    float _308 = _204 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _314 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _296);
    float _316 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _308);
    float _318 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _320 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[6].z, _312);
    float _322 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _314);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _316);
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[4].z, _318);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _330 = _204 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _332 = fma(_302, 0.5, 0.5);
    float _334 = _326 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _336 = _328 + _324;
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _344 = _342 != 0;
    float _346 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _330);
    float _348 = _334 + _322;
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _352 = _336 + _350;
    float _354 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _346);
    float _356 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _358 = _348 + _356;
    float _360 = _352 * _352;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _364 = fma(_358, _358, _360);
    bool _366 = !_340;
    int _368 = _366 ? 0 : 1;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _372 = sqrt(_364);
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _376 = abs(_368);
    float _378 = _362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _380 = _370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _382 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _386 = !_136;
    int _388 = _386 ? 0 : 1;
    float _390 = float(_376);
    float _392 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _394 = -_276;
    float _396 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _398 = abs(_388);
    out.m_43.x = _378;
    out.m_43.y = _380;
    out.m_43.z = _384;
    bool _400 = !_344;
    int _402 = _400 ? 0 : 1;
    float _404 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    bool _406 = _372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _408 = abs(_396);
    float _410 = _390 * _408;
    bool _412 = _276 < 0.5;
    float _414 = float(_412);
    float _416 = _404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _418 = abs(_402);
    float _420 = float(_398);
    float _422 = -_332;
    float _424 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _426 = _416 + _354;
    float _428 = -_414;
    float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _432 = fma(_420, _424, _410);
    float _434 = float(_418);
    float _436 = _384;
    float _438 = as_type<float>(_418);
    float _440 = _424;
    if (!_406)
    {
        _436 = _348;
    }
    float _442 = _436;
    float _444 = _442;
    if (!_406)
    {
        _438 = _336;
    }
    float _446 = _438;
    float _448 = _446;
    if (!_406)
    {
        _440 = _426;
    }
    float _450 = _440;
    bool _452 = !_406;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _372 + _458;
        float _462 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = rsqrt(_364);
        float _466 = _460 * _456;
        float _468 = _466 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = cos(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = sin(_474);
        float _478 = _472 + (-1.0);
        float _480 = _478 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = fma(_476, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _484 = fma(_426, _472, _480);
        float _486 = _464 * _482;
        float _488 = fma(_358, _486, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _490 = fma(_352, _486, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _454 = _484;
        _444 = _488;
        _448 = _490;
    }
    float _492 = _454;
    float _494 = _444;
    float _496 = _448;
    float _498 = _492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _500 = _492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _502 = abs(_430);
    float _504 = fma(_434, _502, _432);
    float _506 = _492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _508 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _498);
    float _510 = _492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _512 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _500);
    float _514 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _506);
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _508);
    float _518 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _510);
    float _520 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _512);
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _514);
    float _524 = _516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _526 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _518);
    float _528 = _520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _530 = _522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _532 = _524 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _534 = _524 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _536 = _524 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _538 = _524 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _532);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _534);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _536);
    float _546 = fma(_528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _538);
    float _548 = _526 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _550 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _540);
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _542);
    float _554 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _544);
    float _556 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _546);
    float _558 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _560 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[4].w, _550);
    float _562 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[7].w, _554);
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[6].w, _552);
    float _566 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[5].w, _556);
    float _568 = _558 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _570 = _560 + _562;
    float _572 = _564 + _562;
    float _574 = _562 * 0.5;
    float _576 = _570 * 0.5;
    float _578 = _572 * 0.5;
    float _580 = fma(_566, -0.5, _574);
    out.m_45.x = _334;
    out.m_45.y = _416;
    out.m_45.z = _328;
    out.m_33.x = _568;
    out.gl_Position.x = _560;
    out.gl_Position.y = _566;
    out.gl_Position.z = _564;
    out.gl_Position.w = _562;
    out.m_47.x = _576;
    out.m_47.y = _580;
    out.m_47.z = _578;
    out.m_47.w = _562;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

