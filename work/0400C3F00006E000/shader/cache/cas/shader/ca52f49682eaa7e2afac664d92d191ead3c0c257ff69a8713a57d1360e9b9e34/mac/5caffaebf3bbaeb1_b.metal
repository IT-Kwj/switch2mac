#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_73 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = in.m_46.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = _97;
    float _116 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1756 = as_type<float>(_124);
        out.gl_Position.z = _1756;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_102);
    bool _140 = _106 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _114;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _126 = as_type<int>(_148);
    }
    int _150 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1811 = as_type<float>(_150);
        out.gl_Position.z = _1811;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_53.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _158 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _156 * _154;
    float _176 = 0.0;
    float _178 = _158;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = _184;
    if (!_168)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = floor(_186);
    float _196 = _186 * 6.283185482025146484375;
    float _198 = -_194;
    float _200 = _186 + _198;
    bool _202 = !_168;
    float _204 = _192;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _158 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _158);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_168;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _178 = _258;
    }
    float _260 = _178;
    float _262 = _196 * 0.15915493667125701904296875;
    float _264 = in.m_46.x;
    float _266 = in.m_46.y;
    float _268 = in.m_46.z;
    float _270 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = in.m_55.z;
    float _274 = _262 * 6.283185482025146484375;
    float _276 = cos(_274);
    bool _278 = _200 < 0.5;
    float _280 = float(_278);
    float _282 = in.m_55.w;
    float _284 = -_200;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = -_280;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _298 = in.m_57.x;
    float _300 = in.m_57.y;
    float _302 = in.m_57.z;
    float _304 = in.m_57.w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _312 = fma(_276, 0.5, 0.5);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _320 = _318 != 0;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _324 = _306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _326 = -_312;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _336 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_260, _264, _330);
    bool _340 = !_316;
    int _342 = _340 ? 0 : 1;
    out.m_59.z = _272;
    bool _344 = !_172;
    int _346 = _344 ? 0 : 1;
    float _348 = fma(_260, _266, _336);
    int _350 = abs(_342);
    out.m_61.x = _324;
    out.m_61.y = _332;
    out.m_61.z = _334;
    out.m_61.w = _322;
    int _352 = abs(_346);
    float _354 = 1.0 / _138;
    bool _356 = !_320;
    int _358 = _356 ? 0 : 1;
    out.m_59.w = _282;
    float _360 = fma(_260, _268, _270);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _364 = fma(_338, _304, _288);
    int _366 = abs(_358);
    float _368 = fma(_348, _304, _290);
    float _370 = float(_350);
    float _372 = fma(_360, _304, _292);
    float _374 = float(_352);
    float _376 = _298 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = abs(_286);
    float _380 = _370 * _378;
    float _382 = _300 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = _302 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = float(_366);
    float _388 = fma(_374, _328, _380);
    float _390 = _106 * _354;
    float _392 = abs(_296);
    float _394 = fma(_386, _392, _388);
    bool _396 = !_362;
    float _398 = _390;
    float _400 = _282;
    float _402 = _272;
    if (!_396)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _406 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _398 = _416;
    }
    float _418 = _398;
    float _420 = in.m_53.y;
    float _422 = _152 * 2.0;
    float _424 = _368 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _426 = in.m_53.z;
    float _428 = _368 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = floor(_422);
    float _436 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _424);
    float _438 = _368 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _440 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _428);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _444 = _442 != 0;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _452 = _450 != 0;
    float _454 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
    float _458 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
    float _460 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _456);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _464 = _440;
    float _466 = _436;
    float _468 = _456;
    if (!_432)
    {
        _464 = _152;
    }
    float _470 = _464;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _474 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _476 = log2(_474);
    bool _478 = _434 > 0.0;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _482 = _434;
    float _484 = _470;
    if (!_432)
    {
        _466 = _420;
    }
    float _486 = _466;
    float _488 = _420 * 2.0;
    bool _490 = _434 >= 0.0;
    bool _492 = isnan(_434);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = _486;
    if (!_432)
    {
        _482 = _486;
    }
    float _504 = _482;
    float _506 = _458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _508 = _504;
    if (_432)
    {
        _484 = _426;
    }
    float _510 = _484;
    float _512 = floor(_488);
    if (_432)
    {
        _502 = _152;
    }
    float _514 = _502;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _518 = _500 + _516;
    float _520 = _514;
    if (!_432)
    {
        _468 = _426;
    }
    float _522 = _468;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[84].z, _462);
    int _526 = _498 ? 0 : 1;
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[83].z, _472);
    float _530 = _476 * _106;
    float _532 = _522;
    if (!_432)
    {
        _520 = _522;
    }
    float _534 = _520;
    float _536 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _524);
    float _538 = _534;
    if (_432)
    {
        _508 = _152;
    }
    float _540 = _508;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_432)
    {
        _532 = _420;
    }
    float _544 = _532;
    float _546 = exp2(_530);
    int _548 = ~_526;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _556 = _552;
    if (!_478)
    {
        int _558 = ~_526;
        int _560 = _558 + 1;
        _556 = _560;
    }
    int _562 = _556;
    float _564 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[83].w, _480);
    float _566 = _420 + _426;
    if (_432)
    {
        _538 = _420;
    }
    float _568 = _538;
    float _570 = -_542;
    float _572 = fma(_554, 2.0, _570);
    bool _574 = !_448;
    int _576 = _574 ? 0 : 1;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _580 = _568 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _582 = _566 + (-1.0);
    int _584 = abs(_576);
    float _586 = _426 * 2.0;
    float _588 = fma(_580, -2.0, _578);
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _592 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _594 = float(_584);
    float _596 = -_546;
    float _598 = _596 + 1.0;
    float _600 = float(_562);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _604 = _592 + _602;
    float _606 = floor(_586);
    bool _608 = _512 > 0.0;
    float _610 = _594 * _600;
    float _612 = _604 * _604;
    float _614 = in.m_63.x;
    float _616 = in.m_63.y;
    float _618 = in.m_63.z;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    bool _624 = _512 >= 0.0;
    bool _626 = isnan(_512);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _636 = _506 + _634;
    float _638 = fma(_518, _518, _612);
    float _640 = 1.0 / _622;
    bool _642 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _650 = _646 || _648;
    float _652 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _564);
    float _654 = fma(_636, _636, _638);
    bool _656 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _664 = _660 || _662;
    float _666 = -_106;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[81].x, _572);
    int _670 = _632 ? 0 : 1;
    float _672 = _610 * (-2.0);
    float _674 = sqrt(_654);
    float _676 = _664 ? _598 : 0.0;
    float _678 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _588);
    bool _680 = _606 > 0.0;
    float _682 = fma(_590, _672, _590);
    bool _684 = _606 >= 0.0;
    bool _686 = isnan(_606);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _528);
    float _696 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_650)
    {
        float _698 = _676 * _640;
        _116 = _698;
    }
    float _700 = _116;
    int _702 = ~_670;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = rsqrt(_654);
    float _710 = fma(_672, _616, _616);
    int _712 = _692 ? 0 : 1;
    float _714 = _420 + (-0.5);
    int _716 = _706;
    if (!_608)
    {
        int _718 = ~_670;
        int _720 = _718 + 1;
        _716 = _720;
    }
    int _722 = _716;
    float _724 = _696 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _726 = !_452;
    int _728 = _726 ? 0 : 1;
    float _730 = _674 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _732 = !_444;
    int _734 = _732 ? 0 : 1;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    int _738 = ~_712;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = _152 + _420;
    int _746 = _742;
    if (!_680)
    {
        int _748 = ~_712;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma(_682, _700, _736);
    int _756 = abs(_728);
    float _758 = _744 + (-1.0);
    int _760 = abs(_734);
    float _762 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _764 = precise::min(_724, _730);
    float _766 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _768 = float(_756);
    float _770 = float(_722);
    float _772 = _708 * _764;
    float _774 = float(_760);
    float _776 = float(_752);
    float _778 = _768 * _770;
    float _780 = _604 * _772;
    float _782 = _518 * _772;
    float _784 = _774 * _776;
    float _786 = -_780;
    float _788 = _604 + _786;
    float _790 = _754 * 0.15915493667125701904296875;
    float _792 = -_782;
    float _794 = _518 + _792;
    float _796 = _784 * (-2.0);
    float _798 = _788 * _788;
    float _800 = _636 * _772;
    float _802 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _804 = fma(_796, _614, _614);
    float _806 = _152 + (-0.5);
    float _808 = fma(_794, _794, _798);
    float _810 = -_800;
    float _812 = _636 + _810;
    float _814 = fma(_802, _796, _802);
    float _816 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].x, _804);
    float _818 = _152 + _426;
    float _820 = fma(_812, _812, _808);
    float _822 = _778 * (-2.0);
    float _824 = fma(_814, _700, _816);
    float _826 = _818 + (-1.0);
    float _828 = _790 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_822, _618, _618);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = in.m_65.x;
    float _838 = in.m_65.y;
    float _840 = in.m_65.z;
    float _842 = fma(_834, _822, _834);
    float _844 = _790 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = sqrt(_820);
    float _850 = _824 * 0.15915493667125701904296875;
    float _852 = _426 + (-0.5);
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].z, _832);
    float _856 = _850 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = fma(_842, _700, _854);
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _836);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _866 = _860 * 0.15915493667125701904296875;
    float _868 = _850 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = _708 * _848;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _876 = _762 * _872;
    float _878 = _696 * _872;
    float _880 = _766 * _872;
    float _882 = _866 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _876 * _874;
    float _888 = _858 * _830;
    float _890 = _878 * _862;
    float _892 = _880 * _864;
    float _894 = _866 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _870 * _846;
    float _900 = _870 * _830;
    float _902 = _884 * _886;
    float _904 = _830 * _884;
    float _906 = _846 * _884;
    float _908 = _858 * _846;
    float _910 = _870 * _902;
    float _912 = _858 * _902;
    float _914 = fma(_896, _898, _888);
    float _916 = -_886;
    float _918 = _896 * _916;
    float _920 = fma(_896, _888, _898);
    float _922 = fma(_914, _890, _910);
    float _924 = -_908;
    float _926 = fma(_896, _900, _924);
    float _928 = -_900;
    float _930 = fma(_896, _908, _928);
    float _932 = fma(_906, _890, _918);
    float _934 = fma(_926, _892, _922);
    float _936 = fma(_930, _890, _912);
    float _938 = fma(_904, _892, _932);
    float _940 = _934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _942 = fma(_920, _892, _936);
    float _944 = _934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _940);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _944);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _952 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _954 = _950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _956 = _952 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _958 = _506 + _954;
    float _960 = _500 + _956;
    float _962 = _934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _966 = _958 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _970 = _960 + _968;
    float _972 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _962);
    float _974 = _966 * _966;
    float _976 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].z, _972);
    float _978 = fma(_970, _970, _974);
    float _980 = _976 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _982 = sqrt(_978);
    float _984 = _592 + _980;
    bool _986 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _934;
    float _990 = _974;
    float _992 = _942;
    if (!_986)
    {
        _988 = _960;
    }
    float _994 = _988;
    float _996 = _994;
    if (!_986)
    {
        _990 = _958;
    }
    float _998 = _990;
    float _1000 = _998;
    if (!_986)
    {
        _992 = _984;
    }
    float _1002 = _992;
    bool _1004 = !_986;
    float _1006 = _1002;
    if (!_1004)
    {
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1012 = _982 + _1010;
        float _1014 = _984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = rsqrt(_978);
        float _1018 = _1012 * _1008;
        float _1020 = _1018 * 0.15915493667125701904296875;
        float _1022 = _1020 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 + (-1.0);
        float _1032 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = fma(_1028, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = fma(_984, _1024, _1032);
        float _1038 = _1016 * _1034;
        float _1040 = fma(_970, _1038, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_966, _1038, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1006 = _1036;
        _996 = _1040;
        _1000 = _1042;
    }
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1000;
    float _1050 = -_780;
    float _1052 = _1050 + _1044;
    float _1054 = -_782;
    float _1056 = _1054 + _1046;
    float _1058 = -_800;
    float _1060 = _1058 + _1048;
    float _1062 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1066 = _1052 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1056 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1078 = _1066 * _1066;
    float _1080 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1076);
    float _1082 = fma(_1070, _1070, _1078);
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1080);
    float _1086 = fma(_1074, _1074, _1082);
    float _1088 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1090 = rsqrt(_1086);
    float _1092 = sqrt(_1086);
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1070 * _1094;
    float _1098 = _1074 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1074;
    float _1116 = _1104;
    float _1118 = _1112;
    float _1120 = _1078;
    float _1122 = _1094;
    if (_1108)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1124;
    }
    float _1126 = _1114;
    if (_1108)
    {
        float _1128 = rsqrt(_1104);
        _1116 = _1128;
    }
    float _1130 = _1116;
    float _1132 = _1130;
    if (_1108)
    {
        float _1134 = _1112 * _1126;
        _1118 = _1134;
    }
    float _1136 = _1118;
    if (_1108)
    {
        float _1138 = _1136 * 0.15915493667125701904296875;
        _1120 = _1138;
    }
    float _1140 = _1120;
    float _1142 = _1126;
    float _1144 = _1140;
    if (_1108)
    {
        float _1146 = _1140 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        _1142 = _1148;
    }
    float _1150 = _1142;
    float _1152 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1154 = precise::max(0.0, _1152);
    float _1156 = _966;
    float _1158 = _1154;
    if (_1108)
    {
        float _1160 = _1140 * 6.283185482025146484375;
        float _1162 = cos(_1160);
        _1156 = _1162;
    }
    float _1164 = _1156;
    float _1166 = -_1094;
    float _1168 = -_1154;
    float _1170 = fma(_1066, _1166, _1168);
    float _1172 = _1170;
    if (_1108)
    {
        float _1174 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1174;
    }
    float _1176 = _1158;
    float _1178 = _1150;
    float _1180 = _1176;
    if (_1108)
    {
        float _1182 = fma(_1150, _1176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1178 = _1182;
    }
    float _1184 = _1178;
    float _1186 = _1184;
    float _1188 = _1164;
    if (_1108)
    {
        float _1190 = _1164 + (-1.0);
        _1180 = _1190;
    }
    float _1192 = _1180;
    float _1194 = _1192;
    if (_1108)
    {
        float _1196 = _1130 * _1184;
        _1122 = _1196;
    }
    float _1198 = _1122;
    if (!_1108)
    {
        _1186 = _1096;
    }
    float _1200 = _1186;
    float _1202 = _1200;
    if (_1108)
    {
        float _1204 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1204;
    }
    float _1206 = _1144;
    if (_1108)
    {
        float _1208 = _1096 * _1198;
        _1202 = _1208;
    }
    float _1210 = _1202;
    if (!_1108)
    {
        _1194 = _1098;
    }
    float _1212 = _1194;
    float _1214 = _1212;
    if (_1108)
    {
        float _1216 = _1098 * _1198;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (!_1108)
    {
        _1132 = _1100;
    }
    float _1220 = _1132;
    float _1222 = _1220;
    if (_1108)
    {
        float _1224 = fma(_1170, _1164, _1206);
        _1172 = _1224;
    }
    float _1226 = _1172;
    if (_1108)
    {
        float _1228 = _1210 * _1210;
        _1222 = _1228;
    }
    float _1230 = _1222;
    if (!_1108)
    {
        _1188 = _1102;
    }
    float _1232 = _1188;
    float _1234 = _1232;
    if (_1108)
    {
        float _1236 = _1218 * _1218;
        _1234 = _1236;
    }
    float _1238 = _1234;
    float _1240 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1242 = fma(_1226, _1226, _1230);
    float _1244 = _1242 + _1238;
    float _1246 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1240);
    float _1248 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1246);
    float _1258 = rsqrt(_1244);
    float _1260 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1248);
    float _1262 = -_1254;
    float _1264 = _1262 + 1.0;
    float _1266 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1268 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1274 = abs(_1264);
    float _1276 = log2(_1274);
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1280 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = -_1272;
    float _1284 = fma(_1282, _1062, 1.0);
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1288 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1258 * _1210;
    float _1292 = _1258 * _1226;
    float _1294 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1286);
    float _1296 = _1258 * _1218;
    float _1298 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1300 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1302 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1294);
    float _1304 = log2(_1284);
    float _1306 = -_1298;
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1306);
    float _1310 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1302);
    float _1314 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1316 = -_1296;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1308);
    float _1320 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = _1292 + 1.0;
    float _1324 = 1.0 / _1312;
    float _1326 = fma(_1318, -0.5, 0.5);
    float _1328 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1318, 0.5, 0.5);
    float _1332 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1314);
    float _1334 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1336 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1338 = exp2(_1310);
    float _1340 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1332);
    float _1342 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1334);
    float _1344 = fma(_1330, _1336, -0.212114393711090087890625);
    float _1346 = _1304 * 0.693147182464599609375;
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1340);
    float _1350 = fma(_1330, _1344, 1.570728778839111328125);
    float _1352 = sqrt(_1326);
    float _1354 = _1342 * _1324;
    float _1356 = _1348 * _1324;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1360 = fma(_1354, 0.5, 0.5);
    float _1362 = fma(_1356, -0.5, 0.5);
    float _1364 = -_1292;
    float _1366 = fma(_1338, _1322, _1364);
    float3 _3723 = float3(_1360, _1362, _1358);
    float _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3723, float3(0.0), isnan(_3723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3723, float3(0.0), isnan(_3723)), level(0.0)).x;
    float _1370 = fma(_1366, 0.5, 0.5);
    float _1372 = _1352 * 0.636619746685028076171875;
    float _1374 = -_1350;
    float _1376 = fma(_1372, _1374, 1.0);
    float3 _3744 = float3(_1360, _1362, _1358);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3744, float3(0.0), isnan(_3744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3744, float3(0.0), isnan(_3744)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float2 _3761 = float2(_1376, _1370);
    float3 _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1393 = _1391.x;
    float _1395 = _1391.y;
    float _1397 = _1391.z;
    float _1399 = in.m_53.w;
    float _1401 = _536 * (-0.15915493667125701904296875);
    float _1403 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1407 = _1405 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1409 = _1401 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1419 = _1417 != 0;
    float _1421 = -_282;
    float _1423 = _1421 + 1.0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1427 = _1425 != 0;
    float _1429 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1431 = -_780;
    float _1433 = _592 + _1431;
    float _1435 = 1.0 / _1407;
    bool _1437 = _426 > 0.5;
    bool _1439 = _1437 && _1427;
    float _1441 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1429);
    bool _1443 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1445 = isnan(_418);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1451 = _1447 || _1449;
    float _1453 = float(_1451);
    float _1455 = -_800;
    float _1457 = _506 + _1455;
    float _1459 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_67.x = _1056;
    out.m_67.y = _1052;
    out.m_67.z = _1060;
    float _1461 = 1.0 / _1415;
    bool _1463 = _1399 > 0.5;
    float _1465 = -_1453;
    float _1467 = _1465 + 1.0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1469;
    if (_1419)
    {
        float _1473 = _1463 ? _1423 : _282;
        _400 = _1473;
    }
    float _1475 = _400;
    float _1477 = _1459 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _764;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1491 = _418 + _1489;
    float _1493 = _1481 * _1435;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_71.x = _878;
    float _1499 = _1485 * _1461;
    bool _1501 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1503 = isnan(_418);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1515 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1517 = isnan(_418);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1523 = _1519 || _1521;
    float _1525 = float(_1523);
    out.m_51.x = _1477;
    float _1527 = _1511 * _1467;
    bool _1529 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1531 = isnan(_418);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = -_1525;
    float _1543 = _1541 + 1.0;
    float _1545 = -_1511;
    float _1547 = _1545 + 1.0;
    float _1549 = 1.0 / _1497;
    float _1551 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1553 = _1539 * _1543;
    float _1555 = _1525 * _1547;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1559 = _418 + _1557;
    float _1561 = -_1539;
    float _1563 = _1561 + 1.0;
    float _1565 = fma(_1551, _1475, -0.5);
    float _1567 = exp2(_1403);
    float _1569 = fma(_1493, _1491, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1571 = _1491;
    if (!_1427)
    {
        _1571 = _272;
    }
    float _1573 = _1571;
    float _1575 = _1573;
    if (_1439)
    {
        float _1577 = -_272;
        float _1579 = _1577 + 1.0;
        _402 = _1579;
    }
    float _1581 = _402;
    float _1583 = fma(_1499, _1559, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1585 = _1569 * _1553;
    float _1587 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1589 = _1401 * 6.283185482025146484375;
    float _1591 = cos(_1589);
    if (_1427)
    {
        _1575 = _1581;
    }
    float _1593 = _1575;
    float _1595 = _1471 * _1549;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1599 = _418 + _1597;
    float _1601 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1585);
    float _1603 = _1411 * _1565;
    float _1605 = fma(_1587, _1593, -0.5);
    float _1607 = fma(_1595, _1599, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1609 = fma(_1583, _1555, _1601);
    float _1611 = -_1567;
    float _1613 = _1611 + 1.0;
    float _1615 = fma(_1607, _1527, _1609);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1619 = _1591 * _1565;
    float _1621 = -_1603;
    float _1623 = fma(_1591, _1605, _1621);
    float _1625 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1615);
    float _1627 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1441);
    float _1629 = fma(_1411, _1605, _1619);
    float _1631 = fma(_694, _1623, _668);
    float _1633 = -_782;
    float _1635 = _500 + _1633;
    float _1637 = -_678;
    float _1639 = fma(_652, _1629, _1637);
    float _1641 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1643 = _1639 + 0.5;
    float _1645 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    out.m_73.x = _1635;
    out.m_73.y = _1433;
    out.m_73.z = _1457;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1653 = _1645 + _1312;
    float _1655 = _1342 + _1312;
    float _1657 = _1312 * 0.5;
    float _1659 = _1631 + 0.5;
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1665 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1667 = -_1617;
    float _1669 = _1667 + 1.0;
    float _1671 = _1653 * 0.5;
    float _1673 = _1655 * 0.5;
    float _1675 = fma(_1348, -0.5, _1657);
    out.m_75.x = _1661;
    out.m_75.y = _1663;
    out.m_75.z = _1665;
    out.m_75.w = _1641;
    out.m_77.z = _1659;
    out.m_77.w = _1643;
    out.gl_Position.x = _1342;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1312;
    out.m_79.x = _1673;
    out.m_79.y = _1675;
    out.m_79.z = _1671;
    out.m_79.w = _1312;
    float _1677 = _1617 * _1368;
    float _1679 = _1387 * _1677;
    float _1681 = _1397 * _1677;
    float _1683 = fma(_1393, _1679, _1381);
    float _1685 = fma(_1395, _1679, _1383);
    float _1687 = _1387 * _1669;
    float _1689 = fma(_1387, _1681, _1385);
    out.m_81.x = _1683;
    out.m_81.y = _1685;
    out.m_81.z = _1689;
    out.m_81.w = _1687;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = in.m_46.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = _97;
    float _116 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1756 = as_type<float>(_124);
        out.gl_Position.z = _1756;
    }
    if (!_110)
    {
        return out;
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_102);
    bool _140 = _106 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _114;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _126 = as_type<int>(_148);
    }
    int _150 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1811 = as_type<float>(_150);
        out.gl_Position.z = _1811;
    }
    if (_144)
    {
        return out;
    }
    float _152 = in.m_53.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _158 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _156 * _154;
    float _176 = 0.0;
    float _178 = _158;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = _184;
    if (!_168)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = floor(_186);
    float _196 = _186 * 6.283185482025146484375;
    float _198 = -_194;
    float _200 = _186 + _198;
    bool _202 = !_168;
    float _204 = _192;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _158 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _158);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_168;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _178 = _258;
    }
    float _260 = _178;
    float _262 = _196 * 0.15915493667125701904296875;
    float _264 = in.m_46.x;
    float _266 = in.m_46.y;
    float _268 = in.m_46.z;
    float _270 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = in.m_55.z;
    float _274 = _262 * 6.283185482025146484375;
    float _276 = cos(_274);
    bool _278 = _200 < 0.5;
    float _280 = float(_278);
    float _282 = in.m_55.w;
    float _284 = -_200;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = -_280;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _298 = in.m_57.x;
    float _300 = in.m_57.y;
    float _302 = in.m_57.z;
    float _304 = in.m_57.w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _312 = fma(_276, 0.5, 0.5);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _320 = _318 != 0;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _324 = _306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _326 = -_312;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _336 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_260, _264, _330);
    bool _340 = !_316;
    int _342 = _340 ? 0 : 1;
    out.m_59.z = _272;
    bool _344 = !_172;
    int _346 = _344 ? 0 : 1;
    float _348 = fma(_260, _266, _336);
    int _350 = abs(_342);
    out.m_61.x = _324;
    out.m_61.y = _332;
    out.m_61.z = _334;
    out.m_61.w = _322;
    int _352 = abs(_346);
    float _354 = 1.0 / _138;
    bool _356 = !_320;
    int _358 = _356 ? 0 : 1;
    out.m_59.w = _282;
    float _360 = fma(_260, _268, _270);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _364 = fma(_338, _304, _288);
    int _366 = abs(_358);
    float _368 = fma(_348, _304, _290);
    float _370 = float(_350);
    float _372 = fma(_360, _304, _292);
    float _374 = float(_352);
    float _376 = _298 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = abs(_286);
    float _380 = _370 * _378;
    float _382 = _300 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = _302 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = float(_366);
    float _388 = fma(_374, _328, _380);
    float _390 = _106 * _354;
    float _392 = abs(_296);
    float _394 = fma(_386, _392, _388);
    bool _396 = !_362;
    float _398 = _390;
    float _400 = _282;
    float _402 = _272;
    if (!_396)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _406 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _398 = _416;
    }
    float _418 = _398;
    float _420 = in.m_53.y;
    float _422 = _152 * 2.0;
    float _424 = _368 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _426 = in.m_53.z;
    float _428 = _368 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = floor(_422);
    float _436 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _424);
    float _438 = _368 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _440 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _428);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _444 = _442 != 0;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _452 = _450 != 0;
    float _454 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
    float _458 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
    float _460 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _456);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _464 = _440;
    float _466 = _436;
    float _468 = _456;
    if (!_432)
    {
        _464 = _152;
    }
    float _470 = _464;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _474 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _476 = log2(_474);
    bool _478 = _434 > 0.0;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _482 = _434;
    float _484 = _470;
    if (!_432)
    {
        _466 = _420;
    }
    float _486 = _466;
    float _488 = _420 * 2.0;
    bool _490 = _434 >= 0.0;
    bool _492 = isnan(_434);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = _486;
    if (!_432)
    {
        _482 = _486;
    }
    float _504 = _482;
    float _506 = _458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _508 = _504;
    if (_432)
    {
        _484 = _426;
    }
    float _510 = _484;
    float _512 = floor(_488);
    if (_432)
    {
        _502 = _152;
    }
    float _514 = _502;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _518 = _500 + _516;
    float _520 = _514;
    if (!_432)
    {
        _468 = _426;
    }
    float _522 = _468;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[84].z, _462);
    int _526 = _498 ? 0 : 1;
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[83].z, _472);
    float _530 = _476 * _106;
    float _532 = _522;
    if (!_432)
    {
        _520 = _522;
    }
    float _534 = _520;
    float _536 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _524);
    float _538 = _534;
    if (_432)
    {
        _508 = _152;
    }
    float _540 = _508;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_432)
    {
        _532 = _420;
    }
    float _544 = _532;
    float _546 = exp2(_530);
    int _548 = ~_526;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _556 = _552;
    if (!_478)
    {
        int _558 = ~_526;
        int _560 = _558 + 1;
        _556 = _560;
    }
    int _562 = _556;
    float _564 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[83].w, _480);
    float _566 = _420 + _426;
    if (_432)
    {
        _538 = _420;
    }
    float _568 = _538;
    float _570 = -_542;
    float _572 = fma(_554, 2.0, _570);
    bool _574 = !_448;
    int _576 = _574 ? 0 : 1;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _580 = _568 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _582 = _566 + (-1.0);
    int _584 = abs(_576);
    float _586 = _426 * 2.0;
    float _588 = fma(_580, -2.0, _578);
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _592 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _594 = float(_584);
    float _596 = -_546;
    float _598 = _596 + 1.0;
    float _600 = float(_562);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _604 = _592 + _602;
    float _606 = floor(_586);
    bool _608 = _512 > 0.0;
    float _610 = _594 * _600;
    float _612 = _604 * _604;
    float _614 = in.m_63.x;
    float _616 = in.m_63.y;
    float _618 = in.m_63.z;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    bool _624 = _512 >= 0.0;
    bool _626 = isnan(_512);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _636 = _506 + _634;
    float _638 = fma(_518, _518, _612);
    float _640 = 1.0 / _622;
    bool _642 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _650 = _646 || _648;
    float _652 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _564);
    float _654 = fma(_636, _636, _638);
    bool _656 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _664 = _660 || _662;
    float _666 = -_106;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[81].x, _572);
    int _670 = _632 ? 0 : 1;
    float _672 = _610 * (-2.0);
    float _674 = sqrt(_654);
    float _676 = _664 ? _598 : 0.0;
    float _678 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _588);
    bool _680 = _606 > 0.0;
    float _682 = fma(_590, _672, _590);
    bool _684 = _606 >= 0.0;
    bool _686 = isnan(_606);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _528);
    float _696 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_650)
    {
        float _698 = _676 * _640;
        _116 = _698;
    }
    float _700 = _116;
    int _702 = ~_670;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = rsqrt(_654);
    float _710 = fma(_672, _616, _616);
    int _712 = _692 ? 0 : 1;
    float _714 = _420 + (-0.5);
    int _716 = _706;
    if (!_608)
    {
        int _718 = ~_670;
        int _720 = _718 + 1;
        _716 = _720;
    }
    int _722 = _716;
    float _724 = _696 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _726 = !_452;
    int _728 = _726 ? 0 : 1;
    float _730 = _674 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _732 = !_444;
    int _734 = _732 ? 0 : 1;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    int _738 = ~_712;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = _152 + _420;
    int _746 = _742;
    if (!_680)
    {
        int _748 = ~_712;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma(_682, _700, _736);
    int _756 = abs(_728);
    float _758 = _744 + (-1.0);
    int _760 = abs(_734);
    float _762 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _764 = precise::min(_724, _730);
    float _766 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _768 = float(_756);
    float _770 = float(_722);
    float _772 = _708 * _764;
    float _774 = float(_760);
    float _776 = float(_752);
    float _778 = _768 * _770;
    float _780 = _604 * _772;
    float _782 = _518 * _772;
    float _784 = _774 * _776;
    float _786 = -_780;
    float _788 = _604 + _786;
    float _790 = _754 * 0.15915493667125701904296875;
    float _792 = -_782;
    float _794 = _518 + _792;
    float _796 = _784 * (-2.0);
    float _798 = _788 * _788;
    float _800 = _636 * _772;
    float _802 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _804 = fma(_796, _614, _614);
    float _806 = _152 + (-0.5);
    float _808 = fma(_794, _794, _798);
    float _810 = -_800;
    float _812 = _636 + _810;
    float _814 = fma(_802, _796, _802);
    float _816 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].x, _804);
    float _818 = _152 + _426;
    float _820 = fma(_812, _812, _808);
    float _822 = _778 * (-2.0);
    float _824 = fma(_814, _700, _816);
    float _826 = _818 + (-1.0);
    float _828 = _790 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_822, _618, _618);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = in.m_65.x;
    float _838 = in.m_65.y;
    float _840 = in.m_65.z;
    float _842 = fma(_834, _822, _834);
    float _844 = _790 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = sqrt(_820);
    float _850 = _824 * 0.15915493667125701904296875;
    float _852 = _426 + (-0.5);
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].z, _832);
    float _856 = _850 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = fma(_842, _700, _854);
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _836);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _866 = _860 * 0.15915493667125701904296875;
    float _868 = _850 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = _708 * _848;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _876 = _762 * _872;
    float _878 = _696 * _872;
    float _880 = _766 * _872;
    float _882 = _866 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _876 * _874;
    float _888 = _858 * _830;
    float _890 = _878 * _862;
    float _892 = _880 * _864;
    float _894 = _866 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _870 * _846;
    float _900 = _870 * _830;
    float _902 = _884 * _886;
    float _904 = _830 * _884;
    float _906 = _846 * _884;
    float _908 = _858 * _846;
    float _910 = _870 * _902;
    float _912 = _858 * _902;
    float _914 = fma(_896, _898, _888);
    float _916 = -_886;
    float _918 = _896 * _916;
    float _920 = fma(_896, _888, _898);
    float _922 = fma(_914, _890, _910);
    float _924 = -_908;
    float _926 = fma(_896, _900, _924);
    float _928 = -_900;
    float _930 = fma(_896, _908, _928);
    float _932 = fma(_906, _890, _918);
    float _934 = fma(_926, _892, _922);
    float _936 = fma(_930, _890, _912);
    float _938 = fma(_904, _892, _932);
    float _940 = _934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _942 = fma(_920, _892, _936);
    float _944 = _934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _940);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _944);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _952 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _954 = _950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _956 = _952 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _958 = _506 + _954;
    float _960 = _500 + _956;
    float _962 = _934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _966 = _958 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _970 = _960 + _968;
    float _972 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _962);
    float _974 = _966 * _966;
    float _976 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].z, _972);
    float _978 = fma(_970, _970, _974);
    float _980 = _976 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _982 = sqrt(_978);
    float _984 = _592 + _980;
    bool _986 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _934;
    float _990 = _974;
    float _992 = _942;
    if (!_986)
    {
        _988 = _960;
    }
    float _994 = _988;
    float _996 = _994;
    if (!_986)
    {
        _990 = _958;
    }
    float _998 = _990;
    float _1000 = _998;
    if (!_986)
    {
        _992 = _984;
    }
    float _1002 = _992;
    bool _1004 = !_986;
    float _1006 = _1002;
    if (!_1004)
    {
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1012 = _982 + _1010;
        float _1014 = _984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = rsqrt(_978);
        float _1018 = _1012 * _1008;
        float _1020 = _1018 * 0.15915493667125701904296875;
        float _1022 = _1020 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 + (-1.0);
        float _1032 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = fma(_1028, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = fma(_984, _1024, _1032);
        float _1038 = _1016 * _1034;
        float _1040 = fma(_970, _1038, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_966, _1038, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1006 = _1036;
        _996 = _1040;
        _1000 = _1042;
    }
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1000;
    float _1050 = -_780;
    float _1052 = _1050 + _1044;
    float _1054 = -_782;
    float _1056 = _1054 + _1046;
    float _1058 = -_800;
    float _1060 = _1058 + _1048;
    float _1062 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1066 = _1052 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1056 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1078 = _1066 * _1066;
    float _1080 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1076);
    float _1082 = fma(_1070, _1070, _1078);
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1080);
    float _1086 = fma(_1074, _1074, _1082);
    float _1088 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1090 = rsqrt(_1086);
    float _1092 = sqrt(_1086);
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1070 * _1094;
    float _1098 = _1074 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1074;
    float _1116 = _1104;
    float _1118 = _1112;
    float _1120 = _1078;
    float _1122 = _1094;
    if (_1108)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1124;
    }
    float _1126 = _1114;
    if (_1108)
    {
        float _1128 = rsqrt(_1104);
        _1116 = _1128;
    }
    float _1130 = _1116;
    float _1132 = _1130;
    if (_1108)
    {
        float _1134 = _1112 * _1126;
        _1118 = _1134;
    }
    float _1136 = _1118;
    if (_1108)
    {
        float _1138 = _1136 * 0.15915493667125701904296875;
        _1120 = _1138;
    }
    float _1140 = _1120;
    float _1142 = _1126;
    float _1144 = _1140;
    if (_1108)
    {
        float _1146 = _1140 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        _1142 = _1148;
    }
    float _1150 = _1142;
    float _1152 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1154 = precise::max(0.0, _1152);
    float _1156 = _966;
    float _1158 = _1154;
    if (_1108)
    {
        float _1160 = _1140 * 6.283185482025146484375;
        float _1162 = cos(_1160);
        _1156 = _1162;
    }
    float _1164 = _1156;
    float _1166 = -_1094;
    float _1168 = -_1154;
    float _1170 = fma(_1066, _1166, _1168);
    float _1172 = _1170;
    if (_1108)
    {
        float _1174 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1174;
    }
    float _1176 = _1158;
    float _1178 = _1150;
    float _1180 = _1176;
    if (_1108)
    {
        float _1182 = fma(_1150, _1176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1178 = _1182;
    }
    float _1184 = _1178;
    float _1186 = _1184;
    float _1188 = _1164;
    if (_1108)
    {
        float _1190 = _1164 + (-1.0);
        _1180 = _1190;
    }
    float _1192 = _1180;
    float _1194 = _1192;
    if (_1108)
    {
        float _1196 = _1130 * _1184;
        _1122 = _1196;
    }
    float _1198 = _1122;
    if (!_1108)
    {
        _1186 = _1096;
    }
    float _1200 = _1186;
    float _1202 = _1200;
    if (_1108)
    {
        float _1204 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1204;
    }
    float _1206 = _1144;
    if (_1108)
    {
        float _1208 = _1096 * _1198;
        _1202 = _1208;
    }
    float _1210 = _1202;
    if (!_1108)
    {
        _1194 = _1098;
    }
    float _1212 = _1194;
    float _1214 = _1212;
    if (_1108)
    {
        float _1216 = _1098 * _1198;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (!_1108)
    {
        _1132 = _1100;
    }
    float _1220 = _1132;
    float _1222 = _1220;
    if (_1108)
    {
        float _1224 = fma(_1170, _1164, _1206);
        _1172 = _1224;
    }
    float _1226 = _1172;
    if (_1108)
    {
        float _1228 = _1210 * _1210;
        _1222 = _1228;
    }
    float _1230 = _1222;
    if (!_1108)
    {
        _1188 = _1102;
    }
    float _1232 = _1188;
    float _1234 = _1232;
    if (_1108)
    {
        float _1236 = _1218 * _1218;
        _1234 = _1236;
    }
    float _1238 = _1234;
    float _1240 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1242 = fma(_1226, _1226, _1230);
    float _1244 = _1242 + _1238;
    float _1246 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1240);
    float _1248 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1246);
    float _1258 = rsqrt(_1244);
    float _1260 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1248);
    float _1262 = -_1254;
    float _1264 = _1262 + 1.0;
    float _1266 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1268 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1274 = abs(_1264);
    float _1276 = log2(_1274);
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1280 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = -_1272;
    float _1284 = fma(_1282, _1062, 1.0);
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1288 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1258 * _1210;
    float _1292 = _1258 * _1226;
    float _1294 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1286);
    float _1296 = _1258 * _1218;
    float _1298 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1300 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1302 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1294);
    float _1304 = log2(_1284);
    float _1306 = -_1298;
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1306);
    float _1310 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1302);
    float _1314 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1316 = -_1296;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1308);
    float _1320 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = _1292 + 1.0;
    float _1324 = 1.0 / _1312;
    float _1326 = fma(_1318, -0.5, 0.5);
    float _1328 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1318, 0.5, 0.5);
    float _1332 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1314);
    float _1334 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1336 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1338 = exp2(_1310);
    float _1340 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1332);
    float _1342 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1334);
    float _1344 = fma(_1330, _1336, -0.212114393711090087890625);
    float _1346 = _1304 * 0.693147182464599609375;
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1340);
    float _1350 = fma(_1330, _1344, 1.570728778839111328125);
    float _1352 = sqrt(_1326);
    float _1354 = _1342 * _1324;
    float _1356 = _1348 * _1324;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1360 = fma(_1354, 0.5, 0.5);
    float _1362 = fma(_1356, -0.5, 0.5);
    float _1364 = -_1292;
    float _1366 = fma(_1338, _1322, _1364);
    float3 _3723 = float3(_1360, _1362, _1358);
    float _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3723, float3(0.0), isnan(_3723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3723, float3(0.0), isnan(_3723)), level(0.0)).x;
    float _1370 = fma(_1366, 0.5, 0.5);
    float _1372 = _1352 * 0.636619746685028076171875;
    float _1374 = -_1350;
    float _1376 = fma(_1372, _1374, 1.0);
    float3 _3744 = float3(_1360, _1362, _1358);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3744, float3(0.0), isnan(_3744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3744, float3(0.0), isnan(_3744)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float2 _3761 = float2(_1376, _1370);
    float3 _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1393 = _1391.x;
    float _1395 = _1391.y;
    float _1397 = _1391.z;
    float _1399 = in.m_53.w;
    float _1401 = _536 * (-0.15915493667125701904296875);
    float _1403 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1407 = _1405 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1409 = _1401 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1419 = _1417 != 0;
    float _1421 = -_282;
    float _1423 = _1421 + 1.0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1427 = _1425 != 0;
    float _1429 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1431 = -_780;
    float _1433 = _592 + _1431;
    float _1435 = 1.0 / _1407;
    bool _1437 = _426 > 0.5;
    bool _1439 = _1437 && _1427;
    float _1441 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1429);
    bool _1443 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1445 = isnan(_418);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1451 = _1447 || _1449;
    float _1453 = float(_1451);
    float _1455 = -_800;
    float _1457 = _506 + _1455;
    float _1459 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_67.x = _1056;
    out.m_67.y = _1052;
    out.m_67.z = _1060;
    float _1461 = 1.0 / _1415;
    bool _1463 = _1399 > 0.5;
    float _1465 = -_1453;
    float _1467 = _1465 + 1.0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1469;
    if (_1419)
    {
        float _1473 = _1463 ? _1423 : _282;
        _400 = _1473;
    }
    float _1475 = _400;
    float _1477 = _1459 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _764;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1491 = _418 + _1489;
    float _1493 = _1481 * _1435;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_71.x = _878;
    float _1499 = _1485 * _1461;
    bool _1501 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1503 = isnan(_418);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1515 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1517 = isnan(_418);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1523 = _1519 || _1521;
    float _1525 = float(_1523);
    out.m_51.x = _1477;
    float _1527 = _1511 * _1467;
    bool _1529 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1531 = isnan(_418);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = -_1525;
    float _1543 = _1541 + 1.0;
    float _1545 = -_1511;
    float _1547 = _1545 + 1.0;
    float _1549 = 1.0 / _1497;
    float _1551 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1553 = _1539 * _1543;
    float _1555 = _1525 * _1547;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1559 = _418 + _1557;
    float _1561 = -_1539;
    float _1563 = _1561 + 1.0;
    float _1565 = fma(_1551, _1475, -0.5);
    float _1567 = exp2(_1403);
    float _1569 = fma(_1493, _1491, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1571 = _1491;
    if (!_1427)
    {
        _1571 = _272;
    }
    float _1573 = _1571;
    float _1575 = _1573;
    if (_1439)
    {
        float _1577 = -_272;
        float _1579 = _1577 + 1.0;
        _402 = _1579;
    }
    float _1581 = _402;
    float _1583 = fma(_1499, _1559, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1585 = _1569 * _1553;
    float _1587 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1589 = _1401 * 6.283185482025146484375;
    float _1591 = cos(_1589);
    if (_1427)
    {
        _1575 = _1581;
    }
    float _1593 = _1575;
    float _1595 = _1471 * _1549;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1599 = _418 + _1597;
    float _1601 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1585);
    float _1603 = _1411 * _1565;
    float _1605 = fma(_1587, _1593, -0.5);
    float _1607 = fma(_1595, _1599, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1609 = fma(_1583, _1555, _1601);
    float _1611 = -_1567;
    float _1613 = _1611 + 1.0;
    float _1615 = fma(_1607, _1527, _1609);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1619 = _1591 * _1565;
    float _1621 = -_1603;
    float _1623 = fma(_1591, _1605, _1621);
    float _1625 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1615);
    float _1627 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1441);
    float _1629 = fma(_1411, _1605, _1619);
    float _1631 = fma(_694, _1623, _668);
    float _1633 = -_782;
    float _1635 = _500 + _1633;
    float _1637 = -_678;
    float _1639 = fma(_652, _1629, _1637);
    float _1641 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1643 = _1639 + 0.5;
    float _1645 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    out.m_73.x = _1635;
    out.m_73.y = _1433;
    out.m_73.z = _1457;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1653 = _1645 + _1312;
    float _1655 = _1342 + _1312;
    float _1657 = _1312 * 0.5;
    float _1659 = _1631 + 0.5;
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1665 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1667 = -_1617;
    float _1669 = _1667 + 1.0;
    float _1671 = _1653 * 0.5;
    float _1673 = _1655 * 0.5;
    float _1675 = fma(_1348, -0.5, _1657);
    out.m_75.x = _1661;
    out.m_75.y = _1663;
    out.m_75.z = _1665;
    out.m_75.w = _1641;
    out.m_77.z = _1659;
    out.m_77.w = _1643;
    out.gl_Position.x = _1342;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1312;
    out.m_79.x = _1673;
    out.m_79.y = _1675;
    out.m_79.z = _1671;
    out.m_79.w = _1312;
    float _1677 = _1617 * _1368;
    float _1679 = _1387 * _1677;
    float _1681 = _1397 * _1677;
    float _1683 = fma(_1393, _1679, _1381);
    float _1685 = fma(_1395, _1679, _1383);
    float _1687 = _1387 * _1669;
    float _1689 = fma(_1387, _1681, _1385);
    out.m_81.x = _1683;
    out.m_81.y = _1685;
    out.m_81.z = _1689;
    out.m_81.w = _1687;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = in.m_46.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    float _114 = _97;
    float _116 = _106;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_110)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1756 = as_type<float>(_124);
        out.gl_Position.z = _1756;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _128 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_97);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = float(_102);
    bool _140 = _106 >= _138;
    bool _142 = !_136;
    bool _144 = _140 || _142;
    if (_144)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _114;
    if (_144)
    {
        out.m_51.x = 0.0;
    }
    if (_144)
    {
        float _148 = _146 * 5.0;
        _126 = as_type<int>(_148);
    }
    int _150 = _126;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1811 = as_type<float>(_150);
        out.gl_Position.z = _1811;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_53.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _158 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _156 * _154;
    float _176 = 0.0;
    float _178 = _158;
    if (!_168)
    {
        float _180 = _158 * _158;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = _184;
    if (!_168)
    {
        float _190 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    float _194 = floor(_186);
    float _196 = _186 * 6.283185482025146484375;
    float _198 = -_194;
    float _200 = _186 + _198;
    bool _202 = !_168;
    float _204 = _192;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _158 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _158);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_168;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _158 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _178 = _258;
    }
    float _260 = _178;
    float _262 = _196 * 0.15915493667125701904296875;
    float _264 = in.m_46.x;
    float _266 = in.m_46.y;
    float _268 = in.m_46.z;
    float _270 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = in.m_55.z;
    float _274 = _262 * 6.283185482025146484375;
    float _276 = cos(_274);
    bool _278 = _200 < 0.5;
    float _280 = float(_278);
    float _282 = in.m_55.w;
    float _284 = -_200;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    float _294 = -_280;
    float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _298 = in.m_57.x;
    float _300 = in.m_57.y;
    float _302 = in.m_57.z;
    float _304 = in.m_57.w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _312 = fma(_276, 0.5, 0.5);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _320 = _318 != 0;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _324 = _306 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _326 = -_312;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _330 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _332 = _308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = _310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _336 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = fma(_260, _264, _330);
    bool _340 = !_316;
    int _342 = _340 ? 0 : 1;
    out.m_59.z = _272;
    bool _344 = !_172;
    int _346 = _344 ? 0 : 1;
    float _348 = fma(_260, _266, _336);
    int _350 = abs(_342);
    out.m_61.x = _324;
    out.m_61.y = _332;
    out.m_61.z = _334;
    out.m_61.w = _322;
    int _352 = abs(_346);
    float _354 = 1.0 / _138;
    bool _356 = !_320;
    int _358 = _356 ? 0 : 1;
    out.m_59.w = _282;
    float _360 = fma(_260, _268, _270);
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _364 = fma(_338, _304, _288);
    int _366 = abs(_358);
    float _368 = fma(_348, _304, _290);
    float _370 = float(_350);
    float _372 = fma(_360, _304, _292);
    float _374 = float(_352);
    float _376 = _298 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _378 = abs(_286);
    float _380 = _370 * _378;
    float _382 = _300 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = _302 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = float(_366);
    float _388 = fma(_374, _328, _380);
    float _390 = _106 * _354;
    float _392 = abs(_296);
    float _394 = fma(_386, _392, _388);
    bool _396 = !_362;
    float _398 = _390;
    float _400 = _282;
    float _402 = _272;
    if (!_396)
    {
        float _404 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _406 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _408 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[11].w, _106);
        float _410 = _408 * _404;
        float _412 = floor(_410);
        float _414 = -_412;
        float _416 = _410 + _414;
        _398 = _416;
    }
    float _418 = _398;
    float _420 = in.m_53.y;
    float _422 = _152 * 2.0;
    float _424 = _368 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _426 = in.m_53.z;
    float _428 = _368 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _432 = _430 != 0;
    float _434 = floor(_422);
    float _436 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[5].x, _424);
    float _438 = _368 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _440 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[6].x, _428);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _444 = _442 != 0;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _452 = _450 != 0;
    float _454 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _456 = fma(_364, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
    float _458 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[6].z, _440);
    float _460 = fma(_372, (*spvDescriptorSet0.vp_c10)._m0[4].z, _456);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _464 = _440;
    float _466 = _436;
    float _468 = _456;
    if (!_432)
    {
        _464 = _152;
    }
    float _470 = _464;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _474 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _476 = log2(_474);
    bool _478 = _434 > 0.0;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _482 = _434;
    float _484 = _470;
    if (!_432)
    {
        _466 = _420;
    }
    float _486 = _466;
    float _488 = _420 * 2.0;
    bool _490 = _434 >= 0.0;
    bool _492 = isnan(_434);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = _460 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = _486;
    if (!_432)
    {
        _482 = _486;
    }
    float _504 = _482;
    float _506 = _458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _508 = _504;
    if (_432)
    {
        _484 = _426;
    }
    float _510 = _484;
    float _512 = floor(_488);
    if (_432)
    {
        _502 = _152;
    }
    float _514 = _502;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _518 = _500 + _516;
    float _520 = _514;
    if (!_432)
    {
        _468 = _426;
    }
    float _522 = _468;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[84].z, _462);
    int _526 = _498 ? 0 : 1;
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[83].z, _472);
    float _530 = _476 * _106;
    float _532 = _522;
    if (!_432)
    {
        _520 = _522;
    }
    float _534 = _520;
    float _536 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _524);
    float _538 = _534;
    if (_432)
    {
        _508 = _152;
    }
    float _540 = _508;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_432)
    {
        _532 = _420;
    }
    float _544 = _532;
    float _546 = exp2(_530);
    int _548 = ~_526;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _556 = _552;
    if (!_478)
    {
        int _558 = ~_526;
        int _560 = _558 + 1;
        _556 = _560;
    }
    int _562 = _556;
    float _564 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[83].w, _480);
    float _566 = _420 + _426;
    if (_432)
    {
        _538 = _420;
    }
    float _568 = _538;
    float _570 = -_542;
    float _572 = fma(_554, 2.0, _570);
    bool _574 = !_448;
    int _576 = _574 ? 0 : 1;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _580 = _568 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _582 = _566 + (-1.0);
    int _584 = abs(_576);
    float _586 = _426 * 2.0;
    float _588 = fma(_580, -2.0, _578);
    float _590 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _592 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _594 = float(_584);
    float _596 = -_546;
    float _598 = _596 + 1.0;
    float _600 = float(_562);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _604 = _592 + _602;
    float _606 = floor(_586);
    bool _608 = _512 > 0.0;
    float _610 = _594 * _600;
    float _612 = _604 * _604;
    float _614 = in.m_63.x;
    float _616 = in.m_63.y;
    float _618 = in.m_63.z;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _622 = 1.0 + _620;
    bool _624 = _512 >= 0.0;
    bool _626 = isnan(_512);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _636 = _506 + _634;
    float _638 = fma(_518, _518, _612);
    float _640 = 1.0 / _622;
    bool _642 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _650 = _646 || _648;
    float _652 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _564);
    float _654 = fma(_636, _636, _638);
    bool _656 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _664 = _660 || _662;
    float _666 = -_106;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[81].x, _572);
    int _670 = _632 ? 0 : 1;
    float _672 = _610 * (-2.0);
    float _674 = sqrt(_654);
    float _676 = _664 ? _598 : 0.0;
    float _678 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _588);
    bool _680 = _606 > 0.0;
    float _682 = fma(_590, _672, _590);
    bool _684 = _606 >= 0.0;
    bool _686 = isnan(_606);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _528);
    float _696 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_650)
    {
        float _698 = _676 * _640;
        _116 = _698;
    }
    float _700 = _116;
    int _702 = ~_670;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = rsqrt(_654);
    float _710 = fma(_672, _616, _616);
    int _712 = _692 ? 0 : 1;
    float _714 = _420 + (-0.5);
    int _716 = _706;
    if (!_608)
    {
        int _718 = ~_670;
        int _720 = _718 + 1;
        _716 = _720;
    }
    int _722 = _716;
    float _724 = _696 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _726 = !_452;
    int _728 = _726 ? 0 : 1;
    float _730 = _674 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _732 = !_444;
    int _734 = _732 ? 0 : 1;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    int _738 = ~_712;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    float _744 = _152 + _420;
    int _746 = _742;
    if (!_680)
    {
        int _748 = ~_712;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma(_682, _700, _736);
    int _756 = abs(_728);
    float _758 = _744 + (-1.0);
    int _760 = abs(_734);
    float _762 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _764 = precise::min(_724, _730);
    float _766 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _768 = float(_756);
    float _770 = float(_722);
    float _772 = _708 * _764;
    float _774 = float(_760);
    float _776 = float(_752);
    float _778 = _768 * _770;
    float _780 = _604 * _772;
    float _782 = _518 * _772;
    float _784 = _774 * _776;
    float _786 = -_780;
    float _788 = _604 + _786;
    float _790 = _754 * 0.15915493667125701904296875;
    float _792 = -_782;
    float _794 = _518 + _792;
    float _796 = _784 * (-2.0);
    float _798 = _788 * _788;
    float _800 = _636 * _772;
    float _802 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _804 = fma(_796, _614, _614);
    float _806 = _152 + (-0.5);
    float _808 = fma(_794, _794, _798);
    float _810 = -_800;
    float _812 = _636 + _810;
    float _814 = fma(_802, _796, _802);
    float _816 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].x, _804);
    float _818 = _152 + _426;
    float _820 = fma(_812, _812, _808);
    float _822 = _778 * (-2.0);
    float _824 = fma(_814, _700, _816);
    float _826 = _818 + (-1.0);
    float _828 = _790 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_822, _618, _618);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = in.m_65.x;
    float _838 = in.m_65.y;
    float _840 = in.m_65.z;
    float _842 = fma(_834, _822, _834);
    float _844 = _790 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = sqrt(_820);
    float _850 = _824 * 0.15915493667125701904296875;
    float _852 = _426 + (-0.5);
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].z, _832);
    float _856 = _850 * 6.283185482025146484375;
    float _858 = sin(_856);
    float _860 = fma(_842, _700, _854);
    float _862 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _836);
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _840);
    float _866 = _860 * 0.15915493667125701904296875;
    float _868 = _850 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = _708 * _848;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _838);
    float _876 = _762 * _872;
    float _878 = _696 * _872;
    float _880 = _766 * _872;
    float _882 = _866 * 6.283185482025146484375;
    float _884 = cos(_882);
    float _886 = _876 * _874;
    float _888 = _858 * _830;
    float _890 = _878 * _862;
    float _892 = _880 * _864;
    float _894 = _866 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _870 * _846;
    float _900 = _870 * _830;
    float _902 = _884 * _886;
    float _904 = _830 * _884;
    float _906 = _846 * _884;
    float _908 = _858 * _846;
    float _910 = _870 * _902;
    float _912 = _858 * _902;
    float _914 = fma(_896, _898, _888);
    float _916 = -_886;
    float _918 = _896 * _916;
    float _920 = fma(_896, _888, _898);
    float _922 = fma(_914, _890, _910);
    float _924 = -_908;
    float _926 = fma(_896, _900, _924);
    float _928 = -_900;
    float _930 = fma(_896, _908, _928);
    float _932 = fma(_906, _890, _918);
    float _934 = fma(_926, _892, _922);
    float _936 = fma(_930, _890, _912);
    float _938 = fma(_904, _892, _932);
    float _940 = _934 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _942 = fma(_920, _892, _936);
    float _944 = _934 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].x, _940);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].x, _944);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].z, _946);
    float _952 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _954 = _950 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _956 = _952 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _958 = _506 + _954;
    float _960 = _500 + _956;
    float _962 = _934 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _966 = _958 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _970 = _960 + _968;
    float _972 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _962);
    float _974 = _966 * _966;
    float _976 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].z, _972);
    float _978 = fma(_970, _970, _974);
    float _980 = _976 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _982 = sqrt(_978);
    float _984 = _592 + _980;
    bool _986 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _934;
    float _990 = _974;
    float _992 = _942;
    if (!_986)
    {
        _988 = _960;
    }
    float _994 = _988;
    float _996 = _994;
    if (!_986)
    {
        _990 = _958;
    }
    float _998 = _990;
    float _1000 = _998;
    if (!_986)
    {
        _992 = _984;
    }
    float _1002 = _992;
    bool _1004 = !_986;
    float _1006 = _1002;
    if (!_1004)
    {
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1010 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1012 = _982 + _1010;
        float _1014 = _984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1016 = rsqrt(_978);
        float _1018 = _1012 * _1008;
        float _1020 = _1018 * 0.15915493667125701904296875;
        float _1022 = _1020 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 + (-1.0);
        float _1032 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = fma(_1028, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = fma(_984, _1024, _1032);
        float _1038 = _1016 * _1034;
        float _1040 = fma(_970, _1038, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_966, _1038, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1006 = _1036;
        _996 = _1040;
        _1000 = _1042;
    }
    float _1044 = _1006;
    float _1046 = _996;
    float _1048 = _1000;
    float _1050 = -_780;
    float _1052 = _1050 + _1044;
    float _1054 = -_782;
    float _1056 = _1054 + _1046;
    float _1058 = -_800;
    float _1060 = _1058 + _1048;
    float _1062 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1066 = _1052 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1056 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1078 = _1066 * _1066;
    float _1080 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1076);
    float _1082 = fma(_1070, _1070, _1078);
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1080);
    float _1086 = fma(_1074, _1074, _1082);
    float _1088 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1090 = rsqrt(_1086);
    float _1092 = sqrt(_1086);
    float _1094 = _1090 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1096 = _1070 * _1094;
    float _1098 = _1074 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 + _1102;
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = _1106 + _1110;
    float _1114 = _1074;
    float _1116 = _1104;
    float _1118 = _1112;
    float _1120 = _1078;
    float _1122 = _1094;
    if (_1108)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1124;
    }
    float _1126 = _1114;
    if (_1108)
    {
        float _1128 = rsqrt(_1104);
        _1116 = _1128;
    }
    float _1130 = _1116;
    float _1132 = _1130;
    if (_1108)
    {
        float _1134 = _1112 * _1126;
        _1118 = _1134;
    }
    float _1136 = _1118;
    if (_1108)
    {
        float _1138 = _1136 * 0.15915493667125701904296875;
        _1120 = _1138;
    }
    float _1140 = _1120;
    float _1142 = _1126;
    float _1144 = _1140;
    if (_1108)
    {
        float _1146 = _1140 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        _1142 = _1148;
    }
    float _1150 = _1142;
    float _1152 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1154 = precise::max(0.0, _1152);
    float _1156 = _966;
    float _1158 = _1154;
    if (_1108)
    {
        float _1160 = _1140 * 6.283185482025146484375;
        float _1162 = cos(_1160);
        _1156 = _1162;
    }
    float _1164 = _1156;
    float _1166 = -_1094;
    float _1168 = -_1154;
    float _1170 = fma(_1066, _1166, _1168);
    float _1172 = _1170;
    if (_1108)
    {
        float _1174 = _1170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1174;
    }
    float _1176 = _1158;
    float _1178 = _1150;
    float _1180 = _1176;
    if (_1108)
    {
        float _1182 = fma(_1150, _1176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1178 = _1182;
    }
    float _1184 = _1178;
    float _1186 = _1184;
    float _1188 = _1164;
    if (_1108)
    {
        float _1190 = _1164 + (-1.0);
        _1180 = _1190;
    }
    float _1192 = _1180;
    float _1194 = _1192;
    if (_1108)
    {
        float _1196 = _1130 * _1184;
        _1122 = _1196;
    }
    float _1198 = _1122;
    if (!_1108)
    {
        _1186 = _1096;
    }
    float _1200 = _1186;
    float _1202 = _1200;
    if (_1108)
    {
        float _1204 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1204;
    }
    float _1206 = _1144;
    if (_1108)
    {
        float _1208 = _1096 * _1198;
        _1202 = _1208;
    }
    float _1210 = _1202;
    if (!_1108)
    {
        _1194 = _1098;
    }
    float _1212 = _1194;
    float _1214 = _1212;
    if (_1108)
    {
        float _1216 = _1098 * _1198;
        _1214 = _1216;
    }
    float _1218 = _1214;
    if (!_1108)
    {
        _1132 = _1100;
    }
    float _1220 = _1132;
    float _1222 = _1220;
    if (_1108)
    {
        float _1224 = fma(_1170, _1164, _1206);
        _1172 = _1224;
    }
    float _1226 = _1172;
    if (_1108)
    {
        float _1228 = _1210 * _1210;
        _1222 = _1228;
    }
    float _1230 = _1222;
    if (!_1108)
    {
        _1188 = _1102;
    }
    float _1232 = _1188;
    float _1234 = _1232;
    if (_1108)
    {
        float _1236 = _1218 * _1218;
        _1234 = _1236;
    }
    float _1238 = _1234;
    float _1240 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1242 = fma(_1226, _1226, _1230);
    float _1244 = _1242 + _1238;
    float _1246 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1240);
    float _1248 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1246);
    float _1258 = rsqrt(_1244);
    float _1260 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1248);
    float _1262 = -_1254;
    float _1264 = _1262 + 1.0;
    float _1266 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1268 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1274 = abs(_1264);
    float _1276 = log2(_1274);
    float _1278 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1280 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1282 = -_1272;
    float _1284 = fma(_1282, _1062, 1.0);
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1288 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1280);
    float _1290 = _1258 * _1210;
    float _1292 = _1258 * _1226;
    float _1294 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1286);
    float _1296 = _1258 * _1218;
    float _1298 = _1290 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1300 = _1288 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1302 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1294);
    float _1304 = log2(_1284);
    float _1306 = -_1298;
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1306);
    float _1310 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1302);
    float _1314 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1316 = -_1296;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1308);
    float _1320 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = _1292 + 1.0;
    float _1324 = 1.0 / _1312;
    float _1326 = fma(_1318, -0.5, 0.5);
    float _1328 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1318, 0.5, 0.5);
    float _1332 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1314);
    float _1334 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1336 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1338 = exp2(_1310);
    float _1340 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1332);
    float _1342 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1334);
    float _1344 = fma(_1330, _1336, -0.212114393711090087890625);
    float _1346 = _1304 * 0.693147182464599609375;
    float _1348 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1340);
    float _1350 = fma(_1330, _1344, 1.570728778839111328125);
    float _1352 = sqrt(_1326);
    float _1354 = _1342 * _1324;
    float _1356 = _1348 * _1324;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1360 = fma(_1354, 0.5, 0.5);
    float _1362 = fma(_1356, -0.5, 0.5);
    float _1364 = -_1292;
    float _1366 = fma(_1338, _1322, _1364);
    float3 _3723 = float3(_1360, _1362, _1358);
    float _1368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3723, float3(0.0), isnan(_3723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3723, float3(0.0), isnan(_3723)), level(0.0)).x;
    float _1370 = fma(_1366, 0.5, 0.5);
    float _1372 = _1352 * 0.636619746685028076171875;
    float _1374 = -_1350;
    float _1376 = fma(_1372, _1374, 1.0);
    float3 _3744 = float3(_1360, _1362, _1358);
    float4 _1379 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3744, float3(0.0), isnan(_3744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3744, float3(0.0), isnan(_3744)), level(0.0)).xyzw;
    float _1381 = _1379.x;
    float _1383 = _1379.y;
    float _1385 = _1379.z;
    float _1387 = _1379.w;
    float2 _3761 = float2(_1376, _1370);
    float3 _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1393 = _1391.x;
    float _1395 = _1391.y;
    float _1397 = _1391.z;
    float _1399 = in.m_53.w;
    float _1401 = _536 * (-0.15915493667125701904296875);
    float _1403 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1407 = _1405 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1409 = _1401 * 6.283185482025146484375;
    float _1411 = sin(_1409);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1419 = _1417 != 0;
    float _1421 = -_282;
    float _1423 = _1421 + 1.0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1427 = _1425 != 0;
    float _1429 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1431 = -_780;
    float _1433 = _592 + _1431;
    float _1435 = 1.0 / _1407;
    bool _1437 = _426 > 0.5;
    bool _1439 = _1437 && _1427;
    float _1441 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1429);
    bool _1443 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1445 = isnan(_418);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1451 = _1447 || _1449;
    float _1453 = float(_1451);
    float _1455 = -_800;
    float _1457 = _506 + _1455;
    float _1459 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_67.x = _1056;
    out.m_67.y = _1052;
    out.m_67.z = _1060;
    float _1461 = 1.0 / _1415;
    bool _1463 = _1399 > 0.5;
    float _1465 = -_1453;
    float _1467 = _1465 + 1.0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1469;
    if (_1419)
    {
        float _1473 = _1463 ? _1423 : _282;
        _400 = _1473;
    }
    float _1475 = _400;
    float _1477 = _1459 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.w = _764;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1491 = _418 + _1489;
    float _1493 = _1481 * _1435;
    float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    out.m_71.x = _878;
    float _1499 = _1485 * _1461;
    bool _1501 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1503 = isnan(_418);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1515 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1517 = isnan(_418);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1523 = _1519 || _1521;
    float _1525 = float(_1523);
    out.m_51.x = _1477;
    float _1527 = _1511 * _1467;
    bool _1529 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1531 = isnan(_418);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1537 = _1533 || _1535;
    float _1539 = float(_1537);
    float _1541 = -_1525;
    float _1543 = _1541 + 1.0;
    float _1545 = -_1511;
    float _1547 = _1545 + 1.0;
    float _1549 = 1.0 / _1497;
    float _1551 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1553 = _1539 * _1543;
    float _1555 = _1525 * _1547;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1559 = _418 + _1557;
    float _1561 = -_1539;
    float _1563 = _1561 + 1.0;
    float _1565 = fma(_1551, _1475, -0.5);
    float _1567 = exp2(_1403);
    float _1569 = fma(_1493, _1491, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1571 = _1491;
    if (!_1427)
    {
        _1571 = _272;
    }
    float _1573 = _1571;
    float _1575 = _1573;
    if (_1439)
    {
        float _1577 = -_272;
        float _1579 = _1577 + 1.0;
        _402 = _1579;
    }
    float _1581 = _402;
    float _1583 = fma(_1499, _1559, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1585 = _1569 * _1553;
    float _1587 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1589 = _1401 * 6.283185482025146484375;
    float _1591 = cos(_1589);
    if (_1427)
    {
        _1575 = _1581;
    }
    float _1593 = _1575;
    float _1595 = _1471 * _1549;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1599 = _418 + _1597;
    float _1601 = fma(_1563, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1585);
    float _1603 = _1411 * _1565;
    float _1605 = fma(_1587, _1593, -0.5);
    float _1607 = fma(_1595, _1599, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1609 = fma(_1583, _1555, _1601);
    float _1611 = -_1567;
    float _1613 = _1611 + 1.0;
    float _1615 = fma(_1607, _1527, _1609);
    float _1617 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1619 = _1591 * _1565;
    float _1621 = -_1603;
    float _1623 = fma(_1591, _1605, _1621);
    float _1625 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1615);
    float _1627 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1441);
    float _1629 = fma(_1411, _1605, _1619);
    float _1631 = fma(_694, _1623, _668);
    float _1633 = -_782;
    float _1635 = _500 + _1633;
    float _1637 = -_678;
    float _1639 = fma(_652, _1629, _1637);
    float _1641 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1643 = _1639 + 0.5;
    float _1645 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1627);
    out.m_73.x = _1635;
    out.m_73.y = _1433;
    out.m_73.z = _1457;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1653 = _1645 + _1312;
    float _1655 = _1342 + _1312;
    float _1657 = _1312 * 0.5;
    float _1659 = _1631 + 0.5;
    float _1661 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1665 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1667 = -_1617;
    float _1669 = _1667 + 1.0;
    float _1671 = _1653 * 0.5;
    float _1673 = _1655 * 0.5;
    float _1675 = fma(_1348, -0.5, _1657);
    out.m_75.x = _1661;
    out.m_75.y = _1663;
    out.m_75.z = _1665;
    out.m_75.w = _1641;
    out.m_77.z = _1659;
    out.m_77.w = _1643;
    out.gl_Position.x = _1342;
    out.gl_Position.y = _1348;
    out.gl_Position.z = _1645;
    out.gl_Position.w = _1312;
    out.m_79.x = _1673;
    out.m_79.y = _1675;
    out.m_79.z = _1671;
    out.m_79.w = _1312;
    float _1677 = _1617 * _1368;
    float _1679 = _1387 * _1677;
    float _1681 = _1397 * _1677;
    float _1683 = fma(_1393, _1679, _1381);
    float _1685 = fma(_1395, _1679, _1383);
    float _1687 = _1387 * _1669;
    float _1689 = fma(_1387, _1681, _1385);
    out.m_81.x = _1683;
    out.m_81.y = _1685;
    out.m_81.z = _1689;
    out.m_81.w = _1687;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

