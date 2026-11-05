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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_59 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1772 = false;
    bool _672 = false;
    bool _580 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2538 = as_type<float>(_108);
        out.gl_Position.z = _2538;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2608 = as_type<float>(_146);
        out.gl_Position.z = _2608;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_53.w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _150;
    if (!_162)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_55.w = _148;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _152, _170);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_57.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_92);
        float _296 = 1.0 / _294;
        float _298 = _126 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _300 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = 1.0 / _320;
    float _332 = 1.0 / _316;
    bool _334 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_300);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _328;
    float _350 = _308 * _330;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    bool _356 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_300);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = 1.0 / _324;
    float _370 = _304 * _332;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _300 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -_366;
    float _382 = _380 + 1.0;
    float _384 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = _374 * _348;
    bool _388 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_300);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _398 * _354;
    float _406 = _312 * _368;
    bool _408 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _410 = isnan(_300);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_398;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _424;
    float _428 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = _418 * _422;
    float _432 = -_418;
    float _434 = _432 + 1.0;
    float _436 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _438 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _440 = isnan(_300);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = _366 * _434;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _464 = _448 * _382;
    float _466 = fma(_452, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_458, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _470 = fma(_462, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _472 = _436 * _464;
    float _474 = _384 * _464;
    float _476 = _428 * _464;
    float _478 = -_448;
    float _480 = _478 + 1.0;
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_53.z;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _498 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _500;
    float _504 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _506 = fma(_490, _406, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _508 = fma(_470, _454, _496);
    float _510 = fma(_466, _454, _498);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _520 = fma(_494, _406, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_502, _406, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _528 = fma(_468, _454, _504);
    float _530 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _532 = fma(_518, _386, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _534 = fma(_526, _386, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _536 = fma(_506, _430, _528);
    float _538 = fma(_522, _430, _508);
    float _540 = fma(_520, _430, _510);
    float _542 = fma(_534, _404, _536);
    float _544 = fma(_532, _404, _538);
    float _546 = fma(_530, _404, _540);
    float _548 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _542);
    float _550 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _544);
    float _552 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _546);
    float _554 = _548 * _486;
    float _556 = _550 * _484;
    float _558 = _552 * _482;
    bool _560 = !_346;
    float _578;
    if (!_560)
    {
        float _562 = in.m_57.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_92);
        float _584 = 1.0 / _582;
        float _586 = _126 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = _642 * _634;
    float _646 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _648 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _646);
    float _650 = _648 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _650;
    bool _652 = !_630;
    float _670;
    if (!_652)
    {
        float _654 = in.m_57.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_92);
        float _676 = 1.0 / _674;
        float _678 = _126 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = in.m_57.z;
    float _684 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _686 = in.m_57.x;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _690 = _688 != 0;
    float _692 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _696 = _694 != 0;
    float _698 = in.m_57.y;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _702 = _700 != 0;
    float _704 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = in.m_51.y;
    float _708 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _684);
    float _710 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _712 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _692);
    float _714 = in.m_57.w;
    float _716 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _708);
    float _718 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _712);
    float _720 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _710);
    float _722 = _716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _726 = _682 * 2.0;
    bool _728 = _682 > 0.5;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _732 = _686 * 2.0;
    float _734 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _736 = floor(_726);
    float _738 = _698 * 2.0;
    bool _740 = _698 > 0.5;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _744 = -_706;
    float _746 = _744 + 1.0;
    float _748 = floor(_732);
    float _750 = _718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _752 = _740 ? as_type<int>(_746) : as_type<int>(_706);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _756 = _714 > 0.5;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _760 = _728 ? as_type<int>(_746) : as_type<int>(_706);
    float _762 = floor(_738);
    float _764 = _696 ? as_type<float>(_752) : _706;
    float _766 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _768 = _736 > 0.0;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _772 = _702 ? as_type<float>(_760) : _706;
    float _774 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[88].w, _754);
    float _776 = _706;
    if (_690)
    {
        float _778 = _756 ? _746 : _706;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_766, -2.0, _758);
    bool _784 = _736 >= 0.0;
    bool _786 = isnan(_736);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _796 = _748 > 0.0;
    float _798 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _782);
    bool _800 = _748 >= 0.0;
    bool _802 = isnan(_748);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _812 = in.m_61.x;
    float _814 = in.m_61.y;
    float _816 = in.m_61.z;
    bool _818 = _762 > 0.0;
    int _820 = _792 ? 0 : 1;
    bool _822 = _762 >= 0.0;
    bool _824 = isnan(_762);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    int _832 = ~_820;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    int _838 = _808 ? 0 : 1;
    int _840 = _830 ? 0 : 1;
    int _842 = _836;
    if (!_768)
    {
        int _844 = ~_820;
        int _846 = _844 + 1;
        _842 = _846;
    }
    int _848 = _842;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    int _862 = ~_840;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = _866;
    if (!_818)
    {
        int _870 = ~_840;
        int _872 = _870 + 1;
        _868 = _872;
    }
    int _874 = _868;
    bool _876 = !_856;
    int _878 = _876 ? 0 : 1;
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _812);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _884 = _882 != 0;
    float _886 = _698 + _682;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _814);
    int _890 = ~_838;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = _886 + (-1.0);
    int _898 = _894;
    float _900 = _886;
    if (!_796)
    {
        int _902 = ~_838;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _910 = !_852;
    int _912 = _910 ? 0 : 1;
    float _914 = _686 + _698;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _918 = _916 != 0;
    float _920 = -_908;
    float _922 = fma(_734, 2.0, _920);
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _926 = _924 != 0;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _932 = _930 != 0;
    float _934 = _914 + (-1.0);
    float _936 = _810 * _888;
    float _938 = _934;
    if (_884)
    {
        _900 = _686;
    }
    float _940 = _900;
    float _942 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _944 = _940;
    if (!_884)
    {
        _944 = _682;
    }
    float _946 = _944;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _950 = abs(_912);
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _954 = _946;
    if (!_884)
    {
        _954 = _682;
    }
    float _956 = _954;
    float _958 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _960 = _956;
    if (!_884)
    {
        _938 = _698;
    }
    float _962 = _938;
    float _964 = -_948;
    float _966 = fma(_952, 2.0, _964);
    float _968 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _970 = log2(_968);
    float _972 = _962;
    if (_884)
    {
        _960 = _698;
    }
    float _974 = _960;
    if (_884)
    {
        _972 = _686;
    }
    float _976 = _972;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _980 = float(_874);
    int _982 = abs(_878);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[83].w, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[83].z, _724);
    bool _988 = !_860;
    float _990 = _988 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _992 = _976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _994 = float(_950);
    float _996 = -_126;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    int _1000 = abs(as_type<int>(_990));
    float _1002 = -_730;
    float _1004 = fma(_992, 2.0, _1002);
    float _1006 = _990;
    float _1008 = _992;
    if (_884)
    {
        _1006 = _698;
    }
    float _1010 = _1006;
    float _1012 = _970 * _126;
    float _1014 = _1010;
    if (!_884)
    {
        _1008 = _682;
    }
    float _1016 = _1008;
    float _1018 = -_126;
    float _1020 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1004);
    float _1022 = _1016;
    if (!_884)
    {
        _1014 = _686;
    }
    float _1024 = _1014;
    float _1026 = -_750;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_884)
    {
        _1022 = _698;
    }
    float _1030 = _1022;
    float _1032 = exp2(_1012);
    float _1034 = float(_982);
    float _1036 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1038 = float(_848);
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1042 = float(_1000);
    float _1044 = fma(_1036, -2.0, _770);
    float _1046 = float(_906);
    float _1048 = fma(_1040, -2.0, _742);
    float _1050 = _994 * _1038;
    bool _1052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(1.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = in.m_63.x;
    float _1064 = in.m_63.y;
    float _1066 = in.m_63.z;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1070 = 1.0 + _1068;
    float _1072 = _1034 * _1046;
    float _1074 = _1042 * _980;
    float _1076 = 1.0 / _1070;
    float _1078 = -_1032;
    float _1080 = _1078 + 1.0;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1084 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1092 = _1088 || _1090;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1098 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1082);
    float _1100 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1094);
    float _1102 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _984);
    float _1104 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1096);
    float _1106 = _1092 ? _1080 : 0.0;
    float _1108 = -_722;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1112 = _1028 * _1028;
    float _1114 = -_126;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[86].x, _966);
    float _1118 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1098);
    float _1120 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1048);
    float _1122 = _1050 * (-2.0);
    float _1124 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _774);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1130 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1132 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1100);
    float _1134 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1136 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1044);
    float _1138 = -_794;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = fma(_1110, _1110, _1112);
    bool _1144 = _1092;
    if (_1060)
    {
        float _1146 = _1106 * _1076;
        _128 = _1146;
    }
    float _1148 = _128;
    float _1150 = _686 + (-0.5);
    float _1152 = fma(_1122, _1062, _1062);
    float _1154 = fma(_958, _1122, _958);
    float _1156 = fma(_1140, _1140, _1142);
    float _1158 = _1072 * (-2.0);
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    if (_918)
    {
        bool _1162 = _686 > 0.5;
        _1144 = _1162;
    }
    bool _1164 = _1144;
    float _1166 = _686 + _682;
    float _1168 = fma(_1158, _1064, _1064);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1174 = fma(_1154, _1148, _1160);
    float _1176 = rsqrt(_1156);
    float _1178 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1180 = _1166 + (-1.0);
    float _1182 = _1074 * (-2.0);
    float _1184 = _698 + (-0.5);
    float _1186 = _1178 * _880;
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1190 = 1.0 / _1172;
    float _1192 = fma(_1182, _1066, _1066);
    float _1194 = _682 + (-0.5);
    float _1196 = fma(_942, _1158, _942);
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    float _1200 = fma(_1188, _1182, _1188);
    float _1202 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1192);
    float _1204 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1206 = fma(_1196, _1148, _1198);
    float _1208 = fma(_1200, _1148, _1202);
    float _1210 = _1204 * _928;
    float _1212 = _1110 * _1176;
    float _1214 = _1140 * _1176;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1222 = _1212 * _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1228 = _1218 * _1190;
    float _1230 = _1028 * _1176;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1234 = _1214 * _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1238 = -_1222;
    float _1240 = fma(_1214, _1236, _1238);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1246 = 1.0 / _1128;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1250 = _1230 * _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1254 = -_1234;
    float _1256 = fma(_1230, _1252, _1254);
    float _1258 = _1240 * _1240;
    float _1260 = _1174 * 0.15915493667125701904296875;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = -_1250;
    float _1266 = fma(_1212, _1262, _1264);
    float _1268 = fma(_1256, _1256, _1258);
    float _1270 = 1.0 / _1244;
    float _1272 = _1208 * 0.15915493667125701904296875;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1276 = _680 + _1274;
    float _1278 = fma(_1266, _1266, _1268);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1280;
    float _1284 = _1260 * 6.283185482025146484375;
    float _1286 = sin(_1284);
    float _1288 = _1206 * 0.15915493667125701904296875;
    float _1290 = _1282 * _1246;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1294 = _680 + _1292;
    float _1296 = fma(_1228, _1294, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1298 = _1260 * 6.283185482025146484375;
    float _1300 = cos(_1298);
    float _1302 = _1226 * _1270;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1306 = _680 + _1304;
    float _1308 = fma(_1302, _1276, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1310 = fma(_1290, _1306, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1312 = _1288 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1288 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1272 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1300 * _1314;
    float _1326 = _1286 * _1314;
    float _1328 = _1272 * 6.283185482025146484375;
    float _1330 = sin(_1328);
    float _1332 = _1286 * _1318;
    float _1334 = _1300 * _1318;
    float _1336 = rsqrt(_1278);
    float _1338 = _1318 * _1322;
    float _1340 = _1322 * _936;
    float _1342 = _1314 * _1322;
    float _1344 = -_936;
    float _1346 = _1330 * _1344;
    float _1348 = -_1324;
    float _1350 = fma(_1330, _1332, _1348);
    float _1352 = -_1332;
    float _1354 = fma(_1330, _1324, _1352);
    float _1356 = fma(_1330, _1334, _1326);
    float _1358 = fma(_1338, _1186, _1346);
    float _1360 = _1300 * _1340;
    float _1362 = fma(_1330, _1326, _1334);
    float _1364 = _1286 * _1340;
    float _1366 = _1256 * _1336;
    float _1368 = _1240 * _1336;
    float _1370 = _1266 * _1336;
    float _1372 = fma(_1356, _1186, _1360);
    float _1374 = _1230 * _1366;
    float _1376 = _1214 * _1368;
    float _1378 = fma(_1350, _1186, _1364);
    float _1380 = fma(_1354, _1210, _1372);
    float _1382 = -_1374;
    float _1384 = fma(_1212, _1368, _1382);
    float _1386 = -_1376;
    float _1388 = fma(_1230, _1370, _1386);
    float _1390 = fma(_1342, _1210, _1358);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1384 * _1380;
    float _1396 = _1388 * _1380;
    float _1398 = fma(_1362, _1210, _1378);
    float _1400 = in.m_51.x;
    float _1402 = fma(_1370, _1390, _1394);
    float _1404 = fma(_1366, _1390, _1396);
    bool _1406 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1408 = isnan(_680);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1212 * _1370;
    float _1420 = fma(_1214, _1398, _1402);
    float _1422 = fma(_1212, _1398, _1404);
    bool _1424 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1426 = isnan(_680);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1438 = _794 + _1420;
    float _1440 = _722 + _1422;
    bool _1442 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1444 = isnan(_680);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    float _1454 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1458 = _1438 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1462 = _1440 + _1460;
    float _1464 = -_1416;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1454, _764, -0.5);
    float _1470 = _1458 * _1458;
    float _1472 = _1462 * _1462;
    bool _1474 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1476 = isnan(_680);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = _1434 * _1466;
    float _1488 = -_1434;
    float _1490 = _1488 + 1.0;
    float _1492 = _1472 + _1470;
    float _1494 = -_1418;
    float _1496 = fma(_1214, _1366, _1494);
    int _1498 = as_type<int>(_1212);
    int _1500 = as_type<int>(_1468);
    int _1502 = as_type<int>(_1296);
    float _1504 = _1400;
    float _1506 = _1230;
    float _1508 = _1472;
    float _1510 = _1470;
    float _1512 = _1438;
    float _1514 = _1440;
    if (_918)
    {
        float _1516 = -_1400;
        float _1518 = _1516 + 1.0;
        _1498 = as_type<int>(_1518);
    }
    int _1520 = _1498;
    float _1522 = _1452 * _1490;
    float _1524 = sqrt(_1492);
    float _1526 = -_1452;
    float _1528 = _1526 + 1.0;
    float _1530 = -_798;
    float _1532 = fma(_1118, _1468, _1530);
    float _1534 = _1496 * _1380;
    float _1536 = _1528;
    float _1538 = as_type<float>(_1520);
    if (_932)
    {
        float _1540 = -_1400;
        float _1542 = _1540 + 1.0;
        _1500 = as_type<int>(_1542);
    }
    int _1544 = _1500;
    float _1546 = _1484 * _1528;
    if (!_918)
    {
        _1536 = _1400;
    }
    float _1548 = _1536;
    float _1550 = fma(_1368, _1390, _1534);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1554 = _1548;
    if (_918)
    {
        float _1556 = _1164 ? as_type<float>(_1520) : _1400;
        _1554 = _1556;
    }
    float _1558 = _1554;
    float _1560 = _1296 * _1546;
    if (_926)
    {
        float _1562 = -_1400;
        float _1564 = _1562 + 1.0;
        _1502 = as_type<int>(_1564);
    }
    int _1566 = _1502;
    float _1568 = fma(_1230, _1398, _1550);
    float _1570 = -_1484;
    float _1572 = _1570 + 1.0;
    if (!_926)
    {
        _1538 = _1400;
    }
    float _1574 = _1538;
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1578 = _1524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1560);
    float _1582 = _1574;
    if (_926)
    {
        float _1584 = _728 ? as_type<float>(_1566) : _1400;
        _1582 = _1584;
    }
    float _1586 = _1582;
    float _1588 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1590 = _750 + _1568;
    if (_932)
    {
        float _1592 = _740 ? as_type<float>(_1544) : _1400;
        _1504 = _1592;
    }
    float _1594 = _1504;
    float _1596 = fma(_1308, _1522, _1580);
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1600 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1602 = fma(_1588, _1558, -0.5);
    float _1604 = fma(_1600, _780, -0.5);
    if (!_1578)
    {
        _1506 = _1590;
    }
    float _1606 = _1506;
    float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1610 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1612 = fma(_772, _1610, -0.5);
    float _1614 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1618 = !_1578;
    float _1620 = _1606;
    if (!_1618)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1626 = _1524 + _1624;
        float _1628 = rsqrt(_1492);
        float _1630 = _1626 * _1622;
        float _1632 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * 0.15915493667125701904296875;
        float _1636 = _1634 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1646 = _1628 * _1644;
        float _1648 = _1642 + (-1.0);
        float _1650 = fma(_1462, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1652 = fma(_1458, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1658 = _1650 + _1656;
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1662 = _1652 + _1660;
        float _1664 = fma(_1590, _1642, _1654);
        float _1666 = _1658 * _1658;
        float _1668 = _1662 * _1662;
        _1620 = _1664;
        _1508 = _1666;
        _1510 = _1668;
        _1512 = _1652;
        _1514 = _1650;
    }
    float _1670 = _1620;
    float _1672 = _1508;
    float _1674 = _1510;
    float _1676 = _1512;
    float _1678 = _1514;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1682 = _1670 + _1680;
    float _1684 = fma(_1614, _1586, -0.5);
    float _1686 = fma(_1616, _1594, -0.5);
    float _1688 = fma(_1310, _1486, _1596);
    float _1690 = fma(_1682, _1682, _1672);
    float _1692 = fma(_1130, _1602, _998);
    float _1694 = fma(_1134, _1684, _1020);
    float _1696 = fma(_1132, _1686, _1116);
    float _1698 = _1690 + _1674;
    float _1700 = -_1120;
    float _1702 = fma(_1102, _1604, _1700);
    float _1704 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1688);
    float _1706 = -_1136;
    float _1708 = fma(_1124, _1612, _1706);
    float _1710 = _1692 + 0.5;
    float _1712 = _1532 + 0.5;
    float _1714 = sqrt(_1698);
    float _1716 = _1696 + 0.5;
    float _1718 = _1694 + 0.5;
    float _1720 = _1702 + 0.5;
    float _1722 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1724 = _1708 + 0.5;
    out.m_65.x = _1710;
    out.m_65.y = _1712;
    out.m_65.z = _1718;
    out.m_65.w = _1720;
    out.m_67.w = _1722;
    out.m_69.x = _1716;
    out.m_69.y = _1724;
    bool _1726 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1728 = isnan(_1714);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1734 = _1730 || _1732;
    float _1736 = _1694;
    if (!_1734)
    {
        _1736 = 1.0;
    }
    float _1738 = _1736;
    bool _1740 = !_1734;
    float _1742 = _1738;
    if (!_1740)
    {
        bool _1744 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1746 = isnan(_1714);
        bool _1748 = _1744 || _1746;
        bool _1750 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1752 = _1748 || _1750;
        if (!_1752)
        {
            float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1756 = _1714 + _1754;
            float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1760 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1766 = 1.0 / _1760;
            float _1768 = _1756 * _1766;
            float _1770 = fma(_1768, _1764, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1742 = _1770;
            _1772 = true;
        }
        else
        {
            bool _1774 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1776 = isnan(_1714);
            bool _1778 = _1774 || _1776;
            bool _1780 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1782 = _1778 || _1780;
            if (!_1782)
            {
                float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1786 = _1714 + _1784;
                float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1790 = _1788 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1794 = _1792 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1796 = 1.0 / _1790;
                float _1798 = _1786 * _1796;
                float _1800 = fma(_1798, _1794, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1742 = _1800;
                _1772 = true;
            }
            else
            {
                _1742 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1772 = false;
    float _1802 = _1742;
    float _1804 = _750 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1808 = _1670 + _1806;
    float _1810 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1804);
    float _1812 = _750 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1814 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1810);
    bool _1816 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(0.5);
    bool _1824 = _1820 || _1822;
    bool _1826 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(0.5);
    bool _1834 = _1830 || _1832;
    float _1836 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1838 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1812);
    float _1840 = fma(_1808, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1842 = 1.0 / _1836;
    float _1844 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1838);
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1848 = _1846 + _1836;
    float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1852 = _1676 + _1850;
    float _1854 = fma(_1852, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1856 = _1852;
    float _1858 = _1808;
    float _1860 = _1802;
    float _1862 = _1840;
    float _1864 = _1854;
    if (_1834)
    {
        _1856 = 1.0;
    }
    float _1866 = _1856;
    float _1868 = _1848 * _1842;
    float _1870 = _1868 * 0.5;
    float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1874 = _1678 + _1872;
    float _1876 = _1870;
    float _1878 = _1866;
    if (_1824)
    {
        _1858 = _1854;
    }
    float _1880 = _1858;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1882);
    float _1886 = fma(_1874, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1888 = _1880;
    float _1890 = _1886;
    if (_1824)
    {
        _1876 = _1840;
    }
    float _1892 = _1876;
    float _1894 = 1.0 / _1884;
    float _1896 = _1892;
    if (_1824)
    {
        _1860 = _1886;
    }
    float _1898 = _1860;
    float _1900 = _1898;
    if (!_1824)
    {
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1904 = _750 + _1902;
        float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1908 = _722 + _1906;
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1912 = _1904 * _1904;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _794 + _1914;
        float _1918 = fma(_1908, _1908, _1912);
        float _1920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1922 = fma(_1916, _1916, _1918);
        float _1924 = sqrt(_1922);
        float _1926 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1928 = precise::min(_1924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1930 = _1928 * _1920;
        float _1932 = -_750;
        float _1934 = _1932 + _1840;
        float _1936 = -_722;
        float _1938 = _1936 + _1886;
        float _1940 = -_794;
        float _1942 = _1940 + _1854;
        float _1944 = _1926 * _1930;
        float _1946 = fma(_1938, _1944, _722);
        float _1948 = fma(_1934, _1944, _750);
        float _1950 = fma(_1942, _1944, _794);
        _1896 = _1948;
        _1900 = _1946;
        _1888 = _1950;
        _1862 = _1942;
    }
    float _1952 = _1896;
    float _1954 = _1900;
    float _1956 = _1888;
    float _1958 = _1862;
    float _1960 = _1958;
    if (_1834)
    {
        _1960 = 1.0;
    }
    float _1962 = _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1966 = _1894 * _1964;
    float _1968 = _1962;
    float _1970 = _1966;
    if (!_1834)
    {
        float _1972 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1974 = _1972 * 0.15915493667125701904296875;
        float _1976 = _1974 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1982 = _1980 * 0.15915493667125701904296875;
        float _1984 = _1974 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        float _1988 = 1.0 / _1978;
        float _1990 = _1982 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = _1986 * _1988;
        float _1996 = _1982 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2002 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2000;
        float _2004 = _1992 * _1994;
        float _2006 = 1.0 / _2002;
        float _2008 = 1.0 / _2004;
        float _2010 = _1998 * _2008;
        float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2014 = fma(_1966, _2010, _2012);
        float _2016 = _2014 * _2006;
        float _2018 = precise::clamp(_2016, 0.0, 1.0);
        _1890 = _1982;
        _1864 = _2006;
        _1878 = _2018;
    }
    float _2020 = _1890;
    float _2022 = _1864;
    float _2024 = _1878;
    float _2026 = _2020;
    float _2028 = _2022;
    if (!_1834)
    {
        float _2030 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = _2032 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        float _2038 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2036;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2072 = fma(_1966, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        float _2078 = -_2076;
        float _2080 = _2078 + 1.0;
        _2026 = _2046;
        _1968 = _2080;
    }
    float _2082 = _2026;
    float _2084 = _1968;
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2088 = _1952 + _2086;
    float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2092 = _1954 + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2096 = _1956 + _2094;
    float _2098 = _2088 * _2088;
    float _2100 = fma(_2092, _2092, _2098);
    float _2102 = fma(_2096, _2096, _2100);
    float _2104 = rsqrt(_2102);
    float _2106 = sqrt(_2102);
    float _2108 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2110 = _2092 * _2108;
    float _2112 = _2096 * _2108;
    float _2114 = _2110 * _2110;
    float _2116 = _2112 * _2112;
    float _2118 = _2114 + _2116;
    float _2120 = sqrt(_2118);
    bool _2122 = _2120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2126 = _2120 + _2124;
    float _2128 = _2104;
    float _2130 = _2126;
    float _2132 = _2108;
    float _2134 = _2110;
    if (_2122)
    {
        float _2136 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2136;
    }
    float _2138 = _2128;
    if (_2122)
    {
        float _2140 = rsqrt(_2118);
        _2028 = _2140;
    }
    float _2142 = _2028;
    float _2144 = _2142;
    if (_2122)
    {
        float _2146 = _2126 * _2138;
        _2130 = _2146;
    }
    float _2148 = _2130;
    if (_2122)
    {
        float _2150 = _2148 * 0.15915493667125701904296875;
        _1970 = _2150;
    }
    float _2152 = _1970;
    float _2154 = _2082;
    if (_2122)
    {
        float _2156 = _2152 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        _2154 = _2158;
    }
    float _2160 = _2154;
    float _2162 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2164 = precise::max(0.0, _2162);
    float _2166 = _2096;
    float _2168 = _2164;
    float _2170 = _2162;
    if (_2122)
    {
        float _2172 = _2152 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        _2166 = _2174;
    }
    float _2176 = _2166;
    float _2178 = -_2108;
    float _2180 = -_2164;
    float _2182 = fma(_2088, _2178, _2180);
    float _2184 = _2182;
    if (_2122)
    {
        float _2186 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2186;
    }
    float _2188 = _2168;
    float _2190 = _2160;
    float _2192 = _2188;
    if (_2122)
    {
        float _2194 = fma(_2160, _2188, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2190 = _2194;
    }
    float _2196 = _2190;
    float _2198 = _2196;
    if (_2122)
    {
        float _2200 = _2176 + (-1.0);
        _2170 = _2200;
    }
    float _2202 = _2170;
    float _2204 = _2202;
    if (_2122)
    {
        float _2206 = _2142 * _2196;
        _2132 = _2206;
    }
    float _2208 = _2132;
    if (!_2122)
    {
        _2144 = _2182;
    }
    float _2210 = _2144;
    float _2212 = _2210;
    if (_2122)
    {
        float _2214 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2192 = _2214;
    }
    float _2216 = _2192;
    if (_2122)
    {
        float _2218 = _2110 * _2208;
        _2134 = _2218;
    }
    float _2220 = _2134;
    if (!_2122)
    {
        _2198 = _2112;
    }
    float _2222 = _2198;
    float _2224 = _2222;
    if (_2122)
    {
        float _2226 = _2112 * _2208;
        _2224 = _2226;
    }
    float _2228 = _2224;
    if (!_2122)
    {
        _2204 = _2114;
    }
    float _2230 = _2204;
    float _2232 = _2230;
    if (_2122)
    {
        float _2234 = fma(_2182, _2176, _2216);
        _2212 = _2234;
    }
    float _2236 = _2212;
    if (_2122)
    {
        float _2238 = _2220 * _2220;
        _2232 = _2238;
    }
    float _2240 = _2232;
    if (!_2122)
    {
        _2184 = _2116;
    }
    float _2242 = _2184;
    float _2244 = _2242;
    if (_2122)
    {
        float _2246 = _2228 * _2228;
        _2244 = _2246;
    }
    float _2248 = _2244;
    float _2250 = fma(_2236, _2236, _2240);
    float _2252 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2254 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2256 = _2250 + _2248;
    float _2258 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2252);
    float _2260 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2264 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2262);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2258);
    float _2272 = rsqrt(_2256);
    float _2274 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2260);
    float _2276 = -_2266;
    float _2278 = _2276 + 1.0;
    float _2280 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2282 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2284 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2254);
    float _2286 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2274);
    float _2288 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2280);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2284);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = abs(_2278);
    float _2298 = log2(_2296);
    float _2300 = -_2290;
    float _2302 = fma(_2300, _2268, 1.0);
    float _2304 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2306 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2308 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2288);
    float _2310 = _2272 * _2220;
    float _2312 = _2272 * _2228;
    float _2314 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2306);
    float _2316 = _2272 * _2236;
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2320 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2322 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2314);
    float _2324 = log2(_2302);
    float _2326 = -_2318;
    float _2328 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2326);
    float _2330 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2332 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2322);
    float _2334 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = -_2312;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2328);
    float _2340 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2342 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2330);
    float _2344 = 1.0 / _2332;
    float _2346 = fma(_2338, -0.5, 0.5);
    float _2348 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2340);
    float _2350 = fma(_2338, 0.5, 0.5);
    float _2352 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2342);
    float _2354 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2356 = _2316 + 1.0;
    float _2358 = exp2(_2334);
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2354);
    float _2364 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2352);
    float _2366 = _2324 * 0.693147182464599609375;
    float _2368 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2370 = sqrt(_2346);
    float _2372 = _2364 * _2344;
    float _2374 = fma(_2350, _2368, 1.570728778839111328125);
    float _2376 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2378 = fma(_2372, -0.5, 0.5);
    float _2380 = -_2316;
    float _2382 = fma(_2358, _2356, _2380);
    float _2384 = _2362 * _2344;
    float _2386 = fma(_2382, 0.5, 0.5);
    float _2388 = fma(_2384, 0.5, 0.5);
    float _2390 = _2370 * 0.636619746685028076171875;
    float _2392 = -_2374;
    float _2394 = fma(_2390, _2392, 1.0);
    float3 _6163 = float3(_2388, _2378, _2376);
    float _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).x;
    float3 _6174 = float3(_2388, _2378, _2376);
    float4 _2399 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2401 = _2399.x;
    float _2403 = _2399.y;
    float _2405 = _2399.z;
    float _2407 = _2399.w;
    float2 _6191 = float2(_2394, _2386);
    float3 _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6191, float2(0.0), isnan(_6191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6191, float2(0.0), isnan(_6191)), level(0.0)).xyz;
    float _2413 = _2411.x;
    float _2415 = _2411.y;
    float _2417 = _2411.z;
    float _2419 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2421 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2423 = _2024 > 0.0;
    bool _2425 = isnan(_2024);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2421);
    float _2435 = exp2(_2419);
    bool _2437 = _2084 <= 0.0;
    bool _2439 = !_2431;
    bool _2441 = _2437 || _2439;
    float _2443 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2433);
    float _2445 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2443);
    float _2447 = _2024 * _2084;
    float _2449 = _2445 + _2332;
    float _2451 = -_2435;
    float _2453 = _2451 + 1.0;
    float _2455 = _2447 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2457 = _2449 * 0.5;
    float _2459 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2461 = _2455 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2362;
    out.gl_Position.y = _2364;
    out.gl_Position.z = _2445;
    out.gl_Position.w = _2332;
    float _2463 = -_2459;
    float _2465 = _2463 + 1.0;
    out.m_71.z = _2457;
    out.m_71.w = _2332;
    out.m_47.x = _2461;
    float _2467 = _2459 * _2396;
    float _2469 = _2407 * _2467;
    float _2471 = _2417 * _2467;
    float _2473 = fma(_2413, _2469, _2401);
    float _2475 = fma(_2415, _2469, _2403);
    float _2477 = _2407 * _2465;
    float _2479 = fma(_2407, _2471, _2405);
    out.m_73.x = _2473;
    out.m_73.y = _2475;
    out.m_73.z = _2479;
    out.m_73.w = _2477;
    if (!_2441)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1772 = false;
    bool _672 = false;
    bool _580 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2538 = as_type<float>(_108);
        out.gl_Position.z = _2538;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2608 = as_type<float>(_146);
        out.gl_Position.z = _2608;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_53.w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _150;
    if (!_162)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_55.w = _148;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _152, _170);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_57.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_92);
        float _296 = 1.0 / _294;
        float _298 = _126 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _300 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = 1.0 / _320;
    float _332 = 1.0 / _316;
    bool _334 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_300);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _328;
    float _350 = _308 * _330;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    bool _356 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_300);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = 1.0 / _324;
    float _370 = _304 * _332;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _300 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -_366;
    float _382 = _380 + 1.0;
    float _384 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = _374 * _348;
    bool _388 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_300);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _398 * _354;
    float _406 = _312 * _368;
    bool _408 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _410 = isnan(_300);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_398;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _424;
    float _428 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = _418 * _422;
    float _432 = -_418;
    float _434 = _432 + 1.0;
    float _436 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _438 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _440 = isnan(_300);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = _366 * _434;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _464 = _448 * _382;
    float _466 = fma(_452, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_458, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _470 = fma(_462, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _472 = _436 * _464;
    float _474 = _384 * _464;
    float _476 = _428 * _464;
    float _478 = -_448;
    float _480 = _478 + 1.0;
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_53.z;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _498 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _500;
    float _504 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _506 = fma(_490, _406, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _508 = fma(_470, _454, _496);
    float _510 = fma(_466, _454, _498);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _520 = fma(_494, _406, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_502, _406, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _528 = fma(_468, _454, _504);
    float _530 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _532 = fma(_518, _386, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _534 = fma(_526, _386, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _536 = fma(_506, _430, _528);
    float _538 = fma(_522, _430, _508);
    float _540 = fma(_520, _430, _510);
    float _542 = fma(_534, _404, _536);
    float _544 = fma(_532, _404, _538);
    float _546 = fma(_530, _404, _540);
    float _548 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _542);
    float _550 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _544);
    float _552 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _546);
    float _554 = _548 * _486;
    float _556 = _550 * _484;
    float _558 = _552 * _482;
    bool _560 = !_346;
    float _578;
    if (!_560)
    {
        float _562 = in.m_57.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_92);
        float _584 = 1.0 / _582;
        float _586 = _126 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = _642 * _634;
    float _646 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _648 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _646);
    float _650 = _648 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _650;
    bool _652 = !_630;
    float _670;
    if (!_652)
    {
        float _654 = in.m_57.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_92);
        float _676 = 1.0 / _674;
        float _678 = _126 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = in.m_57.z;
    float _684 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _686 = in.m_57.x;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _690 = _688 != 0;
    float _692 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _696 = _694 != 0;
    float _698 = in.m_57.y;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _702 = _700 != 0;
    float _704 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = in.m_51.y;
    float _708 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _684);
    float _710 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _712 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _692);
    float _714 = in.m_57.w;
    float _716 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _708);
    float _718 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _712);
    float _720 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _710);
    float _722 = _716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _726 = _682 * 2.0;
    bool _728 = _682 > 0.5;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _732 = _686 * 2.0;
    float _734 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _736 = floor(_726);
    float _738 = _698 * 2.0;
    bool _740 = _698 > 0.5;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _744 = -_706;
    float _746 = _744 + 1.0;
    float _748 = floor(_732);
    float _750 = _718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _752 = _740 ? as_type<int>(_746) : as_type<int>(_706);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _756 = _714 > 0.5;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _760 = _728 ? as_type<int>(_746) : as_type<int>(_706);
    float _762 = floor(_738);
    float _764 = _696 ? as_type<float>(_752) : _706;
    float _766 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _768 = _736 > 0.0;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _772 = _702 ? as_type<float>(_760) : _706;
    float _774 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[88].w, _754);
    float _776 = _706;
    if (_690)
    {
        float _778 = _756 ? _746 : _706;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_766, -2.0, _758);
    bool _784 = _736 >= 0.0;
    bool _786 = isnan(_736);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _796 = _748 > 0.0;
    float _798 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _782);
    bool _800 = _748 >= 0.0;
    bool _802 = isnan(_748);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _812 = in.m_61.x;
    float _814 = in.m_61.y;
    float _816 = in.m_61.z;
    bool _818 = _762 > 0.0;
    int _820 = _792 ? 0 : 1;
    bool _822 = _762 >= 0.0;
    bool _824 = isnan(_762);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    int _832 = ~_820;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    int _838 = _808 ? 0 : 1;
    int _840 = _830 ? 0 : 1;
    int _842 = _836;
    if (!_768)
    {
        int _844 = ~_820;
        int _846 = _844 + 1;
        _842 = _846;
    }
    int _848 = _842;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    int _862 = ~_840;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = _866;
    if (!_818)
    {
        int _870 = ~_840;
        int _872 = _870 + 1;
        _868 = _872;
    }
    int _874 = _868;
    bool _876 = !_856;
    int _878 = _876 ? 0 : 1;
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _812);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _884 = _882 != 0;
    float _886 = _698 + _682;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _814);
    int _890 = ~_838;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = _886 + (-1.0);
    int _898 = _894;
    float _900 = _886;
    if (!_796)
    {
        int _902 = ~_838;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _910 = !_852;
    int _912 = _910 ? 0 : 1;
    float _914 = _686 + _698;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _918 = _916 != 0;
    float _920 = -_908;
    float _922 = fma(_734, 2.0, _920);
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _926 = _924 != 0;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _932 = _930 != 0;
    float _934 = _914 + (-1.0);
    float _936 = _810 * _888;
    float _938 = _934;
    if (_884)
    {
        _900 = _686;
    }
    float _940 = _900;
    float _942 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _944 = _940;
    if (!_884)
    {
        _944 = _682;
    }
    float _946 = _944;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _950 = abs(_912);
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _954 = _946;
    if (!_884)
    {
        _954 = _682;
    }
    float _956 = _954;
    float _958 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _960 = _956;
    if (!_884)
    {
        _938 = _698;
    }
    float _962 = _938;
    float _964 = -_948;
    float _966 = fma(_952, 2.0, _964);
    float _968 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _970 = log2(_968);
    float _972 = _962;
    if (_884)
    {
        _960 = _698;
    }
    float _974 = _960;
    if (_884)
    {
        _972 = _686;
    }
    float _976 = _972;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _980 = float(_874);
    int _982 = abs(_878);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[83].w, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[83].z, _724);
    bool _988 = !_860;
    float _990 = _988 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _992 = _976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _994 = float(_950);
    float _996 = -_126;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    int _1000 = abs(as_type<int>(_990));
    float _1002 = -_730;
    float _1004 = fma(_992, 2.0, _1002);
    float _1006 = _990;
    float _1008 = _992;
    if (_884)
    {
        _1006 = _698;
    }
    float _1010 = _1006;
    float _1012 = _970 * _126;
    float _1014 = _1010;
    if (!_884)
    {
        _1008 = _682;
    }
    float _1016 = _1008;
    float _1018 = -_126;
    float _1020 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1004);
    float _1022 = _1016;
    if (!_884)
    {
        _1014 = _686;
    }
    float _1024 = _1014;
    float _1026 = -_750;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_884)
    {
        _1022 = _698;
    }
    float _1030 = _1022;
    float _1032 = exp2(_1012);
    float _1034 = float(_982);
    float _1036 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1038 = float(_848);
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1042 = float(_1000);
    float _1044 = fma(_1036, -2.0, _770);
    float _1046 = float(_906);
    float _1048 = fma(_1040, -2.0, _742);
    float _1050 = _994 * _1038;
    bool _1052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(1.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = in.m_63.x;
    float _1064 = in.m_63.y;
    float _1066 = in.m_63.z;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1070 = 1.0 + _1068;
    float _1072 = _1034 * _1046;
    float _1074 = _1042 * _980;
    float _1076 = 1.0 / _1070;
    float _1078 = -_1032;
    float _1080 = _1078 + 1.0;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1084 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1092 = _1088 || _1090;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1098 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1082);
    float _1100 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1094);
    float _1102 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _984);
    float _1104 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1096);
    float _1106 = _1092 ? _1080 : 0.0;
    float _1108 = -_722;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1112 = _1028 * _1028;
    float _1114 = -_126;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[86].x, _966);
    float _1118 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1098);
    float _1120 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1048);
    float _1122 = _1050 * (-2.0);
    float _1124 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _774);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1130 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1132 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1100);
    float _1134 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1136 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1044);
    float _1138 = -_794;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = fma(_1110, _1110, _1112);
    bool _1144 = _1092;
    if (_1060)
    {
        float _1146 = _1106 * _1076;
        _128 = _1146;
    }
    float _1148 = _128;
    float _1150 = _686 + (-0.5);
    float _1152 = fma(_1122, _1062, _1062);
    float _1154 = fma(_958, _1122, _958);
    float _1156 = fma(_1140, _1140, _1142);
    float _1158 = _1072 * (-2.0);
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    if (_918)
    {
        bool _1162 = _686 > 0.5;
        _1144 = _1162;
    }
    bool _1164 = _1144;
    float _1166 = _686 + _682;
    float _1168 = fma(_1158, _1064, _1064);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1174 = fma(_1154, _1148, _1160);
    float _1176 = rsqrt(_1156);
    float _1178 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1180 = _1166 + (-1.0);
    float _1182 = _1074 * (-2.0);
    float _1184 = _698 + (-0.5);
    float _1186 = _1178 * _880;
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1190 = 1.0 / _1172;
    float _1192 = fma(_1182, _1066, _1066);
    float _1194 = _682 + (-0.5);
    float _1196 = fma(_942, _1158, _942);
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    float _1200 = fma(_1188, _1182, _1188);
    float _1202 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1192);
    float _1204 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1206 = fma(_1196, _1148, _1198);
    float _1208 = fma(_1200, _1148, _1202);
    float _1210 = _1204 * _928;
    float _1212 = _1110 * _1176;
    float _1214 = _1140 * _1176;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1222 = _1212 * _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1228 = _1218 * _1190;
    float _1230 = _1028 * _1176;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1234 = _1214 * _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1238 = -_1222;
    float _1240 = fma(_1214, _1236, _1238);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1246 = 1.0 / _1128;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1250 = _1230 * _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1254 = -_1234;
    float _1256 = fma(_1230, _1252, _1254);
    float _1258 = _1240 * _1240;
    float _1260 = _1174 * 0.15915493667125701904296875;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = -_1250;
    float _1266 = fma(_1212, _1262, _1264);
    float _1268 = fma(_1256, _1256, _1258);
    float _1270 = 1.0 / _1244;
    float _1272 = _1208 * 0.15915493667125701904296875;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1276 = _680 + _1274;
    float _1278 = fma(_1266, _1266, _1268);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1280;
    float _1284 = _1260 * 6.283185482025146484375;
    float _1286 = sin(_1284);
    float _1288 = _1206 * 0.15915493667125701904296875;
    float _1290 = _1282 * _1246;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1294 = _680 + _1292;
    float _1296 = fma(_1228, _1294, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1298 = _1260 * 6.283185482025146484375;
    float _1300 = cos(_1298);
    float _1302 = _1226 * _1270;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1306 = _680 + _1304;
    float _1308 = fma(_1302, _1276, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1310 = fma(_1290, _1306, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1312 = _1288 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1288 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1272 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1300 * _1314;
    float _1326 = _1286 * _1314;
    float _1328 = _1272 * 6.283185482025146484375;
    float _1330 = sin(_1328);
    float _1332 = _1286 * _1318;
    float _1334 = _1300 * _1318;
    float _1336 = rsqrt(_1278);
    float _1338 = _1318 * _1322;
    float _1340 = _1322 * _936;
    float _1342 = _1314 * _1322;
    float _1344 = -_936;
    float _1346 = _1330 * _1344;
    float _1348 = -_1324;
    float _1350 = fma(_1330, _1332, _1348);
    float _1352 = -_1332;
    float _1354 = fma(_1330, _1324, _1352);
    float _1356 = fma(_1330, _1334, _1326);
    float _1358 = fma(_1338, _1186, _1346);
    float _1360 = _1300 * _1340;
    float _1362 = fma(_1330, _1326, _1334);
    float _1364 = _1286 * _1340;
    float _1366 = _1256 * _1336;
    float _1368 = _1240 * _1336;
    float _1370 = _1266 * _1336;
    float _1372 = fma(_1356, _1186, _1360);
    float _1374 = _1230 * _1366;
    float _1376 = _1214 * _1368;
    float _1378 = fma(_1350, _1186, _1364);
    float _1380 = fma(_1354, _1210, _1372);
    float _1382 = -_1374;
    float _1384 = fma(_1212, _1368, _1382);
    float _1386 = -_1376;
    float _1388 = fma(_1230, _1370, _1386);
    float _1390 = fma(_1342, _1210, _1358);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1384 * _1380;
    float _1396 = _1388 * _1380;
    float _1398 = fma(_1362, _1210, _1378);
    float _1400 = in.m_51.x;
    float _1402 = fma(_1370, _1390, _1394);
    float _1404 = fma(_1366, _1390, _1396);
    bool _1406 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1408 = isnan(_680);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1212 * _1370;
    float _1420 = fma(_1214, _1398, _1402);
    float _1422 = fma(_1212, _1398, _1404);
    bool _1424 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1426 = isnan(_680);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1438 = _794 + _1420;
    float _1440 = _722 + _1422;
    bool _1442 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1444 = isnan(_680);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    float _1454 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1458 = _1438 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1462 = _1440 + _1460;
    float _1464 = -_1416;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1454, _764, -0.5);
    float _1470 = _1458 * _1458;
    float _1472 = _1462 * _1462;
    bool _1474 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1476 = isnan(_680);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = _1434 * _1466;
    float _1488 = -_1434;
    float _1490 = _1488 + 1.0;
    float _1492 = _1472 + _1470;
    float _1494 = -_1418;
    float _1496 = fma(_1214, _1366, _1494);
    int _1498 = as_type<int>(_1212);
    int _1500 = as_type<int>(_1468);
    int _1502 = as_type<int>(_1296);
    float _1504 = _1400;
    float _1506 = _1230;
    float _1508 = _1472;
    float _1510 = _1470;
    float _1512 = _1438;
    float _1514 = _1440;
    if (_918)
    {
        float _1516 = -_1400;
        float _1518 = _1516 + 1.0;
        _1498 = as_type<int>(_1518);
    }
    int _1520 = _1498;
    float _1522 = _1452 * _1490;
    float _1524 = sqrt(_1492);
    float _1526 = -_1452;
    float _1528 = _1526 + 1.0;
    float _1530 = -_798;
    float _1532 = fma(_1118, _1468, _1530);
    float _1534 = _1496 * _1380;
    float _1536 = _1528;
    float _1538 = as_type<float>(_1520);
    if (_932)
    {
        float _1540 = -_1400;
        float _1542 = _1540 + 1.0;
        _1500 = as_type<int>(_1542);
    }
    int _1544 = _1500;
    float _1546 = _1484 * _1528;
    if (!_918)
    {
        _1536 = _1400;
    }
    float _1548 = _1536;
    float _1550 = fma(_1368, _1390, _1534);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1554 = _1548;
    if (_918)
    {
        float _1556 = _1164 ? as_type<float>(_1520) : _1400;
        _1554 = _1556;
    }
    float _1558 = _1554;
    float _1560 = _1296 * _1546;
    if (_926)
    {
        float _1562 = -_1400;
        float _1564 = _1562 + 1.0;
        _1502 = as_type<int>(_1564);
    }
    int _1566 = _1502;
    float _1568 = fma(_1230, _1398, _1550);
    float _1570 = -_1484;
    float _1572 = _1570 + 1.0;
    if (!_926)
    {
        _1538 = _1400;
    }
    float _1574 = _1538;
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1578 = _1524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1560);
    float _1582 = _1574;
    if (_926)
    {
        float _1584 = _728 ? as_type<float>(_1566) : _1400;
        _1582 = _1584;
    }
    float _1586 = _1582;
    float _1588 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1590 = _750 + _1568;
    if (_932)
    {
        float _1592 = _740 ? as_type<float>(_1544) : _1400;
        _1504 = _1592;
    }
    float _1594 = _1504;
    float _1596 = fma(_1308, _1522, _1580);
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1600 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1602 = fma(_1588, _1558, -0.5);
    float _1604 = fma(_1600, _780, -0.5);
    if (!_1578)
    {
        _1506 = _1590;
    }
    float _1606 = _1506;
    float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1610 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1612 = fma(_772, _1610, -0.5);
    float _1614 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1618 = !_1578;
    float _1620 = _1606;
    if (!_1618)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1626 = _1524 + _1624;
        float _1628 = rsqrt(_1492);
        float _1630 = _1626 * _1622;
        float _1632 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * 0.15915493667125701904296875;
        float _1636 = _1634 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1646 = _1628 * _1644;
        float _1648 = _1642 + (-1.0);
        float _1650 = fma(_1462, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1652 = fma(_1458, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1658 = _1650 + _1656;
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1662 = _1652 + _1660;
        float _1664 = fma(_1590, _1642, _1654);
        float _1666 = _1658 * _1658;
        float _1668 = _1662 * _1662;
        _1620 = _1664;
        _1508 = _1666;
        _1510 = _1668;
        _1512 = _1652;
        _1514 = _1650;
    }
    float _1670 = _1620;
    float _1672 = _1508;
    float _1674 = _1510;
    float _1676 = _1512;
    float _1678 = _1514;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1682 = _1670 + _1680;
    float _1684 = fma(_1614, _1586, -0.5);
    float _1686 = fma(_1616, _1594, -0.5);
    float _1688 = fma(_1310, _1486, _1596);
    float _1690 = fma(_1682, _1682, _1672);
    float _1692 = fma(_1130, _1602, _998);
    float _1694 = fma(_1134, _1684, _1020);
    float _1696 = fma(_1132, _1686, _1116);
    float _1698 = _1690 + _1674;
    float _1700 = -_1120;
    float _1702 = fma(_1102, _1604, _1700);
    float _1704 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1688);
    float _1706 = -_1136;
    float _1708 = fma(_1124, _1612, _1706);
    float _1710 = _1692 + 0.5;
    float _1712 = _1532 + 0.5;
    float _1714 = sqrt(_1698);
    float _1716 = _1696 + 0.5;
    float _1718 = _1694 + 0.5;
    float _1720 = _1702 + 0.5;
    float _1722 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1724 = _1708 + 0.5;
    out.m_65.x = _1710;
    out.m_65.y = _1712;
    out.m_65.z = _1718;
    out.m_65.w = _1720;
    out.m_67.w = _1722;
    out.m_69.x = _1716;
    out.m_69.y = _1724;
    bool _1726 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1728 = isnan(_1714);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1734 = _1730 || _1732;
    float _1736 = _1694;
    if (!_1734)
    {
        _1736 = 1.0;
    }
    float _1738 = _1736;
    bool _1740 = !_1734;
    float _1742 = _1738;
    if (!_1740)
    {
        bool _1744 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1746 = isnan(_1714);
        bool _1748 = _1744 || _1746;
        bool _1750 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1752 = _1748 || _1750;
        if (!_1752)
        {
            float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1756 = _1714 + _1754;
            float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1760 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1766 = 1.0 / _1760;
            float _1768 = _1756 * _1766;
            float _1770 = fma(_1768, _1764, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1742 = _1770;
            _1772 = true;
        }
        else
        {
            bool _1774 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1776 = isnan(_1714);
            bool _1778 = _1774 || _1776;
            bool _1780 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1782 = _1778 || _1780;
            if (!_1782)
            {
                float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1786 = _1714 + _1784;
                float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1790 = _1788 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1794 = _1792 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1796 = 1.0 / _1790;
                float _1798 = _1786 * _1796;
                float _1800 = fma(_1798, _1794, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1742 = _1800;
                _1772 = true;
            }
            else
            {
                _1742 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1772 = false;
    float _1802 = _1742;
    float _1804 = _750 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1808 = _1670 + _1806;
    float _1810 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1804);
    float _1812 = _750 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1814 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1810);
    bool _1816 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(0.5);
    bool _1824 = _1820 || _1822;
    bool _1826 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(0.5);
    bool _1834 = _1830 || _1832;
    float _1836 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1838 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1812);
    float _1840 = fma(_1808, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1842 = 1.0 / _1836;
    float _1844 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1838);
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1848 = _1846 + _1836;
    float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1852 = _1676 + _1850;
    float _1854 = fma(_1852, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1856 = _1852;
    float _1858 = _1808;
    float _1860 = _1802;
    float _1862 = _1840;
    float _1864 = _1854;
    if (_1834)
    {
        _1856 = 1.0;
    }
    float _1866 = _1856;
    float _1868 = _1848 * _1842;
    float _1870 = _1868 * 0.5;
    float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1874 = _1678 + _1872;
    float _1876 = _1870;
    float _1878 = _1866;
    if (_1824)
    {
        _1858 = _1854;
    }
    float _1880 = _1858;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1882);
    float _1886 = fma(_1874, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1888 = _1880;
    float _1890 = _1886;
    if (_1824)
    {
        _1876 = _1840;
    }
    float _1892 = _1876;
    float _1894 = 1.0 / _1884;
    float _1896 = _1892;
    if (_1824)
    {
        _1860 = _1886;
    }
    float _1898 = _1860;
    float _1900 = _1898;
    if (!_1824)
    {
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1904 = _750 + _1902;
        float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1908 = _722 + _1906;
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1912 = _1904 * _1904;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _794 + _1914;
        float _1918 = fma(_1908, _1908, _1912);
        float _1920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1922 = fma(_1916, _1916, _1918);
        float _1924 = sqrt(_1922);
        float _1926 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1928 = precise::min(_1924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1930 = _1928 * _1920;
        float _1932 = -_750;
        float _1934 = _1932 + _1840;
        float _1936 = -_722;
        float _1938 = _1936 + _1886;
        float _1940 = -_794;
        float _1942 = _1940 + _1854;
        float _1944 = _1926 * _1930;
        float _1946 = fma(_1938, _1944, _722);
        float _1948 = fma(_1934, _1944, _750);
        float _1950 = fma(_1942, _1944, _794);
        _1896 = _1948;
        _1900 = _1946;
        _1888 = _1950;
        _1862 = _1942;
    }
    float _1952 = _1896;
    float _1954 = _1900;
    float _1956 = _1888;
    float _1958 = _1862;
    float _1960 = _1958;
    if (_1834)
    {
        _1960 = 1.0;
    }
    float _1962 = _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1966 = _1894 * _1964;
    float _1968 = _1962;
    float _1970 = _1966;
    if (!_1834)
    {
        float _1972 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1974 = _1972 * 0.15915493667125701904296875;
        float _1976 = _1974 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1982 = _1980 * 0.15915493667125701904296875;
        float _1984 = _1974 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        float _1988 = 1.0 / _1978;
        float _1990 = _1982 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = _1986 * _1988;
        float _1996 = _1982 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2002 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2000;
        float _2004 = _1992 * _1994;
        float _2006 = 1.0 / _2002;
        float _2008 = 1.0 / _2004;
        float _2010 = _1998 * _2008;
        float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2014 = fma(_1966, _2010, _2012);
        float _2016 = _2014 * _2006;
        float _2018 = precise::clamp(_2016, 0.0, 1.0);
        _1890 = _1982;
        _1864 = _2006;
        _1878 = _2018;
    }
    float _2020 = _1890;
    float _2022 = _1864;
    float _2024 = _1878;
    float _2026 = _2020;
    float _2028 = _2022;
    if (!_1834)
    {
        float _2030 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = _2032 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        float _2038 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2036;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2072 = fma(_1966, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        float _2078 = -_2076;
        float _2080 = _2078 + 1.0;
        _2026 = _2046;
        _1968 = _2080;
    }
    float _2082 = _2026;
    float _2084 = _1968;
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2088 = _1952 + _2086;
    float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2092 = _1954 + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2096 = _1956 + _2094;
    float _2098 = _2088 * _2088;
    float _2100 = fma(_2092, _2092, _2098);
    float _2102 = fma(_2096, _2096, _2100);
    float _2104 = rsqrt(_2102);
    float _2106 = sqrt(_2102);
    float _2108 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2110 = _2092 * _2108;
    float _2112 = _2096 * _2108;
    float _2114 = _2110 * _2110;
    float _2116 = _2112 * _2112;
    float _2118 = _2114 + _2116;
    float _2120 = sqrt(_2118);
    bool _2122 = _2120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2126 = _2120 + _2124;
    float _2128 = _2104;
    float _2130 = _2126;
    float _2132 = _2108;
    float _2134 = _2110;
    if (_2122)
    {
        float _2136 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2136;
    }
    float _2138 = _2128;
    if (_2122)
    {
        float _2140 = rsqrt(_2118);
        _2028 = _2140;
    }
    float _2142 = _2028;
    float _2144 = _2142;
    if (_2122)
    {
        float _2146 = _2126 * _2138;
        _2130 = _2146;
    }
    float _2148 = _2130;
    if (_2122)
    {
        float _2150 = _2148 * 0.15915493667125701904296875;
        _1970 = _2150;
    }
    float _2152 = _1970;
    float _2154 = _2082;
    if (_2122)
    {
        float _2156 = _2152 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        _2154 = _2158;
    }
    float _2160 = _2154;
    float _2162 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2164 = precise::max(0.0, _2162);
    float _2166 = _2096;
    float _2168 = _2164;
    float _2170 = _2162;
    if (_2122)
    {
        float _2172 = _2152 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        _2166 = _2174;
    }
    float _2176 = _2166;
    float _2178 = -_2108;
    float _2180 = -_2164;
    float _2182 = fma(_2088, _2178, _2180);
    float _2184 = _2182;
    if (_2122)
    {
        float _2186 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2186;
    }
    float _2188 = _2168;
    float _2190 = _2160;
    float _2192 = _2188;
    if (_2122)
    {
        float _2194 = fma(_2160, _2188, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2190 = _2194;
    }
    float _2196 = _2190;
    float _2198 = _2196;
    if (_2122)
    {
        float _2200 = _2176 + (-1.0);
        _2170 = _2200;
    }
    float _2202 = _2170;
    float _2204 = _2202;
    if (_2122)
    {
        float _2206 = _2142 * _2196;
        _2132 = _2206;
    }
    float _2208 = _2132;
    if (!_2122)
    {
        _2144 = _2182;
    }
    float _2210 = _2144;
    float _2212 = _2210;
    if (_2122)
    {
        float _2214 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2192 = _2214;
    }
    float _2216 = _2192;
    if (_2122)
    {
        float _2218 = _2110 * _2208;
        _2134 = _2218;
    }
    float _2220 = _2134;
    if (!_2122)
    {
        _2198 = _2112;
    }
    float _2222 = _2198;
    float _2224 = _2222;
    if (_2122)
    {
        float _2226 = _2112 * _2208;
        _2224 = _2226;
    }
    float _2228 = _2224;
    if (!_2122)
    {
        _2204 = _2114;
    }
    float _2230 = _2204;
    float _2232 = _2230;
    if (_2122)
    {
        float _2234 = fma(_2182, _2176, _2216);
        _2212 = _2234;
    }
    float _2236 = _2212;
    if (_2122)
    {
        float _2238 = _2220 * _2220;
        _2232 = _2238;
    }
    float _2240 = _2232;
    if (!_2122)
    {
        _2184 = _2116;
    }
    float _2242 = _2184;
    float _2244 = _2242;
    if (_2122)
    {
        float _2246 = _2228 * _2228;
        _2244 = _2246;
    }
    float _2248 = _2244;
    float _2250 = fma(_2236, _2236, _2240);
    float _2252 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2254 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2256 = _2250 + _2248;
    float _2258 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2252);
    float _2260 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2264 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2262);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2258);
    float _2272 = rsqrt(_2256);
    float _2274 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2260);
    float _2276 = -_2266;
    float _2278 = _2276 + 1.0;
    float _2280 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2282 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2284 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2254);
    float _2286 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2274);
    float _2288 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2280);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2284);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = abs(_2278);
    float _2298 = log2(_2296);
    float _2300 = -_2290;
    float _2302 = fma(_2300, _2268, 1.0);
    float _2304 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2306 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2308 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2288);
    float _2310 = _2272 * _2220;
    float _2312 = _2272 * _2228;
    float _2314 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2306);
    float _2316 = _2272 * _2236;
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2320 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2322 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2314);
    float _2324 = log2(_2302);
    float _2326 = -_2318;
    float _2328 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2326);
    float _2330 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2332 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2322);
    float _2334 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = -_2312;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2328);
    float _2340 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2342 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2330);
    float _2344 = 1.0 / _2332;
    float _2346 = fma(_2338, -0.5, 0.5);
    float _2348 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2340);
    float _2350 = fma(_2338, 0.5, 0.5);
    float _2352 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2342);
    float _2354 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2356 = _2316 + 1.0;
    float _2358 = exp2(_2334);
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2354);
    float _2364 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2352);
    float _2366 = _2324 * 0.693147182464599609375;
    float _2368 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2370 = sqrt(_2346);
    float _2372 = _2364 * _2344;
    float _2374 = fma(_2350, _2368, 1.570728778839111328125);
    float _2376 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2378 = fma(_2372, -0.5, 0.5);
    float _2380 = -_2316;
    float _2382 = fma(_2358, _2356, _2380);
    float _2384 = _2362 * _2344;
    float _2386 = fma(_2382, 0.5, 0.5);
    float _2388 = fma(_2384, 0.5, 0.5);
    float _2390 = _2370 * 0.636619746685028076171875;
    float _2392 = -_2374;
    float _2394 = fma(_2390, _2392, 1.0);
    float3 _6163 = float3(_2388, _2378, _2376);
    float _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).x;
    float3 _6174 = float3(_2388, _2378, _2376);
    float4 _2399 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2401 = _2399.x;
    float _2403 = _2399.y;
    float _2405 = _2399.z;
    float _2407 = _2399.w;
    float2 _6191 = float2(_2394, _2386);
    float3 _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6191, float2(0.0), isnan(_6191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6191, float2(0.0), isnan(_6191)), level(0.0)).xyz;
    float _2413 = _2411.x;
    float _2415 = _2411.y;
    float _2417 = _2411.z;
    float _2419 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2421 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2423 = _2024 > 0.0;
    bool _2425 = isnan(_2024);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2421);
    float _2435 = exp2(_2419);
    bool _2437 = _2084 <= 0.0;
    bool _2439 = !_2431;
    bool _2441 = _2437 || _2439;
    float _2443 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2433);
    float _2445 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2443);
    float _2447 = _2024 * _2084;
    float _2449 = _2445 + _2332;
    float _2451 = -_2435;
    float _2453 = _2451 + 1.0;
    float _2455 = _2447 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2457 = _2449 * 0.5;
    float _2459 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2461 = _2455 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2362;
    out.gl_Position.y = _2364;
    out.gl_Position.z = _2445;
    out.gl_Position.w = _2332;
    float _2463 = -_2459;
    float _2465 = _2463 + 1.0;
    out.m_71.z = _2457;
    out.m_71.w = _2332;
    out.m_47.x = _2461;
    float _2467 = _2459 * _2396;
    float _2469 = _2407 * _2467;
    float _2471 = _2417 * _2467;
    float _2473 = fma(_2413, _2469, _2401);
    float _2475 = fma(_2415, _2469, _2403);
    float _2477 = _2407 * _2465;
    float _2479 = fma(_2407, _2471, _2405);
    out.m_73.x = _2473;
    out.m_73.y = _2475;
    out.m_73.z = _2479;
    out.m_73.w = _2477;
    if (!_2441)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1772 = false;
    bool _672 = false;
    bool _580 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2538 = as_type<float>(_108);
        out.gl_Position.z = _2538;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2608 = as_type<float>(_146);
        out.gl_Position.z = _2608;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_53.w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_49.x;
    float _166 = in.m_49.y;
    float _168 = in.m_49.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _150;
    if (!_162)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_55.w = _148;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _152, _170);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_57.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_92);
        float _296 = 1.0 / _294;
        float _298 = _126 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _312 = _300 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = 1.0 / _320;
    float _332 = 1.0 / _316;
    bool _334 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_300);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = 1.0 / _328;
    float _350 = _308 * _330;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    bool _356 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_300);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = 1.0 / _324;
    float _370 = _304 * _332;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _374 = _300 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _376;
    float _380 = -_366;
    float _382 = _380 + 1.0;
    float _384 = fma(_378, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = _374 * _348;
    bool _388 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _390 = isnan(_300);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _398 * _354;
    float _406 = _312 * _368;
    bool _408 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _410 = isnan(_300);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_398;
    float _422 = _420 + 1.0;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _424;
    float _428 = fma(_402, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _430 = _418 * _422;
    float _432 = -_418;
    float _434 = _432 + 1.0;
    float _436 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _438 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _440 = isnan(_300);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = _366 * _434;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _464 = _448 * _382;
    float _466 = fma(_452, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_458, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _470 = fma(_462, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _472 = _436 * _464;
    float _474 = _384 * _464;
    float _476 = _428 * _464;
    float _478 = -_448;
    float _480 = _478 + 1.0;
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_53.z;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _474);
    float _498 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _472);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _500;
    float _504 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[143].z, _476);
    float _506 = fma(_490, _406, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _508 = fma(_470, _454, _496);
    float _510 = fma(_466, _454, _498);
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _520 = fma(_494, _406, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _522 = fma(_502, _406, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _528 = fma(_468, _454, _504);
    float _530 = fma(_514, _386, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _532 = fma(_518, _386, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _534 = fma(_526, _386, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _536 = fma(_506, _430, _528);
    float _538 = fma(_522, _430, _508);
    float _540 = fma(_520, _430, _510);
    float _542 = fma(_534, _404, _536);
    float _544 = fma(_532, _404, _538);
    float _546 = fma(_530, _404, _540);
    float _548 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _542);
    float _550 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _544);
    float _552 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _546);
    float _554 = _548 * _486;
    float _556 = _550 * _484;
    float _558 = _552 * _482;
    bool _560 = !_346;
    float _578;
    if (!_560)
    {
        float _562 = in.m_57.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_92);
        float _584 = 1.0 / _582;
        float _586 = _126 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = _642 * _634;
    float _646 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _648 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _646);
    float _650 = _648 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.w = _650;
    bool _652 = !_630;
    float _670;
    if (!_652)
    {
        float _654 = in.m_57.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        float _674 = float(_92);
        float _676 = 1.0 / _674;
        float _678 = _126 * _676;
        _670 = _678;
    }
    _672 = false;
    float _680 = _670;
    float _682 = in.m_57.z;
    float _684 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _686 = in.m_57.x;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _690 = _688 != 0;
    float _692 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _696 = _694 != 0;
    float _698 = in.m_57.y;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _702 = _700 != 0;
    float _704 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = in.m_51.y;
    float _708 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _684);
    float _710 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _712 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _692);
    float _714 = in.m_57.w;
    float _716 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _708);
    float _718 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _712);
    float _720 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _710);
    float _722 = _716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _726 = _682 * 2.0;
    bool _728 = _682 > 0.5;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _732 = _686 * 2.0;
    float _734 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _736 = floor(_726);
    float _738 = _698 * 2.0;
    bool _740 = _698 > 0.5;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _744 = -_706;
    float _746 = _744 + 1.0;
    float _748 = floor(_732);
    float _750 = _718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _752 = _740 ? as_type<int>(_746) : as_type<int>(_706);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _756 = _714 > 0.5;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _760 = _728 ? as_type<int>(_746) : as_type<int>(_706);
    float _762 = floor(_738);
    float _764 = _696 ? as_type<float>(_752) : _706;
    float _766 = _698 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _768 = _736 > 0.0;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _772 = _702 ? as_type<float>(_760) : _706;
    float _774 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[88].w, _754);
    float _776 = _706;
    if (_690)
    {
        float _778 = _756 ? _746 : _706;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_766, -2.0, _758);
    bool _784 = _736 >= 0.0;
    bool _786 = isnan(_736);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = _720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _796 = _748 > 0.0;
    float _798 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _782);
    bool _800 = _748 >= 0.0;
    bool _802 = isnan(_748);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _812 = in.m_61.x;
    float _814 = in.m_61.y;
    float _816 = in.m_61.z;
    bool _818 = _762 > 0.0;
    int _820 = _792 ? 0 : 1;
    bool _822 = _762 >= 0.0;
    bool _824 = isnan(_762);
    bool _826 = _822 || _824;
    bool _828 = isnan(0.0);
    bool _830 = _826 || _828;
    int _832 = ~_820;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    int _838 = _808 ? 0 : 1;
    int _840 = _830 ? 0 : 1;
    int _842 = _836;
    if (!_768)
    {
        int _844 = ~_820;
        int _846 = _844 + 1;
        _842 = _846;
    }
    int _848 = _842;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    int _862 = ~_840;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    int _868 = _866;
    if (!_818)
    {
        int _870 = ~_840;
        int _872 = _870 + 1;
        _868 = _872;
    }
    int _874 = _868;
    bool _876 = !_856;
    int _878 = _876 ? 0 : 1;
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _812);
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _884 = _882 != 0;
    float _886 = _698 + _682;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _814);
    int _890 = ~_838;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = _886 + (-1.0);
    int _898 = _894;
    float _900 = _886;
    if (!_796)
    {
        int _902 = ~_838;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _910 = !_852;
    int _912 = _910 ? 0 : 1;
    float _914 = _686 + _698;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _918 = _916 != 0;
    float _920 = -_908;
    float _922 = fma(_734, 2.0, _920);
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _926 = _924 != 0;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _932 = _930 != 0;
    float _934 = _914 + (-1.0);
    float _936 = _810 * _888;
    float _938 = _934;
    if (_884)
    {
        _900 = _686;
    }
    float _940 = _900;
    float _942 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _944 = _940;
    if (!_884)
    {
        _944 = _682;
    }
    float _946 = _944;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _950 = abs(_912);
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _954 = _946;
    if (!_884)
    {
        _954 = _682;
    }
    float _956 = _954;
    float _958 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _960 = _956;
    if (!_884)
    {
        _938 = _698;
    }
    float _962 = _938;
    float _964 = -_948;
    float _966 = fma(_952, 2.0, _964);
    float _968 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _970 = log2(_968);
    float _972 = _962;
    if (_884)
    {
        _960 = _698;
    }
    float _974 = _960;
    if (_884)
    {
        _972 = _686;
    }
    float _976 = _972;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _980 = float(_874);
    int _982 = abs(_878);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[83].w, _978);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[83].z, _724);
    bool _988 = !_860;
    float _990 = _988 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _992 = _976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _994 = float(_950);
    float _996 = -_126;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    int _1000 = abs(as_type<int>(_990));
    float _1002 = -_730;
    float _1004 = fma(_992, 2.0, _1002);
    float _1006 = _990;
    float _1008 = _992;
    if (_884)
    {
        _1006 = _698;
    }
    float _1010 = _1006;
    float _1012 = _970 * _126;
    float _1014 = _1010;
    if (!_884)
    {
        _1008 = _682;
    }
    float _1016 = _1008;
    float _1018 = -_126;
    float _1020 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1004);
    float _1022 = _1016;
    if (!_884)
    {
        _1014 = _686;
    }
    float _1024 = _1014;
    float _1026 = -_750;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_884)
    {
        _1022 = _698;
    }
    float _1030 = _1022;
    float _1032 = exp2(_1012);
    float _1034 = float(_982);
    float _1036 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1038 = float(_848);
    float _1040 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1042 = float(_1000);
    float _1044 = fma(_1036, -2.0, _770);
    float _1046 = float(_906);
    float _1048 = fma(_1040, -2.0, _742);
    float _1050 = _994 * _1038;
    bool _1052 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1054 = isnan(1.0);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1060 = _1056 || _1058;
    float _1062 = in.m_63.x;
    float _1064 = in.m_63.y;
    float _1066 = in.m_63.z;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1070 = 1.0 + _1068;
    float _1072 = _1034 * _1046;
    float _1074 = _1042 * _980;
    float _1076 = 1.0 / _1070;
    float _1078 = -_1032;
    float _1080 = _1078 + 1.0;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1084 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1086 = isnan(0.0);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1092 = _1088 || _1090;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1098 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1082);
    float _1100 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1094);
    float _1102 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _984);
    float _1104 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1096);
    float _1106 = _1092 ? _1080 : 0.0;
    float _1108 = -_722;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1112 = _1028 * _1028;
    float _1114 = -_126;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[86].x, _966);
    float _1118 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1098);
    float _1120 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1048);
    float _1122 = _1050 * (-2.0);
    float _1124 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _774);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1130 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1104);
    float _1132 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1100);
    float _1134 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _986);
    float _1136 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1044);
    float _1138 = -_794;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = fma(_1110, _1110, _1112);
    bool _1144 = _1092;
    if (_1060)
    {
        float _1146 = _1106 * _1076;
        _128 = _1146;
    }
    float _1148 = _128;
    float _1150 = _686 + (-0.5);
    float _1152 = fma(_1122, _1062, _1062);
    float _1154 = fma(_958, _1122, _958);
    float _1156 = fma(_1140, _1140, _1142);
    float _1158 = _1072 * (-2.0);
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1152);
    if (_918)
    {
        bool _1162 = _686 > 0.5;
        _1144 = _1162;
    }
    bool _1164 = _1144;
    float _1166 = _686 + _682;
    float _1168 = fma(_1158, _1064, _1064);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1174 = fma(_1154, _1148, _1160);
    float _1176 = rsqrt(_1156);
    float _1178 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1180 = _1166 + (-1.0);
    float _1182 = _1074 * (-2.0);
    float _1184 = _698 + (-0.5);
    float _1186 = _1178 * _880;
    float _1188 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1190 = 1.0 / _1172;
    float _1192 = fma(_1182, _1066, _1066);
    float _1194 = _682 + (-0.5);
    float _1196 = fma(_942, _1158, _942);
    float _1198 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    float _1200 = fma(_1188, _1182, _1188);
    float _1202 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1192);
    float _1204 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1206 = fma(_1196, _1148, _1198);
    float _1208 = fma(_1200, _1148, _1202);
    float _1210 = _1204 * _928;
    float _1212 = _1110 * _1176;
    float _1214 = _1140 * _1176;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1222 = _1212 * _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1228 = _1218 * _1190;
    float _1230 = _1028 * _1176;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1234 = _1214 * _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1238 = -_1222;
    float _1240 = fma(_1214, _1236, _1238);
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1244 = _1242 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1246 = 1.0 / _1128;
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1250 = _1230 * _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1254 = -_1234;
    float _1256 = fma(_1230, _1252, _1254);
    float _1258 = _1240 * _1240;
    float _1260 = _1174 * 0.15915493667125701904296875;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = -_1250;
    float _1266 = fma(_1212, _1262, _1264);
    float _1268 = fma(_1256, _1256, _1258);
    float _1270 = 1.0 / _1244;
    float _1272 = _1208 * 0.15915493667125701904296875;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1276 = _680 + _1274;
    float _1278 = fma(_1266, _1266, _1268);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1280;
    float _1284 = _1260 * 6.283185482025146484375;
    float _1286 = sin(_1284);
    float _1288 = _1206 * 0.15915493667125701904296875;
    float _1290 = _1282 * _1246;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1294 = _680 + _1292;
    float _1296 = fma(_1228, _1294, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1298 = _1260 * 6.283185482025146484375;
    float _1300 = cos(_1298);
    float _1302 = _1226 * _1270;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1306 = _680 + _1304;
    float _1308 = fma(_1302, _1276, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1310 = fma(_1290, _1306, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1312 = _1288 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1288 * 6.283185482025146484375;
    float _1318 = cos(_1316);
    float _1320 = _1272 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1300 * _1314;
    float _1326 = _1286 * _1314;
    float _1328 = _1272 * 6.283185482025146484375;
    float _1330 = sin(_1328);
    float _1332 = _1286 * _1318;
    float _1334 = _1300 * _1318;
    float _1336 = rsqrt(_1278);
    float _1338 = _1318 * _1322;
    float _1340 = _1322 * _936;
    float _1342 = _1314 * _1322;
    float _1344 = -_936;
    float _1346 = _1330 * _1344;
    float _1348 = -_1324;
    float _1350 = fma(_1330, _1332, _1348);
    float _1352 = -_1332;
    float _1354 = fma(_1330, _1324, _1352);
    float _1356 = fma(_1330, _1334, _1326);
    float _1358 = fma(_1338, _1186, _1346);
    float _1360 = _1300 * _1340;
    float _1362 = fma(_1330, _1326, _1334);
    float _1364 = _1286 * _1340;
    float _1366 = _1256 * _1336;
    float _1368 = _1240 * _1336;
    float _1370 = _1266 * _1336;
    float _1372 = fma(_1356, _1186, _1360);
    float _1374 = _1230 * _1366;
    float _1376 = _1214 * _1368;
    float _1378 = fma(_1350, _1186, _1364);
    float _1380 = fma(_1354, _1210, _1372);
    float _1382 = -_1374;
    float _1384 = fma(_1212, _1368, _1382);
    float _1386 = -_1376;
    float _1388 = fma(_1230, _1370, _1386);
    float _1390 = fma(_1342, _1210, _1358);
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1394 = _1384 * _1380;
    float _1396 = _1388 * _1380;
    float _1398 = fma(_1362, _1210, _1378);
    float _1400 = in.m_51.x;
    float _1402 = fma(_1370, _1390, _1394);
    float _1404 = fma(_1366, _1390, _1396);
    bool _1406 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1408 = isnan(_680);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = _1212 * _1370;
    float _1420 = fma(_1214, _1398, _1402);
    float _1422 = fma(_1212, _1398, _1404);
    bool _1424 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1426 = isnan(_680);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1432 = _1428 || _1430;
    float _1434 = float(_1432);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1438 = _794 + _1420;
    float _1440 = _722 + _1422;
    bool _1442 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1444 = isnan(_680);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    float _1454 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1458 = _1438 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1462 = _1440 + _1460;
    float _1464 = -_1416;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1454, _764, -0.5);
    float _1470 = _1458 * _1458;
    float _1472 = _1462 * _1462;
    bool _1474 = _680 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1476 = isnan(_680);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = _1434 * _1466;
    float _1488 = -_1434;
    float _1490 = _1488 + 1.0;
    float _1492 = _1472 + _1470;
    float _1494 = -_1418;
    float _1496 = fma(_1214, _1366, _1494);
    int _1498 = as_type<int>(_1212);
    int _1500 = as_type<int>(_1468);
    int _1502 = as_type<int>(_1296);
    float _1504 = _1400;
    float _1506 = _1230;
    float _1508 = _1472;
    float _1510 = _1470;
    float _1512 = _1438;
    float _1514 = _1440;
    if (_918)
    {
        float _1516 = -_1400;
        float _1518 = _1516 + 1.0;
        _1498 = as_type<int>(_1518);
    }
    int _1520 = _1498;
    float _1522 = _1452 * _1490;
    float _1524 = sqrt(_1492);
    float _1526 = -_1452;
    float _1528 = _1526 + 1.0;
    float _1530 = -_798;
    float _1532 = fma(_1118, _1468, _1530);
    float _1534 = _1496 * _1380;
    float _1536 = _1528;
    float _1538 = as_type<float>(_1520);
    if (_932)
    {
        float _1540 = -_1400;
        float _1542 = _1540 + 1.0;
        _1500 = as_type<int>(_1542);
    }
    int _1544 = _1500;
    float _1546 = _1484 * _1528;
    if (!_918)
    {
        _1536 = _1400;
    }
    float _1548 = _1536;
    float _1550 = fma(_1368, _1390, _1534);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1554 = _1548;
    if (_918)
    {
        float _1556 = _1164 ? as_type<float>(_1520) : _1400;
        _1554 = _1556;
    }
    float _1558 = _1554;
    float _1560 = _1296 * _1546;
    if (_926)
    {
        float _1562 = -_1400;
        float _1564 = _1562 + 1.0;
        _1502 = as_type<int>(_1564);
    }
    int _1566 = _1502;
    float _1568 = fma(_1230, _1398, _1550);
    float _1570 = -_1484;
    float _1572 = _1570 + 1.0;
    if (!_926)
    {
        _1538 = _1400;
    }
    float _1574 = _1538;
    float _1576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1578 = _1524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1560);
    float _1582 = _1574;
    if (_926)
    {
        float _1584 = _728 ? as_type<float>(_1566) : _1400;
        _1582 = _1584;
    }
    float _1586 = _1582;
    float _1588 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1590 = _750 + _1568;
    if (_932)
    {
        float _1592 = _740 ? as_type<float>(_1544) : _1400;
        _1504 = _1592;
    }
    float _1594 = _1504;
    float _1596 = fma(_1308, _1522, _1580);
    float _1598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1600 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1602 = fma(_1588, _1558, -0.5);
    float _1604 = fma(_1600, _780, -0.5);
    if (!_1578)
    {
        _1506 = _1590;
    }
    float _1606 = _1506;
    float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1610 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1612 = fma(_772, _1610, -0.5);
    float _1614 = _1598 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1616 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1618 = !_1578;
    float _1620 = _1606;
    if (!_1618)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1626 = _1524 + _1624;
        float _1628 = rsqrt(_1492);
        float _1630 = _1626 * _1622;
        float _1632 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * 0.15915493667125701904296875;
        float _1636 = _1634 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1646 = _1628 * _1644;
        float _1648 = _1642 + (-1.0);
        float _1650 = fma(_1462, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1652 = fma(_1458, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1658 = _1650 + _1656;
        float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1662 = _1652 + _1660;
        float _1664 = fma(_1590, _1642, _1654);
        float _1666 = _1658 * _1658;
        float _1668 = _1662 * _1662;
        _1620 = _1664;
        _1508 = _1666;
        _1510 = _1668;
        _1512 = _1652;
        _1514 = _1650;
    }
    float _1670 = _1620;
    float _1672 = _1508;
    float _1674 = _1510;
    float _1676 = _1512;
    float _1678 = _1514;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1682 = _1670 + _1680;
    float _1684 = fma(_1614, _1586, -0.5);
    float _1686 = fma(_1616, _1594, -0.5);
    float _1688 = fma(_1310, _1486, _1596);
    float _1690 = fma(_1682, _1682, _1672);
    float _1692 = fma(_1130, _1602, _998);
    float _1694 = fma(_1134, _1684, _1020);
    float _1696 = fma(_1132, _1686, _1116);
    float _1698 = _1690 + _1674;
    float _1700 = -_1120;
    float _1702 = fma(_1102, _1604, _1700);
    float _1704 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1688);
    float _1706 = -_1136;
    float _1708 = fma(_1124, _1612, _1706);
    float _1710 = _1692 + 0.5;
    float _1712 = _1532 + 0.5;
    float _1714 = sqrt(_1698);
    float _1716 = _1696 + 0.5;
    float _1718 = _1694 + 0.5;
    float _1720 = _1702 + 0.5;
    float _1722 = _1704 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1724 = _1708 + 0.5;
    out.m_65.x = _1710;
    out.m_65.y = _1712;
    out.m_65.z = _1718;
    out.m_65.w = _1720;
    out.m_67.w = _1722;
    out.m_69.x = _1716;
    out.m_69.y = _1724;
    bool _1726 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1728 = isnan(_1714);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1734 = _1730 || _1732;
    float _1736 = _1694;
    if (!_1734)
    {
        _1736 = 1.0;
    }
    float _1738 = _1736;
    bool _1740 = !_1734;
    float _1742 = _1738;
    if (!_1740)
    {
        bool _1744 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1746 = isnan(_1714);
        bool _1748 = _1744 || _1746;
        bool _1750 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1752 = _1748 || _1750;
        if (!_1752)
        {
            float _1754 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1756 = _1714 + _1754;
            float _1758 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1760 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1758;
            float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1766 = 1.0 / _1760;
            float _1768 = _1756 * _1766;
            float _1770 = fma(_1768, _1764, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1742 = _1770;
            _1772 = true;
        }
        else
        {
            bool _1774 = _1714 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1776 = isnan(_1714);
            bool _1778 = _1774 || _1776;
            bool _1780 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1782 = _1778 || _1780;
            if (!_1782)
            {
                float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1786 = _1714 + _1784;
                float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1790 = _1788 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1794 = _1792 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1796 = 1.0 / _1790;
                float _1798 = _1786 * _1796;
                float _1800 = fma(_1798, _1794, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1742 = _1800;
                _1772 = true;
            }
            else
            {
                _1742 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1772 = false;
    float _1802 = _1742;
    float _1804 = _750 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1806 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1808 = _1670 + _1806;
    float _1810 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1804);
    float _1812 = _750 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1814 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1810);
    bool _1816 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan(0.5);
    bool _1824 = _1820 || _1822;
    bool _1826 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(0.5);
    bool _1834 = _1830 || _1832;
    float _1836 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1838 = fma(_722, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1812);
    float _1840 = fma(_1808, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1842 = 1.0 / _1836;
    float _1844 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1838);
    float _1846 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1848 = _1846 + _1836;
    float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1852 = _1676 + _1850;
    float _1854 = fma(_1852, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1856 = _1852;
    float _1858 = _1808;
    float _1860 = _1802;
    float _1862 = _1840;
    float _1864 = _1854;
    if (_1834)
    {
        _1856 = 1.0;
    }
    float _1866 = _1856;
    float _1868 = _1848 * _1842;
    float _1870 = _1868 * 0.5;
    float _1872 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1874 = _1678 + _1872;
    float _1876 = _1870;
    float _1878 = _1866;
    if (_1824)
    {
        _1858 = _1854;
    }
    float _1880 = _1858;
    float _1882 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1884 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1882);
    float _1886 = fma(_1874, _1802, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1888 = _1880;
    float _1890 = _1886;
    if (_1824)
    {
        _1876 = _1840;
    }
    float _1892 = _1876;
    float _1894 = 1.0 / _1884;
    float _1896 = _1892;
    if (_1824)
    {
        _1860 = _1886;
    }
    float _1898 = _1860;
    float _1900 = _1898;
    if (!_1824)
    {
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1904 = _750 + _1902;
        float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1908 = _722 + _1906;
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1912 = _1904 * _1904;
        float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1916 = _794 + _1914;
        float _1918 = fma(_1908, _1908, _1912);
        float _1920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1922 = fma(_1916, _1916, _1918);
        float _1924 = sqrt(_1922);
        float _1926 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1928 = precise::min(_1924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1930 = _1928 * _1920;
        float _1932 = -_750;
        float _1934 = _1932 + _1840;
        float _1936 = -_722;
        float _1938 = _1936 + _1886;
        float _1940 = -_794;
        float _1942 = _1940 + _1854;
        float _1944 = _1926 * _1930;
        float _1946 = fma(_1938, _1944, _722);
        float _1948 = fma(_1934, _1944, _750);
        float _1950 = fma(_1942, _1944, _794);
        _1896 = _1948;
        _1900 = _1946;
        _1888 = _1950;
        _1862 = _1942;
    }
    float _1952 = _1896;
    float _1954 = _1900;
    float _1956 = _1888;
    float _1958 = _1862;
    float _1960 = _1958;
    if (_1834)
    {
        _1960 = 1.0;
    }
    float _1962 = _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1966 = _1894 * _1964;
    float _1968 = _1962;
    float _1970 = _1966;
    if (!_1834)
    {
        float _1972 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1974 = _1972 * 0.15915493667125701904296875;
        float _1976 = _1974 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1982 = _1980 * 0.15915493667125701904296875;
        float _1984 = _1974 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        float _1988 = 1.0 / _1978;
        float _1990 = _1982 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        float _1994 = _1986 * _1988;
        float _1996 = _1982 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2002 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2000;
        float _2004 = _1992 * _1994;
        float _2006 = 1.0 / _2002;
        float _2008 = 1.0 / _2004;
        float _2010 = _1998 * _2008;
        float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2014 = fma(_1966, _2010, _2012);
        float _2016 = _2014 * _2006;
        float _2018 = precise::clamp(_2016, 0.0, 1.0);
        _1890 = _1982;
        _1864 = _2006;
        _1878 = _2018;
    }
    float _2020 = _1890;
    float _2022 = _1864;
    float _2024 = _1878;
    float _2026 = _2020;
    float _2028 = _2022;
    if (!_1834)
    {
        float _2030 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2032 = _2030 * 0.15915493667125701904296875;
        float _2034 = _2032 * 6.283185482025146484375;
        float _2036 = cos(_2034);
        float _2038 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2040 = _2038 * 0.15915493667125701904296875;
        float _2042 = _2032 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        float _2046 = 1.0 / _2036;
        float _2048 = _2040 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = _2044 * _2046;
        float _2054 = _2040 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2050 * _2052;
        float _2060 = 1.0 / _2058;
        float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2064 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2062;
        float _2066 = 1.0 / _2064;
        float _2068 = _2056 * _2060;
        float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2072 = fma(_1966, _2068, _2070);
        float _2074 = _2072 * _2066;
        float _2076 = precise::clamp(_2074, 0.0, 1.0);
        float _2078 = -_2076;
        float _2080 = _2078 + 1.0;
        _2026 = _2046;
        _1968 = _2080;
    }
    float _2082 = _2026;
    float _2084 = _1968;
    float _2086 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2088 = _1952 + _2086;
    float _2090 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2092 = _1954 + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2096 = _1956 + _2094;
    float _2098 = _2088 * _2088;
    float _2100 = fma(_2092, _2092, _2098);
    float _2102 = fma(_2096, _2096, _2100);
    float _2104 = rsqrt(_2102);
    float _2106 = sqrt(_2102);
    float _2108 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2110 = _2092 * _2108;
    float _2112 = _2096 * _2108;
    float _2114 = _2110 * _2110;
    float _2116 = _2112 * _2112;
    float _2118 = _2114 + _2116;
    float _2120 = sqrt(_2118);
    bool _2122 = _2120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2124 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2126 = _2120 + _2124;
    float _2128 = _2104;
    float _2130 = _2126;
    float _2132 = _2108;
    float _2134 = _2110;
    if (_2122)
    {
        float _2136 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2128 = _2136;
    }
    float _2138 = _2128;
    if (_2122)
    {
        float _2140 = rsqrt(_2118);
        _2028 = _2140;
    }
    float _2142 = _2028;
    float _2144 = _2142;
    if (_2122)
    {
        float _2146 = _2126 * _2138;
        _2130 = _2146;
    }
    float _2148 = _2130;
    if (_2122)
    {
        float _2150 = _2148 * 0.15915493667125701904296875;
        _1970 = _2150;
    }
    float _2152 = _1970;
    float _2154 = _2082;
    if (_2122)
    {
        float _2156 = _2152 * 6.283185482025146484375;
        float _2158 = sin(_2156);
        _2154 = _2158;
    }
    float _2160 = _2154;
    float _2162 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2164 = precise::max(0.0, _2162);
    float _2166 = _2096;
    float _2168 = _2164;
    float _2170 = _2162;
    if (_2122)
    {
        float _2172 = _2152 * 6.283185482025146484375;
        float _2174 = cos(_2172);
        _2166 = _2174;
    }
    float _2176 = _2166;
    float _2178 = -_2108;
    float _2180 = -_2164;
    float _2182 = fma(_2088, _2178, _2180);
    float _2184 = _2182;
    if (_2122)
    {
        float _2186 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2168 = _2186;
    }
    float _2188 = _2168;
    float _2190 = _2160;
    float _2192 = _2188;
    if (_2122)
    {
        float _2194 = fma(_2160, _2188, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2190 = _2194;
    }
    float _2196 = _2190;
    float _2198 = _2196;
    if (_2122)
    {
        float _2200 = _2176 + (-1.0);
        _2170 = _2200;
    }
    float _2202 = _2170;
    float _2204 = _2202;
    if (_2122)
    {
        float _2206 = _2142 * _2196;
        _2132 = _2206;
    }
    float _2208 = _2132;
    if (!_2122)
    {
        _2144 = _2182;
    }
    float _2210 = _2144;
    float _2212 = _2210;
    if (_2122)
    {
        float _2214 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2192 = _2214;
    }
    float _2216 = _2192;
    if (_2122)
    {
        float _2218 = _2110 * _2208;
        _2134 = _2218;
    }
    float _2220 = _2134;
    if (!_2122)
    {
        _2198 = _2112;
    }
    float _2222 = _2198;
    float _2224 = _2222;
    if (_2122)
    {
        float _2226 = _2112 * _2208;
        _2224 = _2226;
    }
    float _2228 = _2224;
    if (!_2122)
    {
        _2204 = _2114;
    }
    float _2230 = _2204;
    float _2232 = _2230;
    if (_2122)
    {
        float _2234 = fma(_2182, _2176, _2216);
        _2212 = _2234;
    }
    float _2236 = _2212;
    if (_2122)
    {
        float _2238 = _2220 * _2220;
        _2232 = _2238;
    }
    float _2240 = _2232;
    if (!_2122)
    {
        _2184 = _2116;
    }
    float _2242 = _2184;
    float _2244 = _2242;
    if (_2122)
    {
        float _2246 = _2228 * _2228;
        _2244 = _2246;
    }
    float _2248 = _2244;
    float _2250 = fma(_2236, _2236, _2240);
    float _2252 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2254 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2256 = _2250 + _2248;
    float _2258 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2252);
    float _2260 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2264 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2262);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2258);
    float _2272 = rsqrt(_2256);
    float _2274 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2260);
    float _2276 = -_2266;
    float _2278 = _2276 + 1.0;
    float _2280 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2282 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2284 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2254);
    float _2286 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2274);
    float _2288 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2280);
    float _2290 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2292 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2284);
    float _2294 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2296 = abs(_2278);
    float _2298 = log2(_2296);
    float _2300 = -_2290;
    float _2302 = fma(_2300, _2268, 1.0);
    float _2304 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2306 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2308 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2288);
    float _2310 = _2272 * _2220;
    float _2312 = _2272 * _2228;
    float _2314 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2306);
    float _2316 = _2272 * _2236;
    float _2318 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2320 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2322 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2314);
    float _2324 = log2(_2302);
    float _2326 = -_2318;
    float _2328 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2326);
    float _2330 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2332 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2322);
    float _2334 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = -_2312;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2328);
    float _2340 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2342 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2330);
    float _2344 = 1.0 / _2332;
    float _2346 = fma(_2338, -0.5, 0.5);
    float _2348 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2340);
    float _2350 = fma(_2338, 0.5, 0.5);
    float _2352 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2342);
    float _2354 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2356 = _2316 + 1.0;
    float _2358 = exp2(_2334);
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2354);
    float _2364 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2352);
    float _2366 = _2324 * 0.693147182464599609375;
    float _2368 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2370 = sqrt(_2346);
    float _2372 = _2364 * _2344;
    float _2374 = fma(_2350, _2368, 1.570728778839111328125);
    float _2376 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2378 = fma(_2372, -0.5, 0.5);
    float _2380 = -_2316;
    float _2382 = fma(_2358, _2356, _2380);
    float _2384 = _2362 * _2344;
    float _2386 = fma(_2382, 0.5, 0.5);
    float _2388 = fma(_2384, 0.5, 0.5);
    float _2390 = _2370 * 0.636619746685028076171875;
    float _2392 = -_2374;
    float _2394 = fma(_2390, _2392, 1.0);
    float3 _6163 = float3(_2388, _2378, _2376);
    float _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6163, float3(0.0), isnan(_6163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6163, float3(0.0), isnan(_6163)), level(0.0)).x;
    float3 _6174 = float3(_2388, _2378, _2376);
    float4 _2399 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6174, float3(0.0), isnan(_6174)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6174, float3(0.0), isnan(_6174)), level(0.0)).xyzw;
    float _2401 = _2399.x;
    float _2403 = _2399.y;
    float _2405 = _2399.z;
    float _2407 = _2399.w;
    float2 _6191 = float2(_2394, _2386);
    float3 _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6191, float2(0.0), isnan(_6191)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6191, float2(0.0), isnan(_6191)), level(0.0)).xyz;
    float _2413 = _2411.x;
    float _2415 = _2411.y;
    float _2417 = _2411.z;
    float _2419 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2421 = _2294 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2423 = _2024 > 0.0;
    bool _2425 = isnan(_2024);
    bool _2427 = _2423 || _2425;
    bool _2429 = isnan(0.0);
    bool _2431 = _2427 || _2429;
    float _2433 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2421);
    float _2435 = exp2(_2419);
    bool _2437 = _2084 <= 0.0;
    bool _2439 = !_2431;
    bool _2441 = _2437 || _2439;
    float _2443 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2433);
    float _2445 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2443);
    float _2447 = _2024 * _2084;
    float _2449 = _2445 + _2332;
    float _2451 = -_2435;
    float _2453 = _2451 + 1.0;
    float _2455 = _2447 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2457 = _2449 * 0.5;
    float _2459 = _2453 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2461 = _2455 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2362;
    out.gl_Position.y = _2364;
    out.gl_Position.z = _2445;
    out.gl_Position.w = _2332;
    float _2463 = -_2459;
    float _2465 = _2463 + 1.0;
    out.m_71.z = _2457;
    out.m_71.w = _2332;
    out.m_47.x = _2461;
    float _2467 = _2459 * _2396;
    float _2469 = _2407 * _2467;
    float _2471 = _2417 * _2467;
    float _2473 = fma(_2413, _2469, _2401);
    float _2475 = fma(_2415, _2469, _2403);
    float _2477 = _2407 * _2465;
    float _2479 = fma(_2407, _2471, _2405);
    out.m_73.x = _2473;
    out.m_73.y = _2475;
    out.m_73.z = _2479;
    out.m_73.w = _2477;
    if (!_2441)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

