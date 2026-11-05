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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1068 = false;
    bool _900 = false;
    bool _796 = false;
    bool _466 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2464 = as_type<float>(_104);
        out.gl_Position.z = _2464;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2534 = as_type<float>(_142);
        out.gl_Position.z = _2534;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _314 * _352;
    float _376 = _298 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_362, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = in.m_49.x;
    float _394 = in.m_49.y;
    float _396 = in.m_49.z;
    float _398 = _386 * _368;
    float _400 = _388 * _368;
    float _402 = _390 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    float _444 = _438 * _396;
    bool _446 = !_364;
    float _464;
    if (!_446)
    {
        float _448 = in.m_51.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_88);
        float _470 = 1.0 / _468;
        float _472 = _122 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _478 = _474 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _498;
    bool _502 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _504 = isnan(_474);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _490;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _474 + _516;
    bool _520 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _522 = isnan(_474);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = 1.0 / _486;
    float _534 = _518 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _538 = _474 + _536;
    bool _540 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _542 = isnan(_474);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _558 = 1.0 / _494;
    float _560 = _538 * _514;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _564 = _474 + _562;
    bool _566 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _568 = isnan(_474);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = fma(_554, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _584 = 1.0 / _500;
    float _586 = _478 * _532;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _590 = _474 + _588;
    bool _592 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _594 = isnan(_474);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _564 * _558;
    float _606 = -_576;
    float _608 = _606 + 1.0;
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _618;
    float _622 = _550 * _608;
    float _624 = _512 * _580;
    float _626 = -_512;
    float _628 = _626 + 1.0;
    float _630 = _590 * _584;
    bool _632 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _634 = isnan(_474);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = _602 * _628;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _658 = _642 * _612;
    float _660 = -_642;
    float _662 = _660 + 1.0;
    float _664 = fma(_616, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = fma(_652, _586, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _668 = fma(_656, _586, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _670 = fma(_646, _586, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _672 = _530 * _662;
    float _674 = fma(_620, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _676 = -_530;
    float _678 = _676 + 1.0;
    float _680 = _664 * _672;
    float _682 = _582 * _672;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _684;
    float _688 = _674 * _672;
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].x, _680);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _692;
    float _696 = fma(_686, _560, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _698 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].z, _688);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _704;
    float _708 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].y, _682);
    float _710 = fma(_666, _658, _690);
    float _712 = fma(_702, _604, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _714 = fma(_670, _658, _698);
    float _716 = fma(_694, _560, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _718 = fma(_706, _560, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _720 = fma(_668, _658, _708);
    float _722 = fma(_696, _648, _710);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _732 = fma(_716, _648, _720);
    float _734 = fma(_726, _604, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _740;
    float _744 = fma(_730, _604, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _746 = fma(_718, _648, _714);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _748;
    float _752 = fma(_738, _630, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _754 = fma(_742, _630, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _756 = fma(_712, _624, _722);
    float _758 = fma(_750, _630, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _760 = fma(_734, _624, _732);
    float _762 = fma(_744, _624, _746);
    float _764 = fma(_752, _622, _756);
    float _766 = fma(_754, _622, _760);
    float _768 = fma(_758, _622, _762);
    float _770 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].x, _764);
    float _772 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].y, _766);
    float _774 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].z, _768);
    bool _776 = !_556;
    float _794;
    if (!_776)
    {
        float _778 = in.m_51.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_88);
        float _800 = 1.0 / _798;
        float _802 = _122 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    bool _806 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _808 = isnan(_804);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _824 = isnan(_804);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _804 + _838;
    float _842 = -_816;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _848 = 1.0 / _820;
    float _850 = _832 * _844;
    float _852 = -_832;
    float _854 = _852 + 1.0;
    float _856 = _836 * _848;
    float _858 = _774 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _860 = fma(_856, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _862 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _866 = _860 * _850;
    float _868 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[115].x, _866);
    float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[116].x, _870);
    float _878 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _872;
    out.m_53.y = _874;
    out.m_53.z = _864;
    out.m_53.w = _878;
    bool _880 = !_846;
    float _898;
    if (!_880)
    {
        float _882 = in.m_51.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_88);
        float _904 = 1.0 / _902;
        float _906 = _122 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _912 = _908 + _910;
    bool _914 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _916 = isnan(_908);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _928 = _908 + _926;
    bool _930 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _932 = isnan(_908);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _942;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _950 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _952 = isnan(_908);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = -_924;
    float _964 = _962 + 1.0;
    float _966 = 1.0 / _944;
    float _968 = _960 * _964;
    float _970 = -_960;
    float _972 = _970 + 1.0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _974;
    bool _978 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _980 = 1.0 / _948;
    float _982 = _940 * _972;
    float _984 = -_940;
    float _986 = _984 + 1.0;
    float _988 = _912 * _966;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _994;
    float _998 = fma(_976, _988, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1000 = fma(_992, _988, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1002 = fma(_996, _988, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1004 = _928 * _980;
    float _1006 = _998 * _982;
    float _1008 = _1000 * _982;
    float _1010 = _1002 * _982;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1024 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1006);
    float _1026 = fma(_1014, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1028 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1030 = fma(_1022, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1032 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1008);
    float _1034 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1010);
    float _1036 = fma(_1026, _968, _1024);
    float _1038 = fma(_1028, _968, _1032);
    float _1040 = fma(_1030, _968, _1034);
    float _1042 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1036);
    float _1044 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1038);
    float _1046 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1040);
    bool _1048 = !_978;
    float _1066;
    if (!_1048)
    {
        float _1050 = in.m_51.x;
        float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1054 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1058 = _1056 * _1052;
        float _1060 = floor(_1058);
        float _1062 = -_1060;
        float _1064 = _1058 + _1062;
        _1066 = _1064;
        _1068 = true;
    }
    else
    {
        float _1070 = float(_88);
        float _1072 = 1.0 / _1070;
        float _1074 = _122 * _1072;
        _1066 = _1074;
    }
    _1068 = false;
    float _1076 = _1066;
    float _1078 = in.m_55.x;
    float _1080 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1082 = in.m_51.x;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1086 = _1084 != 0;
    float _1088 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1092 = _1090 != 0;
    float _1094 = in.m_51.w;
    float _1096 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1098 = in.m_51.z;
    float _1100 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1080);
    float _1102 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1088);
    float _1104 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1096);
    float _1106 = in.m_51.y;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1110 = _1108 != 0;
    float _1112 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1114 = log2(_1112);
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1118 = _1116 != 0;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1120 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1100);
    float _1122 = in.m_55.y;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    int _1126 = 1065353216;
    if (_1092)
    {
        float _1128 = -_1078;
        float _1130 = _1128 + 1.0;
        _1124 = as_type<int>(_1130);
    }
    int _1132 = _1124;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1138 = false;
    if (_1086)
    {
        bool _1140 = _1082 > 0.5;
        _1138 = _1140;
    }
    bool _1142 = _1138;
    float _1144 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1102);
    float _1146 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1104);
    float _1148 = _1094;
    bool _1150 = _1142;
    if (_1086)
    {
        float _1152 = -_1078;
        float _1154 = _1152 + 1.0;
        _1126 = as_type<int>(_1154);
    }
    int _1156 = _1126;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1160 = 1.0 + _1158;
    bool _1162 = _1094 > 0.5;
    float _1164 = _1098 * 2.0;
    float _1166 = as_type<float>(_1156);
    if (!_1086)
    {
        _1148 = _1078;
    }
    float _1168 = _1148;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1174 = _1168;
    if (_1086)
    {
        float _1176 = _1142 ? as_type<float>(_1156) : _1078;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1182 = _1122;
    if (_1092)
    {
        bool _1184 = _1098 > 0.5;
        _1150 = _1184;
    }
    bool _1186 = _1150;
    float _1188 = 1.0 / _1172;
    if (!_1092)
    {
        _1166 = _1078;
    }
    float _1190 = _1166;
    float _1192 = fma(_1180, -2.0, _1136);
    float _1194 = _1190;
    if (_1092)
    {
        float _1196 = _1186 ? as_type<float>(_1132) : _1078;
        _1194 = _1196;
    }
    float _1198 = _1194;
    float _1200 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1202 = -_1122;
    float _1204 = _1202 + 1.0;
    float _1206 = _1106 * 2.0;
    float _1208 = -_1134;
    float _1210 = fma(_1200, 2.0, _1208);
    float _1212 = 1.0 / _1160;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1214;
    float _1218 = _1082 * 2.0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1230 = _1228 != 0;
    float _1232 = _1106 + _1098;
    bool _1234 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1236 = isnan(_1076);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1192);
    float _1248 = floor(_1164);
    float _1250 = _1232 + (-1.0);
    float _1252 = _1216 * _1188;
    float _1254 = _1144 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1256 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1258 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1260 = _1082 + _1106;
    int _1262 = _1162 ? as_type<int>(_1204) : as_type<int>(_1122);
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1266 = _1114 * _122;
    float _1268 = _1260 + (-1.0);
    float _1270 = _1110 ? as_type<float>(_1262) : _1122;
    float _1272 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1274 = _1106 > 0.5;
    float _1276 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = exp2(_1266);
    bool _1280 = _1248 > 0.0;
    float _1282 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1284 = _1248 >= 0.0;
    bool _1286 = isnan(_1248);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1296 = _1076 + _1294;
    if (_1118)
    {
        float _1298 = _1274 ? _1204 : _1122;
        _1182 = _1298;
    }
    float _1300 = _1182;
    float _1302 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_1252, _1296, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1316 = floor(_1206);
    float _1318 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1320 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1328 = _1324 || _1326;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1332 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = isnan(_1076);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1278;
    float _1346 = _1344 + 1.0;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1350 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1330);
    float _1352 = -_122;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1210);
    float _1356 = floor(_1218);
    float _1358 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1348);
    float _1360 = _1328 ? _1346 : 0.0;
    float _1362 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    float _1364 = -_1342;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1358);
    float _1370 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1312)
    {
        float _1372 = _1360 * _1212;
        _124 = _1372;
    }
    float _1374 = _124;
    int _1376 = _1292 ? 0 : 1;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1380 = _1244 * _1366;
    bool _1382 = _1316 >= 0.0;
    bool _1384 = isnan(_1316);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(0.0);
    bool _1390 = _1386 || _1388;
    float _1392 = -_1244;
    float _1394 = _1392 + 1.0;
    int _1396 = ~_1376;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = _1314 * _1380;
    int _1404 = _1400;
    if (!_1280)
    {
        int _1406 = ~_1376;
        int _1408 = _1406 + 1;
        _1404 = _1408;
    }
    int _1410 = _1404;
    float _1412 = fma(_1370, _1300, -0.5);
    float _1414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1416 = _1316 > 0.0;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1254 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1424 = _1256 + _1422;
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1402);
    bool _1428 = _1356 > 0.0;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1432 = -_1246;
    float _1434 = fma(_1368, _1412, _1432);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1438 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1430);
    float _1442 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1426);
    bool _1444 = _1356 >= 0.0;
    bool _1446 = isnan(_1356);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = fma(_1438, _1178, -0.5);
    float _1456 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1272 + _1458;
    float _1462 = _1452 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1464 = fma(_1362, _1454, _1354);
    float _1466 = _1456 * _1414;
    float _1468 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1440);
    int _1470 = ~as_type<int>(_1462);
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    float _1476 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1478 = _1474;
    float _1480 = _1462;
    if (!_1428)
    {
        int _1482 = ~as_type<int>(_1462);
        int _1484 = _1482 + 1;
        _1478 = _1484;
    }
    int _1486 = _1478;
    float _1488 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1490 = _1282 * _1436;
    float _1492 = _1420 * _1420;
    bool _1494 = _1468 >= 0.0;
    float _1496 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1498 = !_1226;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = fma(_1424, _1424, _1492);
    float _1504 = _1442 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1506 = abs(_1500);
    float _1508 = fma(_1460, _1460, _1502);
    float _1510 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1434 + 0.5;
    float _1514 = in.m_59.x;
    float _1516 = in.m_59.y;
    float _1518 = in.m_59.z;
    float _1520 = _1464 + 0.5;
    int _1522 = _1390 ? 0 : 1;
    float _1524 = rsqrt(_1508);
    if (_1494)
    {
        _1480 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1526 = _1480;
    out.m_61.x = _1476;
    out.m_61.y = _1496;
    out.m_61.z = _1510;
    out.m_61.w = _1504;
    bool _1528 = !_1222;
    int _1530 = _1528 ? 0 : 1;
    int _1532 = ~_1522;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    int _1538 = as_type<int>(_1526);
    int _1540 = _1536;
    if (_1494)
    {
        float _1542 = _1526 * 5.0;
        _1538 = as_type<int>(_1542);
    }
    int _1544 = _1538;
    out.m_63.x = _1520;
    out.m_63.y = _1512;
    out.m_63.z = _1490;
    out.m_63.w = _1466;
    if (!_1416)
    {
        int _1546 = ~_1522;
        int _1548 = _1546 + 1;
        _1540 = _1548;
    }
    int _1550 = _1540;
    int _1552 = abs(_1530);
    if (_1494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4817 = as_type<float>(_1544);
        out.gl_Position.z = _4817;
    }
    bool _1554 = !_1230;
    int _1556 = _1554 ? 0 : 1;
    if (_1494)
    {
        out.m_45.x = 0.0;
    }
    float _1558 = _1420 * _1524;
    float _1560 = _1424 * _1524;
    if (_1494)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1562 = -_1558;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1254);
    float _1566 = float(_1552);
    float _1568 = -_1560;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1572 = float(_1410);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1564 + _1574;
    float _1578 = float(_1506);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1570 + _1580;
    float _1584 = float(_1486);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1588 = _1566 * _1572;
    float _1590 = _1460 * _1524;
    int _1592 = abs(_1556);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1586);
    float _1596 = _1588 * (-2.0);
    float _1598 = -_1590;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1602 = _1578 * _1584;
    float _1604 = fma(_1596, _1514, _1514);
    float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1608 = _1600 + _1606;
    float _1610 = float(_1550);
    float _1612 = _1602 * (-2.0);
    float _1614 = float(_1592);
    float _1616 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1594);
    float _1618 = _1082 + (-0.5);
    float _1620 = -_1558;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1624 = _1106 + (-0.5);
    float _1626 = _1614 * _1610;
    float _1628 = fma(_1258, _1612, _1258);
    float _1630 = fma(_1612, _1516, _1516);
    bool _1632 = _1616 >= 0.0;
    float _1634 = fma(_1276, _1596, _1276);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1604);
    float _1638 = -_1560;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1642 = _1622 * _1622;
    float _1644 = _1082 + _1098;
    float _1646 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1630);
    float _1648 = fma(_1634, _1374, _1636);
    float _1650 = fma(_1640, _1640, _1642);
    float _1652 = -_1590;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1460);
    float _1656 = _1644 + (-1.0);
    float _1658 = fma(_1628, _1374, _1646);
    float _1660 = _1648 * 0.15915493667125701904296875;
    float _1662 = fma(_1654, _1654, _1650);
    float _1664 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1666 = _1630;
    float _1668 = _1600;
    if (_1632)
    {
        _1666 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1670 = _1666;
    float _1672 = _1658 * 0.15915493667125701904296875;
    float _1674 = _1660 * 6.283185482025146484375;
    float _1676 = sin(_1674);
    float _1678 = _1626 * (-2.0);
    int _1680 = as_type<int>(_1670);
    if (_1632)
    {
        out.m_45.x = 0.0;
    }
    if (_1632)
    {
        float _1682 = _1670 * 5.0;
        _1680 = as_type<int>(_1682);
    }
    int _1684 = _1680;
    float _1686 = fma(_1678, _1518, _1518);
    float _1688 = _1098 + (-0.5);
    float _1690 = _1660 * 6.283185482025146484375;
    float _1692 = cos(_1690);
    if (_1632)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5054 = as_type<float>(_1684);
        out.gl_Position.z = _5054;
    }
    float _1694 = sqrt(_1662);
    if (_1632)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1696 = in.m_65.x;
    float _1698 = in.m_65.y;
    float _1700 = in.m_65.z;
    float _1702 = fma(_1664, _1678, _1664);
    float _1704 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1686);
    float _1706 = _1672 * 6.283185482025146484375;
    float _1708 = sin(_1706);
    float _1710 = _1524 * _1694;
    float _1712 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1714 = fma(_1702, _1374, _1704);
    float _1716 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1718 = _1710 * _1712;
    float _1720 = _1714 * 0.15915493667125701904296875;
    float _1722 = _1672 * 6.283185482025146484375;
    float _1724 = cos(_1722);
    float _1726 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1728 = _1710 * _1716;
    float _1730 = _1710 * _1726;
    float _1732 = _1720 * 6.283185482025146484375;
    float _1734 = cos(_1732);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1698);
    float _1738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1696);
    float _1740 = _1676 * _1708;
    float _1742 = _1720 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = _1718 * _1736;
    float _1748 = _1692 * _1724;
    float _1750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1700);
    float _1752 = _1692 * _1708;
    float _1754 = _1730 * _1738;
    float _1756 = _1676 * _1724;
    float _1758 = _1728 * _1750;
    float _1760 = _1734 * _1746;
    float _1762 = _1708 * _1734;
    float _1764 = _1724 * _1734;
    float _1766 = _1692 * _1760;
    float _1768 = fma(_1744, _1748, _1740);
    float _1770 = -_1746;
    float _1772 = _1744 * _1770;
    float _1774 = fma(_1744, _1740, _1748);
    float _1776 = fma(_1768, _1754, _1766);
    float _1778 = -_1756;
    float _1780 = fma(_1744, _1752, _1778);
    float _1782 = -_1752;
    float _1784 = fma(_1744, _1756, _1782);
    float _1786 = _1676 * _1760;
    float _1788 = fma(_1764, _1754, _1772);
    float _1790 = fma(_1780, _1758, _1776);
    float _1792 = fma(_1784, _1754, _1786);
    float _1794 = fma(_1762, _1758, _1788);
    float _1796 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1798 = fma(_1774, _1758, _1792);
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1802 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1796);
    float _1804 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1800);
    float _1806 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1802);
    float _1808 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1810 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1812 = _1808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1814 = _1272 + _1810;
    float _1816 = _1256 + _1812;
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1820 = _1814 + _1818;
    float _1822 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1826 = _1816 + _1824;
    float _1828 = _1820 * _1820;
    float _1830 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1822);
    float _1832 = fma(_1826, _1826, _1828);
    float _1834 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1830);
    float _1836 = sqrt(_1832);
    float _1838 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1840 = _1254 + _1838;
    bool _1842 = _1836 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = _1838;
    float _1846 = _1834;
    float _1848 = _1806;
    float _1850 = _1790;
    float _1852 = _1826;
    if (!_1842)
    {
        _1844 = _1816;
    }
    float _1854 = _1844;
    float _1856 = _1854;
    if (!_1842)
    {
        _1846 = _1814;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (!_1842)
    {
        _1848 = _1840;
    }
    float _1862 = _1848;
    bool _1864 = !_1842;
    float _1866 = _1862;
    if (!_1864)
    {
        float _1868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1872 = _1836 + _1870;
        float _1874 = rsqrt(_1832);
        float _1876 = _1872 * _1868;
        float _1878 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1880 = _1876 * 0.15915493667125701904296875;
        float _1882 = _1880 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        float _1886 = _1880 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        float _1890 = _1884 + (-1.0);
        float _1892 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = fma(_1888, _1878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1896 = fma(_1840, _1884, _1892);
        float _1898 = _1874 * _1894;
        float _1900 = fma(_1826, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = fma(_1820, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1866 = _1896;
        _1856 = _1900;
        _1860 = _1902;
        _1850 = _1880;
    }
    float _1904 = _1866;
    float _1906 = _1856;
    float _1908 = _1860;
    float _1910 = _1850;
    float _1912 = -_1558;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1904);
    float _1916 = -_1560;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1906);
    float _1920 = -_1590;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1908);
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1914 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1930 = _1918 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1934 = _1922 + _1932;
    float _1936 = _1926 * _1926;
    float _1938 = fma(_1930, _1930, _1936);
    float _1940 = fma(_1934, _1934, _1938);
    float _1942 = rsqrt(_1940);
    float _1944 = sqrt(_1940);
    float _1946 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1948 = _1930 * _1946;
    float _1950 = _1934 * _1946;
    float _1952 = _1948 * _1948;
    float _1954 = _1950 * _1950;
    float _1956 = _1952 + _1954;
    float _1958 = sqrt(_1956);
    bool _1960 = _1958 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1964 = _1958 + _1962;
    float _1966 = _1934;
    float _1968 = _1936;
    float _1970 = _1964;
    float _1972 = _1926;
    if (_1960)
    {
        float _1974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1966 = _1974;
    }
    float _1976 = _1966;
    if (_1960)
    {
        float _1978 = rsqrt(_1956);
        _1968 = _1978;
    }
    float _1980 = _1968;
    float _1982 = _1980;
    if (_1960)
    {
        float _1984 = _1964 * _1976;
        _1970 = _1984;
    }
    float _1986 = _1970;
    if (_1960)
    {
        float _1988 = _1986 * 0.15915493667125701904296875;
        _1852 = _1988;
    }
    float _1990 = _1852;
    float _1992 = _1910;
    float _1994 = _1990;
    if (_1960)
    {
        float _1996 = _1990 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2004 = precise::max(0.0, _2002);
    float _2006 = _1942;
    float _2008 = _2004;
    float _2010 = _2002;
    if (_1960)
    {
        float _2012 = _1990 * 6.283185482025146484375;
        float _2014 = cos(_2012);
        _2006 = _2014;
    }
    float _2016 = _2006;
    float _2018 = -_1946;
    float _2020 = -_2004;
    float _2022 = fma(_1926, _2018, _2020);
    if (!_1960)
    {
        _1972 = _1950;
    }
    float _2024 = _1972;
    float _2026 = _2024;
    if (_1960)
    {
        float _2028 = _2022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2028;
    }
    float _2030 = _2008;
    float _2032 = _2000;
    float _2034 = _2030;
    if (_1960)
    {
        float _2036 = fma(_2000, _2030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2032 = _2036;
    }
    float _2038 = _2032;
    float _2040 = _2038;
    if (!_1960)
    {
        _2034 = _2022;
    }
    float _2042 = _2034;
    float _2044 = _2042;
    float _2046 = _2016;
    if (_1960)
    {
        float _2048 = _2016 + (-1.0);
        _2010 = _2048;
    }
    float _2050 = _2010;
    float _2052 = _2050;
    if (_1960)
    {
        float _2054 = _1980 * _2038;
        _2040 = _2054;
    }
    float _2056 = _2040;
    if (!_1960)
    {
        _1982 = _1948;
    }
    float _2058 = _1982;
    float _2060 = _2058;
    if (_1960)
    {
        float _2062 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2062;
    }
    float _2064 = _1994;
    if (_1960)
    {
        float _2066 = _1948 * _2056;
        _2060 = _2066;
    }
    float _2068 = _2060;
    if (!_1960)
    {
        _2052 = _1952;
    }
    float _2070 = _2052;
    float _2072 = _2070;
    if (_1960)
    {
        float _2074 = _1950 * _2056;
        _2026 = _2074;
    }
    float _2076 = _2026;
    if (_1960)
    {
        float _2078 = fma(_2022, _2016, _2064);
        _2044 = _2078;
    }
    float _2080 = _2044;
    if (_1960)
    {
        float _2082 = _2068 * _2068;
        _2072 = _2082;
    }
    float _2084 = _2072;
    if (!_1960)
    {
        _2046 = _1954;
    }
    float _2086 = _2046;
    float _2088 = _2086;
    if (_1960)
    {
        float _2090 = _2076 * _2076;
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = fma(_2080, _2080, _2084);
    float _2096 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2098 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2100 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2102 = _2094 + _2092;
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_1944, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2096);
    float _2112 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2114 = rsqrt(_2102);
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2110);
    float _2122 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2100);
    float _2124 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2126 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2112);
    float _2130 = abs(_2118);
    float _2132 = log2(_2130);
    float _2134 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2122);
    float _2136 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2138 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2128);
    float _2140 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2124);
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2144 = -_2136;
    float _2146 = fma(_2144, _2098, 1.0);
    float _2148 = _2138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2150 = _2114 * _2068;
    float _2152 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2154 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2140);
    float _2156 = _2114 * _2080;
    float _2158 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2152);
    float _2162 = _2114 * _2076;
    float _2164 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2166 = -_2158;
    float _2168 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2172 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2160);
    float _2174 = log2(_2146);
    float _2176 = -_2162;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2180 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2182 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2184 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2186 = fma(_2178, -0.5, 0.5);
    float _2188 = fma(_2178, 0.5, 0.5);
    float _2190 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2180);
    float _2192 = exp2(_2170);
    float _2194 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2184);
    float _2196 = _2156 + 1.0;
    float _2198 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2190);
    float _2200 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2194);
    float _2202 = 1.0 / _2182;
    float _2204 = fma(_2188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2206 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2208 = _2174 * 0.693147182464599609375;
    float _2210 = fma(_2188, _2204, -0.212114393711090087890625);
    float _2212 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2214 = sqrt(_2186);
    float _2216 = -_2156;
    float _2218 = fma(_2192, _2196, _2216);
    float _2220 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2198);
    float _2222 = fma(_2188, _2210, 1.570728778839111328125);
    float _2224 = fma(_2218, 0.5, 0.5);
    float _2226 = _2220 * _2202;
    float _2228 = _2206 * _2202;
    float _2230 = fma(_2226, 0.5, 0.5);
    float _2232 = fma(_2228, -0.5, 0.5);
    float _2234 = _2214 * 0.636619746685028076171875;
    float3 _5947 = float3(_2230, _2232, _2212);
    float _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).x;
    float _2238 = -_2222;
    float _2240 = fma(_2234, _2238, 1.0);
    float3 _5963 = float3(_2230, _2232, _2212);
    float4 _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5963, float3(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5963, float3(0.0), isnan(_5963)), level(0.0)).xyzw;
    float _2245 = _2243.x;
    float _2247 = _2243.y;
    float _2249 = _2243.z;
    float _2251 = _2243.w;
    float2 _5980 = float2(_2240, _2224);
    float3 _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5980, float2(0.0), isnan(_5980)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5980, float2(0.0), isnan(_5980)), level(0.0)).xyz;
    float _2257 = _2255.x;
    float _2259 = _2255.y;
    float _2261 = _2255.z;
    float _2263 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2267 = isnan(0.5);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2273 = _2269 || _2271;
    float _2275 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2263);
    float _2277 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2279 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2281 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2275);
    float _2283 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2277);
    float _2285 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    float _2287 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2289 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2283);
    float _2291 = _2212;
    float _2293 = _2279;
    float _2295 = _2132;
    if (!_2273)
    {
        _1668 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2297 = _1668;
    float _2299 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2285);
    float _2301 = 1.0 / _2287;
    float _2303 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2305 = _2297;
    if (!_2273)
    {
        _2291 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2307 = _2291;
    float _2309 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2299);
    if (_2273)
    {
        _2293 = 1.0;
    }
    float _2311 = _2293;
    float _2313 = _2303 + _2287;
    float _2315 = _2309 + _2182;
    out.gl_Position.x = _2220;
    out.gl_Position.y = _2206;
    out.gl_Position.z = _2309;
    out.gl_Position.w = _2182;
    float _2317 = _2313 * _2301;
    float _2319 = _2317 * 0.5;
    float _2321 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2323 = _2319;
    float _2325 = _2311;
    if (!_2273)
    {
        float _2327 = -_2297;
        float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2327);
        _2323 = _2329;
    }
    float _2331 = _2323;
    if (!_2273)
    {
        float _2333 = -_2307;
        float _2335 = _2333 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2305 = _2335;
    }
    float _2337 = _2305;
    float _2339 = exp2(_2321);
    float _2341 = _2331;
    if (!_2273)
    {
        float _2343 = 1.0 / _2331;
        _2341 = _2343;
    }
    float _2345 = _2341;
    float _2347 = _2281;
    if (!_2273)
    {
        float _2349 = 1.0 / _2337;
        _2347 = _2349;
    }
    float _2351 = _2347;
    float _2353 = -_2339;
    float _2355 = _2353 + 1.0;
    float _2357 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2273)
    {
        float _2359 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2361 = -_2307;
        float _2363 = fma(_2345, _2359, _2361);
        _2295 = _2363;
    }
    float _2365 = _2295;
    if (!_2273)
    {
        float _2367 = _2365 * _2351;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        _2325 = _2369;
    }
    float _2371 = _2325;
    float _2373 = _2315 * 0.5;
    float _2375 = _2371 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2377 = _2371 > 0.0;
    bool _2379 = isnan(_2371);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    out.m_67.z = _2373;
    out.m_67.w = _2182;
    float _2387 = _2375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2387;
    float _2389 = _2357 * _2236;
    float _2391 = -_2357;
    float _2393 = _2391 + 1.0;
    float _2395 = _2251 * _2389;
    float _2397 = _2261 * _2389;
    float _2399 = fma(_2257, _2395, _2245);
    float _2401 = fma(_2259, _2395, _2247);
    float _2403 = _2251 * _2393;
    float _2405 = fma(_2251, _2397, _2249);
    out.m_69.x = _2399;
    out.m_69.y = _2401;
    out.m_69.z = _2405;
    out.m_69.w = _2403;
    if (_2385)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2407 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2407;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1068 = false;
    bool _900 = false;
    bool _796 = false;
    bool _466 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2464 = as_type<float>(_104);
        out.gl_Position.z = _2464;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2534 = as_type<float>(_142);
        out.gl_Position.z = _2534;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _314 * _352;
    float _376 = _298 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_362, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = in.m_49.x;
    float _394 = in.m_49.y;
    float _396 = in.m_49.z;
    float _398 = _386 * _368;
    float _400 = _388 * _368;
    float _402 = _390 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    float _444 = _438 * _396;
    bool _446 = !_364;
    float _464;
    if (!_446)
    {
        float _448 = in.m_51.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_88);
        float _470 = 1.0 / _468;
        float _472 = _122 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _478 = _474 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _498;
    bool _502 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _504 = isnan(_474);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _490;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _474 + _516;
    bool _520 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _522 = isnan(_474);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = 1.0 / _486;
    float _534 = _518 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _538 = _474 + _536;
    bool _540 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _542 = isnan(_474);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _558 = 1.0 / _494;
    float _560 = _538 * _514;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _564 = _474 + _562;
    bool _566 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _568 = isnan(_474);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = fma(_554, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _584 = 1.0 / _500;
    float _586 = _478 * _532;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _590 = _474 + _588;
    bool _592 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _594 = isnan(_474);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _564 * _558;
    float _606 = -_576;
    float _608 = _606 + 1.0;
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _618;
    float _622 = _550 * _608;
    float _624 = _512 * _580;
    float _626 = -_512;
    float _628 = _626 + 1.0;
    float _630 = _590 * _584;
    bool _632 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _634 = isnan(_474);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = _602 * _628;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _658 = _642 * _612;
    float _660 = -_642;
    float _662 = _660 + 1.0;
    float _664 = fma(_616, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = fma(_652, _586, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _668 = fma(_656, _586, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _670 = fma(_646, _586, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _672 = _530 * _662;
    float _674 = fma(_620, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _676 = -_530;
    float _678 = _676 + 1.0;
    float _680 = _664 * _672;
    float _682 = _582 * _672;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _684;
    float _688 = _674 * _672;
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].x, _680);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _692;
    float _696 = fma(_686, _560, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _698 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].z, _688);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _704;
    float _708 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].y, _682);
    float _710 = fma(_666, _658, _690);
    float _712 = fma(_702, _604, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _714 = fma(_670, _658, _698);
    float _716 = fma(_694, _560, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _718 = fma(_706, _560, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _720 = fma(_668, _658, _708);
    float _722 = fma(_696, _648, _710);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _732 = fma(_716, _648, _720);
    float _734 = fma(_726, _604, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _740;
    float _744 = fma(_730, _604, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _746 = fma(_718, _648, _714);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _748;
    float _752 = fma(_738, _630, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _754 = fma(_742, _630, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _756 = fma(_712, _624, _722);
    float _758 = fma(_750, _630, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _760 = fma(_734, _624, _732);
    float _762 = fma(_744, _624, _746);
    float _764 = fma(_752, _622, _756);
    float _766 = fma(_754, _622, _760);
    float _768 = fma(_758, _622, _762);
    float _770 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].x, _764);
    float _772 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].y, _766);
    float _774 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].z, _768);
    bool _776 = !_556;
    float _794;
    if (!_776)
    {
        float _778 = in.m_51.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_88);
        float _800 = 1.0 / _798;
        float _802 = _122 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    bool _806 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _808 = isnan(_804);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _824 = isnan(_804);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _804 + _838;
    float _842 = -_816;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _848 = 1.0 / _820;
    float _850 = _832 * _844;
    float _852 = -_832;
    float _854 = _852 + 1.0;
    float _856 = _836 * _848;
    float _858 = _774 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _860 = fma(_856, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _862 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _866 = _860 * _850;
    float _868 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[115].x, _866);
    float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[116].x, _870);
    float _878 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _872;
    out.m_53.y = _874;
    out.m_53.z = _864;
    out.m_53.w = _878;
    bool _880 = !_846;
    float _898;
    if (!_880)
    {
        float _882 = in.m_51.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_88);
        float _904 = 1.0 / _902;
        float _906 = _122 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _912 = _908 + _910;
    bool _914 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _916 = isnan(_908);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _928 = _908 + _926;
    bool _930 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _932 = isnan(_908);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _942;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _950 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _952 = isnan(_908);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = -_924;
    float _964 = _962 + 1.0;
    float _966 = 1.0 / _944;
    float _968 = _960 * _964;
    float _970 = -_960;
    float _972 = _970 + 1.0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _974;
    bool _978 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _980 = 1.0 / _948;
    float _982 = _940 * _972;
    float _984 = -_940;
    float _986 = _984 + 1.0;
    float _988 = _912 * _966;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _994;
    float _998 = fma(_976, _988, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1000 = fma(_992, _988, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1002 = fma(_996, _988, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1004 = _928 * _980;
    float _1006 = _998 * _982;
    float _1008 = _1000 * _982;
    float _1010 = _1002 * _982;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1024 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1006);
    float _1026 = fma(_1014, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1028 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1030 = fma(_1022, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1032 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1008);
    float _1034 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1010);
    float _1036 = fma(_1026, _968, _1024);
    float _1038 = fma(_1028, _968, _1032);
    float _1040 = fma(_1030, _968, _1034);
    float _1042 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1036);
    float _1044 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1038);
    float _1046 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1040);
    bool _1048 = !_978;
    float _1066;
    if (!_1048)
    {
        float _1050 = in.m_51.x;
        float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1054 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1058 = _1056 * _1052;
        float _1060 = floor(_1058);
        float _1062 = -_1060;
        float _1064 = _1058 + _1062;
        _1066 = _1064;
        _1068 = true;
    }
    else
    {
        float _1070 = float(_88);
        float _1072 = 1.0 / _1070;
        float _1074 = _122 * _1072;
        _1066 = _1074;
    }
    _1068 = false;
    float _1076 = _1066;
    float _1078 = in.m_55.x;
    float _1080 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1082 = in.m_51.x;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1086 = _1084 != 0;
    float _1088 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1092 = _1090 != 0;
    float _1094 = in.m_51.w;
    float _1096 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1098 = in.m_51.z;
    float _1100 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1080);
    float _1102 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1088);
    float _1104 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1096);
    float _1106 = in.m_51.y;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1110 = _1108 != 0;
    float _1112 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1114 = log2(_1112);
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1118 = _1116 != 0;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1120 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1100);
    float _1122 = in.m_55.y;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    int _1126 = 1065353216;
    if (_1092)
    {
        float _1128 = -_1078;
        float _1130 = _1128 + 1.0;
        _1124 = as_type<int>(_1130);
    }
    int _1132 = _1124;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1138 = false;
    if (_1086)
    {
        bool _1140 = _1082 > 0.5;
        _1138 = _1140;
    }
    bool _1142 = _1138;
    float _1144 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1102);
    float _1146 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1104);
    float _1148 = _1094;
    bool _1150 = _1142;
    if (_1086)
    {
        float _1152 = -_1078;
        float _1154 = _1152 + 1.0;
        _1126 = as_type<int>(_1154);
    }
    int _1156 = _1126;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1160 = 1.0 + _1158;
    bool _1162 = _1094 > 0.5;
    float _1164 = _1098 * 2.0;
    float _1166 = as_type<float>(_1156);
    if (!_1086)
    {
        _1148 = _1078;
    }
    float _1168 = _1148;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1174 = _1168;
    if (_1086)
    {
        float _1176 = _1142 ? as_type<float>(_1156) : _1078;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1182 = _1122;
    if (_1092)
    {
        bool _1184 = _1098 > 0.5;
        _1150 = _1184;
    }
    bool _1186 = _1150;
    float _1188 = 1.0 / _1172;
    if (!_1092)
    {
        _1166 = _1078;
    }
    float _1190 = _1166;
    float _1192 = fma(_1180, -2.0, _1136);
    float _1194 = _1190;
    if (_1092)
    {
        float _1196 = _1186 ? as_type<float>(_1132) : _1078;
        _1194 = _1196;
    }
    float _1198 = _1194;
    float _1200 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1202 = -_1122;
    float _1204 = _1202 + 1.0;
    float _1206 = _1106 * 2.0;
    float _1208 = -_1134;
    float _1210 = fma(_1200, 2.0, _1208);
    float _1212 = 1.0 / _1160;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1214;
    float _1218 = _1082 * 2.0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1230 = _1228 != 0;
    float _1232 = _1106 + _1098;
    bool _1234 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1236 = isnan(_1076);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1192);
    float _1248 = floor(_1164);
    float _1250 = _1232 + (-1.0);
    float _1252 = _1216 * _1188;
    float _1254 = _1144 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1256 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1258 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1260 = _1082 + _1106;
    int _1262 = _1162 ? as_type<int>(_1204) : as_type<int>(_1122);
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1266 = _1114 * _122;
    float _1268 = _1260 + (-1.0);
    float _1270 = _1110 ? as_type<float>(_1262) : _1122;
    float _1272 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1274 = _1106 > 0.5;
    float _1276 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = exp2(_1266);
    bool _1280 = _1248 > 0.0;
    float _1282 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1284 = _1248 >= 0.0;
    bool _1286 = isnan(_1248);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1296 = _1076 + _1294;
    if (_1118)
    {
        float _1298 = _1274 ? _1204 : _1122;
        _1182 = _1298;
    }
    float _1300 = _1182;
    float _1302 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_1252, _1296, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1316 = floor(_1206);
    float _1318 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1320 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1328 = _1324 || _1326;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1332 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = isnan(_1076);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1278;
    float _1346 = _1344 + 1.0;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1350 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1330);
    float _1352 = -_122;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1210);
    float _1356 = floor(_1218);
    float _1358 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1348);
    float _1360 = _1328 ? _1346 : 0.0;
    float _1362 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    float _1364 = -_1342;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1358);
    float _1370 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1312)
    {
        float _1372 = _1360 * _1212;
        _124 = _1372;
    }
    float _1374 = _124;
    int _1376 = _1292 ? 0 : 1;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1380 = _1244 * _1366;
    bool _1382 = _1316 >= 0.0;
    bool _1384 = isnan(_1316);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(0.0);
    bool _1390 = _1386 || _1388;
    float _1392 = -_1244;
    float _1394 = _1392 + 1.0;
    int _1396 = ~_1376;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = _1314 * _1380;
    int _1404 = _1400;
    if (!_1280)
    {
        int _1406 = ~_1376;
        int _1408 = _1406 + 1;
        _1404 = _1408;
    }
    int _1410 = _1404;
    float _1412 = fma(_1370, _1300, -0.5);
    float _1414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1416 = _1316 > 0.0;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1254 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1424 = _1256 + _1422;
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1402);
    bool _1428 = _1356 > 0.0;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1432 = -_1246;
    float _1434 = fma(_1368, _1412, _1432);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1438 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1430);
    float _1442 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1426);
    bool _1444 = _1356 >= 0.0;
    bool _1446 = isnan(_1356);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = fma(_1438, _1178, -0.5);
    float _1456 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1272 + _1458;
    float _1462 = _1452 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1464 = fma(_1362, _1454, _1354);
    float _1466 = _1456 * _1414;
    float _1468 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1440);
    int _1470 = ~as_type<int>(_1462);
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    float _1476 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1478 = _1474;
    float _1480 = _1462;
    if (!_1428)
    {
        int _1482 = ~as_type<int>(_1462);
        int _1484 = _1482 + 1;
        _1478 = _1484;
    }
    int _1486 = _1478;
    float _1488 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1490 = _1282 * _1436;
    float _1492 = _1420 * _1420;
    bool _1494 = _1468 >= 0.0;
    float _1496 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1498 = !_1226;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = fma(_1424, _1424, _1492);
    float _1504 = _1442 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1506 = abs(_1500);
    float _1508 = fma(_1460, _1460, _1502);
    float _1510 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1434 + 0.5;
    float _1514 = in.m_59.x;
    float _1516 = in.m_59.y;
    float _1518 = in.m_59.z;
    float _1520 = _1464 + 0.5;
    int _1522 = _1390 ? 0 : 1;
    float _1524 = rsqrt(_1508);
    if (_1494)
    {
        _1480 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1526 = _1480;
    out.m_61.x = _1476;
    out.m_61.y = _1496;
    out.m_61.z = _1510;
    out.m_61.w = _1504;
    bool _1528 = !_1222;
    int _1530 = _1528 ? 0 : 1;
    int _1532 = ~_1522;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    int _1538 = as_type<int>(_1526);
    int _1540 = _1536;
    if (_1494)
    {
        float _1542 = _1526 * 5.0;
        _1538 = as_type<int>(_1542);
    }
    int _1544 = _1538;
    out.m_63.x = _1520;
    out.m_63.y = _1512;
    out.m_63.z = _1490;
    out.m_63.w = _1466;
    if (!_1416)
    {
        int _1546 = ~_1522;
        int _1548 = _1546 + 1;
        _1540 = _1548;
    }
    int _1550 = _1540;
    int _1552 = abs(_1530);
    if (_1494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4817 = as_type<float>(_1544);
        out.gl_Position.z = _4817;
    }
    bool _1554 = !_1230;
    int _1556 = _1554 ? 0 : 1;
    if (_1494)
    {
        out.m_45.x = 0.0;
    }
    float _1558 = _1420 * _1524;
    float _1560 = _1424 * _1524;
    if (_1494)
    {
        return out;
    }
    float _1562 = -_1558;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1254);
    float _1566 = float(_1552);
    float _1568 = -_1560;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1572 = float(_1410);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1564 + _1574;
    float _1578 = float(_1506);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1570 + _1580;
    float _1584 = float(_1486);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1588 = _1566 * _1572;
    float _1590 = _1460 * _1524;
    int _1592 = abs(_1556);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1586);
    float _1596 = _1588 * (-2.0);
    float _1598 = -_1590;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1602 = _1578 * _1584;
    float _1604 = fma(_1596, _1514, _1514);
    float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1608 = _1600 + _1606;
    float _1610 = float(_1550);
    float _1612 = _1602 * (-2.0);
    float _1614 = float(_1592);
    float _1616 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1594);
    float _1618 = _1082 + (-0.5);
    float _1620 = -_1558;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1624 = _1106 + (-0.5);
    float _1626 = _1614 * _1610;
    float _1628 = fma(_1258, _1612, _1258);
    float _1630 = fma(_1612, _1516, _1516);
    bool _1632 = _1616 >= 0.0;
    float _1634 = fma(_1276, _1596, _1276);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1604);
    float _1638 = -_1560;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1642 = _1622 * _1622;
    float _1644 = _1082 + _1098;
    float _1646 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1630);
    float _1648 = fma(_1634, _1374, _1636);
    float _1650 = fma(_1640, _1640, _1642);
    float _1652 = -_1590;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1460);
    float _1656 = _1644 + (-1.0);
    float _1658 = fma(_1628, _1374, _1646);
    float _1660 = _1648 * 0.15915493667125701904296875;
    float _1662 = fma(_1654, _1654, _1650);
    float _1664 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1666 = _1630;
    float _1668 = _1600;
    if (_1632)
    {
        _1666 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1670 = _1666;
    float _1672 = _1658 * 0.15915493667125701904296875;
    float _1674 = _1660 * 6.283185482025146484375;
    float _1676 = sin(_1674);
    float _1678 = _1626 * (-2.0);
    int _1680 = as_type<int>(_1670);
    if (_1632)
    {
        out.m_45.x = 0.0;
    }
    if (_1632)
    {
        float _1682 = _1670 * 5.0;
        _1680 = as_type<int>(_1682);
    }
    int _1684 = _1680;
    float _1686 = fma(_1678, _1518, _1518);
    float _1688 = _1098 + (-0.5);
    float _1690 = _1660 * 6.283185482025146484375;
    float _1692 = cos(_1690);
    if (_1632)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5054 = as_type<float>(_1684);
        out.gl_Position.z = _5054;
    }
    float _1694 = sqrt(_1662);
    if (_1632)
    {
        return out;
    }
    float _1696 = in.m_65.x;
    float _1698 = in.m_65.y;
    float _1700 = in.m_65.z;
    float _1702 = fma(_1664, _1678, _1664);
    float _1704 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1686);
    float _1706 = _1672 * 6.283185482025146484375;
    float _1708 = sin(_1706);
    float _1710 = _1524 * _1694;
    float _1712 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1714 = fma(_1702, _1374, _1704);
    float _1716 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1718 = _1710 * _1712;
    float _1720 = _1714 * 0.15915493667125701904296875;
    float _1722 = _1672 * 6.283185482025146484375;
    float _1724 = cos(_1722);
    float _1726 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1728 = _1710 * _1716;
    float _1730 = _1710 * _1726;
    float _1732 = _1720 * 6.283185482025146484375;
    float _1734 = cos(_1732);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1698);
    float _1738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1696);
    float _1740 = _1676 * _1708;
    float _1742 = _1720 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = _1718 * _1736;
    float _1748 = _1692 * _1724;
    float _1750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1700);
    float _1752 = _1692 * _1708;
    float _1754 = _1730 * _1738;
    float _1756 = _1676 * _1724;
    float _1758 = _1728 * _1750;
    float _1760 = _1734 * _1746;
    float _1762 = _1708 * _1734;
    float _1764 = _1724 * _1734;
    float _1766 = _1692 * _1760;
    float _1768 = fma(_1744, _1748, _1740);
    float _1770 = -_1746;
    float _1772 = _1744 * _1770;
    float _1774 = fma(_1744, _1740, _1748);
    float _1776 = fma(_1768, _1754, _1766);
    float _1778 = -_1756;
    float _1780 = fma(_1744, _1752, _1778);
    float _1782 = -_1752;
    float _1784 = fma(_1744, _1756, _1782);
    float _1786 = _1676 * _1760;
    float _1788 = fma(_1764, _1754, _1772);
    float _1790 = fma(_1780, _1758, _1776);
    float _1792 = fma(_1784, _1754, _1786);
    float _1794 = fma(_1762, _1758, _1788);
    float _1796 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1798 = fma(_1774, _1758, _1792);
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1802 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1796);
    float _1804 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1800);
    float _1806 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1802);
    float _1808 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1810 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1812 = _1808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1814 = _1272 + _1810;
    float _1816 = _1256 + _1812;
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1820 = _1814 + _1818;
    float _1822 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1826 = _1816 + _1824;
    float _1828 = _1820 * _1820;
    float _1830 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1822);
    float _1832 = fma(_1826, _1826, _1828);
    float _1834 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1830);
    float _1836 = sqrt(_1832);
    float _1838 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1840 = _1254 + _1838;
    bool _1842 = _1836 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = _1838;
    float _1846 = _1834;
    float _1848 = _1806;
    float _1850 = _1790;
    float _1852 = _1826;
    if (!_1842)
    {
        _1844 = _1816;
    }
    float _1854 = _1844;
    float _1856 = _1854;
    if (!_1842)
    {
        _1846 = _1814;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (!_1842)
    {
        _1848 = _1840;
    }
    float _1862 = _1848;
    bool _1864 = !_1842;
    float _1866 = _1862;
    if (!_1864)
    {
        float _1868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1872 = _1836 + _1870;
        float _1874 = rsqrt(_1832);
        float _1876 = _1872 * _1868;
        float _1878 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1880 = _1876 * 0.15915493667125701904296875;
        float _1882 = _1880 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        float _1886 = _1880 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        float _1890 = _1884 + (-1.0);
        float _1892 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = fma(_1888, _1878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1896 = fma(_1840, _1884, _1892);
        float _1898 = _1874 * _1894;
        float _1900 = fma(_1826, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = fma(_1820, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1866 = _1896;
        _1856 = _1900;
        _1860 = _1902;
        _1850 = _1880;
    }
    float _1904 = _1866;
    float _1906 = _1856;
    float _1908 = _1860;
    float _1910 = _1850;
    float _1912 = -_1558;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1904);
    float _1916 = -_1560;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1906);
    float _1920 = -_1590;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1908);
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1914 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1930 = _1918 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1934 = _1922 + _1932;
    float _1936 = _1926 * _1926;
    float _1938 = fma(_1930, _1930, _1936);
    float _1940 = fma(_1934, _1934, _1938);
    float _1942 = rsqrt(_1940);
    float _1944 = sqrt(_1940);
    float _1946 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1948 = _1930 * _1946;
    float _1950 = _1934 * _1946;
    float _1952 = _1948 * _1948;
    float _1954 = _1950 * _1950;
    float _1956 = _1952 + _1954;
    float _1958 = sqrt(_1956);
    bool _1960 = _1958 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1964 = _1958 + _1962;
    float _1966 = _1934;
    float _1968 = _1936;
    float _1970 = _1964;
    float _1972 = _1926;
    if (_1960)
    {
        float _1974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1966 = _1974;
    }
    float _1976 = _1966;
    if (_1960)
    {
        float _1978 = rsqrt(_1956);
        _1968 = _1978;
    }
    float _1980 = _1968;
    float _1982 = _1980;
    if (_1960)
    {
        float _1984 = _1964 * _1976;
        _1970 = _1984;
    }
    float _1986 = _1970;
    if (_1960)
    {
        float _1988 = _1986 * 0.15915493667125701904296875;
        _1852 = _1988;
    }
    float _1990 = _1852;
    float _1992 = _1910;
    float _1994 = _1990;
    if (_1960)
    {
        float _1996 = _1990 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2004 = precise::max(0.0, _2002);
    float _2006 = _1942;
    float _2008 = _2004;
    float _2010 = _2002;
    if (_1960)
    {
        float _2012 = _1990 * 6.283185482025146484375;
        float _2014 = cos(_2012);
        _2006 = _2014;
    }
    float _2016 = _2006;
    float _2018 = -_1946;
    float _2020 = -_2004;
    float _2022 = fma(_1926, _2018, _2020);
    if (!_1960)
    {
        _1972 = _1950;
    }
    float _2024 = _1972;
    float _2026 = _2024;
    if (_1960)
    {
        float _2028 = _2022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2028;
    }
    float _2030 = _2008;
    float _2032 = _2000;
    float _2034 = _2030;
    if (_1960)
    {
        float _2036 = fma(_2000, _2030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2032 = _2036;
    }
    float _2038 = _2032;
    float _2040 = _2038;
    if (!_1960)
    {
        _2034 = _2022;
    }
    float _2042 = _2034;
    float _2044 = _2042;
    float _2046 = _2016;
    if (_1960)
    {
        float _2048 = _2016 + (-1.0);
        _2010 = _2048;
    }
    float _2050 = _2010;
    float _2052 = _2050;
    if (_1960)
    {
        float _2054 = _1980 * _2038;
        _2040 = _2054;
    }
    float _2056 = _2040;
    if (!_1960)
    {
        _1982 = _1948;
    }
    float _2058 = _1982;
    float _2060 = _2058;
    if (_1960)
    {
        float _2062 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2062;
    }
    float _2064 = _1994;
    if (_1960)
    {
        float _2066 = _1948 * _2056;
        _2060 = _2066;
    }
    float _2068 = _2060;
    if (!_1960)
    {
        _2052 = _1952;
    }
    float _2070 = _2052;
    float _2072 = _2070;
    if (_1960)
    {
        float _2074 = _1950 * _2056;
        _2026 = _2074;
    }
    float _2076 = _2026;
    if (_1960)
    {
        float _2078 = fma(_2022, _2016, _2064);
        _2044 = _2078;
    }
    float _2080 = _2044;
    if (_1960)
    {
        float _2082 = _2068 * _2068;
        _2072 = _2082;
    }
    float _2084 = _2072;
    if (!_1960)
    {
        _2046 = _1954;
    }
    float _2086 = _2046;
    float _2088 = _2086;
    if (_1960)
    {
        float _2090 = _2076 * _2076;
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = fma(_2080, _2080, _2084);
    float _2096 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2098 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2100 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2102 = _2094 + _2092;
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_1944, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2096);
    float _2112 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2114 = rsqrt(_2102);
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2110);
    float _2122 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2100);
    float _2124 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2126 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2112);
    float _2130 = abs(_2118);
    float _2132 = log2(_2130);
    float _2134 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2122);
    float _2136 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2138 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2128);
    float _2140 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2124);
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2144 = -_2136;
    float _2146 = fma(_2144, _2098, 1.0);
    float _2148 = _2138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2150 = _2114 * _2068;
    float _2152 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2154 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2140);
    float _2156 = _2114 * _2080;
    float _2158 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2152);
    float _2162 = _2114 * _2076;
    float _2164 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2166 = -_2158;
    float _2168 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2172 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2160);
    float _2174 = log2(_2146);
    float _2176 = -_2162;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2180 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2182 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2184 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2186 = fma(_2178, -0.5, 0.5);
    float _2188 = fma(_2178, 0.5, 0.5);
    float _2190 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2180);
    float _2192 = exp2(_2170);
    float _2194 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2184);
    float _2196 = _2156 + 1.0;
    float _2198 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2190);
    float _2200 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2194);
    float _2202 = 1.0 / _2182;
    float _2204 = fma(_2188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2206 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2208 = _2174 * 0.693147182464599609375;
    float _2210 = fma(_2188, _2204, -0.212114393711090087890625);
    float _2212 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2214 = sqrt(_2186);
    float _2216 = -_2156;
    float _2218 = fma(_2192, _2196, _2216);
    float _2220 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2198);
    float _2222 = fma(_2188, _2210, 1.570728778839111328125);
    float _2224 = fma(_2218, 0.5, 0.5);
    float _2226 = _2220 * _2202;
    float _2228 = _2206 * _2202;
    float _2230 = fma(_2226, 0.5, 0.5);
    float _2232 = fma(_2228, -0.5, 0.5);
    float _2234 = _2214 * 0.636619746685028076171875;
    float3 _5947 = float3(_2230, _2232, _2212);
    float _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).x;
    float _2238 = -_2222;
    float _2240 = fma(_2234, _2238, 1.0);
    float3 _5963 = float3(_2230, _2232, _2212);
    float4 _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5963, float3(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5963, float3(0.0), isnan(_5963)), level(0.0)).xyzw;
    float _2245 = _2243.x;
    float _2247 = _2243.y;
    float _2249 = _2243.z;
    float _2251 = _2243.w;
    float2 _5980 = float2(_2240, _2224);
    float3 _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5980, float2(0.0), isnan(_5980)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5980, float2(0.0), isnan(_5980)), level(0.0)).xyz;
    float _2257 = _2255.x;
    float _2259 = _2255.y;
    float _2261 = _2255.z;
    float _2263 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2267 = isnan(0.5);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2273 = _2269 || _2271;
    float _2275 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2263);
    float _2277 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2279 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2281 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2275);
    float _2283 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2277);
    float _2285 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    float _2287 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2289 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2283);
    float _2291 = _2212;
    float _2293 = _2279;
    float _2295 = _2132;
    if (!_2273)
    {
        _1668 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2297 = _1668;
    float _2299 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2285);
    float _2301 = 1.0 / _2287;
    float _2303 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2305 = _2297;
    if (!_2273)
    {
        _2291 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2307 = _2291;
    float _2309 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2299);
    if (_2273)
    {
        _2293 = 1.0;
    }
    float _2311 = _2293;
    float _2313 = _2303 + _2287;
    float _2315 = _2309 + _2182;
    out.gl_Position.x = _2220;
    out.gl_Position.y = _2206;
    out.gl_Position.z = _2309;
    out.gl_Position.w = _2182;
    float _2317 = _2313 * _2301;
    float _2319 = _2317 * 0.5;
    float _2321 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2323 = _2319;
    float _2325 = _2311;
    if (!_2273)
    {
        float _2327 = -_2297;
        float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2327);
        _2323 = _2329;
    }
    float _2331 = _2323;
    if (!_2273)
    {
        float _2333 = -_2307;
        float _2335 = _2333 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2305 = _2335;
    }
    float _2337 = _2305;
    float _2339 = exp2(_2321);
    float _2341 = _2331;
    if (!_2273)
    {
        float _2343 = 1.0 / _2331;
        _2341 = _2343;
    }
    float _2345 = _2341;
    float _2347 = _2281;
    if (!_2273)
    {
        float _2349 = 1.0 / _2337;
        _2347 = _2349;
    }
    float _2351 = _2347;
    float _2353 = -_2339;
    float _2355 = _2353 + 1.0;
    float _2357 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2273)
    {
        float _2359 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2361 = -_2307;
        float _2363 = fma(_2345, _2359, _2361);
        _2295 = _2363;
    }
    float _2365 = _2295;
    if (!_2273)
    {
        float _2367 = _2365 * _2351;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        _2325 = _2369;
    }
    float _2371 = _2325;
    float _2373 = _2315 * 0.5;
    float _2375 = _2371 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2377 = _2371 > 0.0;
    bool _2379 = isnan(_2371);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    out.m_67.z = _2373;
    out.m_67.w = _2182;
    float _2387 = _2375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2387;
    float _2389 = _2357 * _2236;
    float _2391 = -_2357;
    float _2393 = _2391 + 1.0;
    float _2395 = _2251 * _2389;
    float _2397 = _2261 * _2389;
    float _2399 = fma(_2257, _2395, _2245);
    float _2401 = fma(_2259, _2395, _2247);
    float _2403 = _2251 * _2393;
    float _2405 = fma(_2251, _2397, _2249);
    out.m_69.x = _2399;
    out.m_69.y = _2401;
    out.m_69.z = _2405;
    out.m_69.w = _2403;
    if (_2385)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2407 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2407;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1068 = false;
    bool _900 = false;
    bool _796 = false;
    bool _466 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2464 = as_type<float>(_104);
        out.gl_Position.z = _2464;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2534 = as_type<float>(_142);
        out.gl_Position.z = _2534;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _334;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _366 = 1.0 / _330;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _314 * _352;
    float _376 = _298 * _366;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_362, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = fma(_384, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = in.m_49.x;
    float _394 = in.m_49.y;
    float _396 = in.m_49.z;
    float _398 = _386 * _368;
    float _400 = _388 * _368;
    float _402 = _390 * _368;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _418 = fma(_406, _374, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _374, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _424 = fma(_414, _374, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _428 = fma(_418, _354, _416);
    float _430 = fma(_420, _354, _422);
    float _432 = fma(_424, _354, _426);
    float _434 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].x, _428);
    float _436 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].y, _430);
    float _438 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[145].z, _432);
    float _440 = _434 * _392;
    float _442 = _436 * _394;
    float _444 = _438 * _396;
    bool _446 = !_364;
    float _464;
    if (!_446)
    {
        float _448 = in.m_51.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        float _468 = float(_88);
        float _470 = 1.0 / _468;
        float _472 = _122 * _470;
        _464 = _472;
    }
    _466 = false;
    float _474 = _464;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _478 = _474 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _498;
    bool _502 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _504 = isnan(_474);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _490;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _474 + _516;
    bool _520 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _522 = isnan(_474);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = 1.0 / _486;
    float _534 = _518 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _538 = _474 + _536;
    bool _540 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _542 = isnan(_474);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _558 = 1.0 / _494;
    float _560 = _538 * _514;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _564 = _474 + _562;
    bool _566 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _568 = isnan(_474);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -_550;
    float _580 = _578 + 1.0;
    float _582 = fma(_554, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _584 = 1.0 / _500;
    float _586 = _478 * _532;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _590 = _474 + _588;
    bool _592 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _594 = isnan(_474);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = _564 * _558;
    float _606 = -_576;
    float _608 = _606 + 1.0;
    float _610 = -_602;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _618;
    float _622 = _550 * _608;
    float _624 = _512 * _580;
    float _626 = -_512;
    float _628 = _626 + 1.0;
    float _630 = _590 * _584;
    bool _632 = _474 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _634 = isnan(_474);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _648 = _602 * _628;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _658 = _642 * _612;
    float _660 = -_642;
    float _662 = _660 + 1.0;
    float _664 = fma(_616, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = fma(_652, _586, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _668 = fma(_656, _586, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _670 = fma(_646, _586, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _672 = _530 * _662;
    float _674 = fma(_620, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _676 = -_530;
    float _678 = _676 + 1.0;
    float _680 = _664 * _672;
    float _682 = _582 * _672;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _684;
    float _688 = _674 * _672;
    float _690 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].x, _680);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _692;
    float _696 = fma(_686, _560, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _698 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].z, _688);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _704;
    float _708 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[107].y, _682);
    float _710 = fma(_666, _658, _690);
    float _712 = fma(_702, _604, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _714 = fma(_670, _658, _698);
    float _716 = fma(_694, _560, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _718 = fma(_706, _560, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _720 = fma(_668, _658, _708);
    float _722 = fma(_696, _648, _710);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _732 = fma(_716, _648, _720);
    float _734 = fma(_726, _604, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _740;
    float _744 = fma(_730, _604, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _746 = fma(_718, _648, _714);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _748;
    float _752 = fma(_738, _630, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _754 = fma(_742, _630, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _756 = fma(_712, _624, _722);
    float _758 = fma(_750, _630, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _760 = fma(_734, _624, _732);
    float _762 = fma(_744, _624, _746);
    float _764 = fma(_752, _622, _756);
    float _766 = fma(_754, _622, _760);
    float _768 = fma(_758, _622, _762);
    float _770 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].x, _764);
    float _772 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].y, _766);
    float _774 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[112].z, _768);
    bool _776 = !_556;
    float _794;
    if (!_776)
    {
        float _778 = in.m_51.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        float _798 = float(_88);
        float _800 = 1.0 / _798;
        float _802 = _122 * _800;
        _794 = _802;
    }
    _796 = false;
    float _804 = _794;
    bool _806 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _808 = isnan(_804);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _824 = isnan(_804);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _804 + _838;
    float _842 = -_816;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _848 = 1.0 / _820;
    float _850 = _832 * _844;
    float _852 = -_832;
    float _854 = _852 + 1.0;
    float _856 = _836 * _848;
    float _858 = _774 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _860 = fma(_856, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _862 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _866 = _860 * _850;
    float _868 = _770 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[115].x, _866);
    float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[116].x, _870);
    float _878 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _872;
    out.m_53.y = _874;
    out.m_53.z = _864;
    out.m_53.w = _878;
    bool _880 = !_846;
    float _898;
    if (!_880)
    {
        float _882 = in.m_51.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_88);
        float _904 = 1.0 / _902;
        float _906 = _122 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _912 = _908 + _910;
    bool _914 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _916 = isnan(_908);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _928 = _908 + _926;
    bool _930 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _932 = isnan(_908);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _942;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _950 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _952 = isnan(_908);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = -_924;
    float _964 = _962 + 1.0;
    float _966 = 1.0 / _944;
    float _968 = _960 * _964;
    float _970 = -_960;
    float _972 = _970 + 1.0;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _974;
    bool _978 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _980 = 1.0 / _948;
    float _982 = _940 * _972;
    float _984 = -_940;
    float _986 = _984 + 1.0;
    float _988 = _912 * _966;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _994;
    float _998 = fma(_976, _988, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1000 = fma(_992, _988, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1002 = fma(_996, _988, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1004 = _928 * _980;
    float _1006 = _998 * _982;
    float _1008 = _1000 * _982;
    float _1010 = _1002 * _982;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1024 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1006);
    float _1026 = fma(_1014, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1028 = fma(_1018, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1030 = fma(_1022, _1004, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1032 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1008);
    float _1034 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1010);
    float _1036 = fma(_1026, _968, _1024);
    float _1038 = fma(_1028, _968, _1032);
    float _1040 = fma(_1030, _968, _1034);
    float _1042 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1036);
    float _1044 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1038);
    float _1046 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1040);
    bool _1048 = !_978;
    float _1066;
    if (!_1048)
    {
        float _1050 = in.m_51.x;
        float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1054 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1058 = _1056 * _1052;
        float _1060 = floor(_1058);
        float _1062 = -_1060;
        float _1064 = _1058 + _1062;
        _1066 = _1064;
        _1068 = true;
    }
    else
    {
        float _1070 = float(_88);
        float _1072 = 1.0 / _1070;
        float _1074 = _122 * _1072;
        _1066 = _1074;
    }
    _1068 = false;
    float _1076 = _1066;
    float _1078 = in.m_55.x;
    float _1080 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1082 = in.m_51.x;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1086 = _1084 != 0;
    float _1088 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1092 = _1090 != 0;
    float _1094 = in.m_51.w;
    float _1096 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1098 = in.m_51.z;
    float _1100 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1080);
    float _1102 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1088);
    float _1104 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1096);
    float _1106 = in.m_51.y;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1110 = _1108 != 0;
    float _1112 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1114 = log2(_1112);
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1118 = _1116 != 0;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1120 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1100);
    float _1122 = in.m_55.y;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    int _1126 = 1065353216;
    if (_1092)
    {
        float _1128 = -_1078;
        float _1130 = _1128 + 1.0;
        _1124 = as_type<int>(_1130);
    }
    int _1132 = _1124;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1138 = false;
    if (_1086)
    {
        bool _1140 = _1082 > 0.5;
        _1138 = _1140;
    }
    bool _1142 = _1138;
    float _1144 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1102);
    float _1146 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1104);
    float _1148 = _1094;
    bool _1150 = _1142;
    if (_1086)
    {
        float _1152 = -_1078;
        float _1154 = _1152 + 1.0;
        _1126 = as_type<int>(_1154);
    }
    int _1156 = _1126;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1160 = 1.0 + _1158;
    bool _1162 = _1094 > 0.5;
    float _1164 = _1098 * 2.0;
    float _1166 = as_type<float>(_1156);
    if (!_1086)
    {
        _1148 = _1078;
    }
    float _1168 = _1148;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1174 = _1168;
    if (_1086)
    {
        float _1176 = _1142 ? as_type<float>(_1156) : _1078;
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1182 = _1122;
    if (_1092)
    {
        bool _1184 = _1098 > 0.5;
        _1150 = _1184;
    }
    bool _1186 = _1150;
    float _1188 = 1.0 / _1172;
    if (!_1092)
    {
        _1166 = _1078;
    }
    float _1190 = _1166;
    float _1192 = fma(_1180, -2.0, _1136);
    float _1194 = _1190;
    if (_1092)
    {
        float _1196 = _1186 ? as_type<float>(_1132) : _1078;
        _1194 = _1196;
    }
    float _1198 = _1194;
    float _1200 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1202 = -_1122;
    float _1204 = _1202 + 1.0;
    float _1206 = _1106 * 2.0;
    float _1208 = -_1134;
    float _1210 = fma(_1200, 2.0, _1208);
    float _1212 = 1.0 / _1160;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1214;
    float _1218 = _1082 * 2.0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1230 = _1228 != 0;
    float _1232 = _1106 + _1098;
    bool _1234 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1236 = isnan(_1076);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1192);
    float _1248 = floor(_1164);
    float _1250 = _1232 + (-1.0);
    float _1252 = _1216 * _1188;
    float _1254 = _1144 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1256 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1258 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1260 = _1082 + _1106;
    int _1262 = _1162 ? as_type<int>(_1204) : as_type<int>(_1122);
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1266 = _1114 * _122;
    float _1268 = _1260 + (-1.0);
    float _1270 = _1110 ? as_type<float>(_1262) : _1122;
    float _1272 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1274 = _1106 > 0.5;
    float _1276 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = exp2(_1266);
    bool _1280 = _1248 > 0.0;
    float _1282 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1284 = _1248 >= 0.0;
    bool _1286 = isnan(_1248);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1296 = _1076 + _1294;
    if (_1118)
    {
        float _1298 = _1274 ? _1204 : _1122;
        _1182 = _1298;
    }
    float _1300 = _1182;
    float _1302 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_1252, _1296, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1316 = floor(_1206);
    float _1318 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1320 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1328 = _1324 || _1326;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1332 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1334 = isnan(_1076);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1278;
    float _1346 = _1344 + 1.0;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1350 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1330);
    float _1352 = -_122;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1210);
    float _1356 = floor(_1218);
    float _1358 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1348);
    float _1360 = _1328 ? _1346 : 0.0;
    float _1362 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1350);
    float _1364 = -_1342;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1358);
    float _1370 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1312)
    {
        float _1372 = _1360 * _1212;
        _124 = _1372;
    }
    float _1374 = _124;
    int _1376 = _1292 ? 0 : 1;
    float _1378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1380 = _1244 * _1366;
    bool _1382 = _1316 >= 0.0;
    bool _1384 = isnan(_1316);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan(0.0);
    bool _1390 = _1386 || _1388;
    float _1392 = -_1244;
    float _1394 = _1392 + 1.0;
    int _1396 = ~_1376;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    float _1402 = _1314 * _1380;
    int _1404 = _1400;
    if (!_1280)
    {
        int _1406 = ~_1376;
        int _1408 = _1406 + 1;
        _1404 = _1408;
    }
    int _1410 = _1404;
    float _1412 = fma(_1370, _1300, -0.5);
    float _1414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1416 = _1316 > 0.0;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1420 = _1254 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1424 = _1256 + _1422;
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1402);
    bool _1428 = _1356 > 0.0;
    float _1430 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1432 = -_1246;
    float _1434 = fma(_1368, _1412, _1432);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1438 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1430);
    float _1442 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1426);
    bool _1444 = _1356 >= 0.0;
    bool _1446 = isnan(_1356);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(0.0);
    bool _1452 = _1448 || _1450;
    float _1454 = fma(_1438, _1178, -0.5);
    float _1456 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1460 = _1272 + _1458;
    float _1462 = _1452 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1464 = fma(_1362, _1454, _1354);
    float _1466 = _1456 * _1414;
    float _1468 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1440);
    int _1470 = ~as_type<int>(_1462);
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    float _1476 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1478 = _1474;
    float _1480 = _1462;
    if (!_1428)
    {
        int _1482 = ~as_type<int>(_1462);
        int _1484 = _1482 + 1;
        _1478 = _1484;
    }
    int _1486 = _1478;
    float _1488 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1490 = _1282 * _1436;
    float _1492 = _1420 * _1420;
    bool _1494 = _1468 >= 0.0;
    float _1496 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1498 = !_1226;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = fma(_1424, _1424, _1492);
    float _1504 = _1442 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1506 = abs(_1500);
    float _1508 = fma(_1460, _1460, _1502);
    float _1510 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1434 + 0.5;
    float _1514 = in.m_59.x;
    float _1516 = in.m_59.y;
    float _1518 = in.m_59.z;
    float _1520 = _1464 + 0.5;
    int _1522 = _1390 ? 0 : 1;
    float _1524 = rsqrt(_1508);
    if (_1494)
    {
        _1480 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1526 = _1480;
    out.m_61.x = _1476;
    out.m_61.y = _1496;
    out.m_61.z = _1510;
    out.m_61.w = _1504;
    bool _1528 = !_1222;
    int _1530 = _1528 ? 0 : 1;
    int _1532 = ~_1522;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    int _1538 = as_type<int>(_1526);
    int _1540 = _1536;
    if (_1494)
    {
        float _1542 = _1526 * 5.0;
        _1538 = as_type<int>(_1542);
    }
    int _1544 = _1538;
    out.m_63.x = _1520;
    out.m_63.y = _1512;
    out.m_63.z = _1490;
    out.m_63.w = _1466;
    if (!_1416)
    {
        int _1546 = ~_1522;
        int _1548 = _1546 + 1;
        _1540 = _1548;
    }
    int _1550 = _1540;
    int _1552 = abs(_1530);
    if (_1494)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4817 = as_type<float>(_1544);
        out.gl_Position.z = _4817;
    }
    bool _1554 = !_1230;
    int _1556 = _1554 ? 0 : 1;
    if (_1494)
    {
        out.m_45.x = 0.0;
    }
    float _1558 = _1420 * _1524;
    float _1560 = _1424 * _1524;
    if (_1494)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1562 = -_1558;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1254);
    float _1566 = float(_1552);
    float _1568 = -_1560;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1572 = float(_1410);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1564 + _1574;
    float _1578 = float(_1506);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1570 + _1580;
    float _1584 = float(_1486);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1588 = _1566 * _1572;
    float _1590 = _1460 * _1524;
    int _1592 = abs(_1556);
    float _1594 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1586);
    float _1596 = _1588 * (-2.0);
    float _1598 = -_1590;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1602 = _1578 * _1584;
    float _1604 = fma(_1596, _1514, _1514);
    float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1608 = _1600 + _1606;
    float _1610 = float(_1550);
    float _1612 = _1602 * (-2.0);
    float _1614 = float(_1592);
    float _1616 = fma(_1608, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1594);
    float _1618 = _1082 + (-0.5);
    float _1620 = -_1558;
    float _1622 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1624 = _1106 + (-0.5);
    float _1626 = _1614 * _1610;
    float _1628 = fma(_1258, _1612, _1258);
    float _1630 = fma(_1612, _1516, _1516);
    bool _1632 = _1616 >= 0.0;
    float _1634 = fma(_1276, _1596, _1276);
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1604);
    float _1638 = -_1560;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    float _1642 = _1622 * _1622;
    float _1644 = _1082 + _1098;
    float _1646 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1630);
    float _1648 = fma(_1634, _1374, _1636);
    float _1650 = fma(_1640, _1640, _1642);
    float _1652 = -_1590;
    float _1654 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1460);
    float _1656 = _1644 + (-1.0);
    float _1658 = fma(_1628, _1374, _1646);
    float _1660 = _1648 * 0.15915493667125701904296875;
    float _1662 = fma(_1654, _1654, _1650);
    float _1664 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1666 = _1630;
    float _1668 = _1600;
    if (_1632)
    {
        _1666 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1670 = _1666;
    float _1672 = _1658 * 0.15915493667125701904296875;
    float _1674 = _1660 * 6.283185482025146484375;
    float _1676 = sin(_1674);
    float _1678 = _1626 * (-2.0);
    int _1680 = as_type<int>(_1670);
    if (_1632)
    {
        out.m_45.x = 0.0;
    }
    if (_1632)
    {
        float _1682 = _1670 * 5.0;
        _1680 = as_type<int>(_1682);
    }
    int _1684 = _1680;
    float _1686 = fma(_1678, _1518, _1518);
    float _1688 = _1098 + (-0.5);
    float _1690 = _1660 * 6.283185482025146484375;
    float _1692 = cos(_1690);
    if (_1632)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5054 = as_type<float>(_1684);
        out.gl_Position.z = _5054;
    }
    float _1694 = sqrt(_1662);
    if (_1632)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1696 = in.m_65.x;
    float _1698 = in.m_65.y;
    float _1700 = in.m_65.z;
    float _1702 = fma(_1664, _1678, _1664);
    float _1704 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1686);
    float _1706 = _1672 * 6.283185482025146484375;
    float _1708 = sin(_1706);
    float _1710 = _1524 * _1694;
    float _1712 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1714 = fma(_1702, _1374, _1704);
    float _1716 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1718 = _1710 * _1712;
    float _1720 = _1714 * 0.15915493667125701904296875;
    float _1722 = _1672 * 6.283185482025146484375;
    float _1724 = cos(_1722);
    float _1726 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1728 = _1710 * _1716;
    float _1730 = _1710 * _1726;
    float _1732 = _1720 * 6.283185482025146484375;
    float _1734 = cos(_1732);
    float _1736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1698);
    float _1738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1696);
    float _1740 = _1676 * _1708;
    float _1742 = _1720 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = _1718 * _1736;
    float _1748 = _1692 * _1724;
    float _1750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1700);
    float _1752 = _1692 * _1708;
    float _1754 = _1730 * _1738;
    float _1756 = _1676 * _1724;
    float _1758 = _1728 * _1750;
    float _1760 = _1734 * _1746;
    float _1762 = _1708 * _1734;
    float _1764 = _1724 * _1734;
    float _1766 = _1692 * _1760;
    float _1768 = fma(_1744, _1748, _1740);
    float _1770 = -_1746;
    float _1772 = _1744 * _1770;
    float _1774 = fma(_1744, _1740, _1748);
    float _1776 = fma(_1768, _1754, _1766);
    float _1778 = -_1756;
    float _1780 = fma(_1744, _1752, _1778);
    float _1782 = -_1752;
    float _1784 = fma(_1744, _1756, _1782);
    float _1786 = _1676 * _1760;
    float _1788 = fma(_1764, _1754, _1772);
    float _1790 = fma(_1780, _1758, _1776);
    float _1792 = fma(_1784, _1754, _1786);
    float _1794 = fma(_1762, _1758, _1788);
    float _1796 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1798 = fma(_1774, _1758, _1792);
    float _1800 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1802 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1796);
    float _1804 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1800);
    float _1806 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1802);
    float _1808 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1810 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1812 = _1808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1814 = _1272 + _1810;
    float _1816 = _1256 + _1812;
    float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1820 = _1814 + _1818;
    float _1822 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1826 = _1816 + _1824;
    float _1828 = _1820 * _1820;
    float _1830 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1822);
    float _1832 = fma(_1826, _1826, _1828);
    float _1834 = fma(_1798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1830);
    float _1836 = sqrt(_1832);
    float _1838 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1840 = _1254 + _1838;
    bool _1842 = _1836 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = _1838;
    float _1846 = _1834;
    float _1848 = _1806;
    float _1850 = _1790;
    float _1852 = _1826;
    if (!_1842)
    {
        _1844 = _1816;
    }
    float _1854 = _1844;
    float _1856 = _1854;
    if (!_1842)
    {
        _1846 = _1814;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (!_1842)
    {
        _1848 = _1840;
    }
    float _1862 = _1848;
    bool _1864 = !_1842;
    float _1866 = _1862;
    if (!_1864)
    {
        float _1868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1872 = _1836 + _1870;
        float _1874 = rsqrt(_1832);
        float _1876 = _1872 * _1868;
        float _1878 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1880 = _1876 * 0.15915493667125701904296875;
        float _1882 = _1880 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        float _1886 = _1880 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        float _1890 = _1884 + (-1.0);
        float _1892 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = fma(_1888, _1878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1896 = fma(_1840, _1884, _1892);
        float _1898 = _1874 * _1894;
        float _1900 = fma(_1826, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = fma(_1820, _1898, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1866 = _1896;
        _1856 = _1900;
        _1860 = _1902;
        _1850 = _1880;
    }
    float _1904 = _1866;
    float _1906 = _1856;
    float _1908 = _1860;
    float _1910 = _1850;
    float _1912 = -_1558;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1904);
    float _1916 = -_1560;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1906);
    float _1920 = -_1590;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1908);
    float _1924 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1926 = _1914 + _1924;
    float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1930 = _1918 + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1934 = _1922 + _1932;
    float _1936 = _1926 * _1926;
    float _1938 = fma(_1930, _1930, _1936);
    float _1940 = fma(_1934, _1934, _1938);
    float _1942 = rsqrt(_1940);
    float _1944 = sqrt(_1940);
    float _1946 = _1942 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1948 = _1930 * _1946;
    float _1950 = _1934 * _1946;
    float _1952 = _1948 * _1948;
    float _1954 = _1950 * _1950;
    float _1956 = _1952 + _1954;
    float _1958 = sqrt(_1956);
    bool _1960 = _1958 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1964 = _1958 + _1962;
    float _1966 = _1934;
    float _1968 = _1936;
    float _1970 = _1964;
    float _1972 = _1926;
    if (_1960)
    {
        float _1974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1966 = _1974;
    }
    float _1976 = _1966;
    if (_1960)
    {
        float _1978 = rsqrt(_1956);
        _1968 = _1978;
    }
    float _1980 = _1968;
    float _1982 = _1980;
    if (_1960)
    {
        float _1984 = _1964 * _1976;
        _1970 = _1984;
    }
    float _1986 = _1970;
    if (_1960)
    {
        float _1988 = _1986 * 0.15915493667125701904296875;
        _1852 = _1988;
    }
    float _1990 = _1852;
    float _1992 = _1910;
    float _1994 = _1990;
    if (_1960)
    {
        float _1996 = _1990 * 6.283185482025146484375;
        float _1998 = sin(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2004 = precise::max(0.0, _2002);
    float _2006 = _1942;
    float _2008 = _2004;
    float _2010 = _2002;
    if (_1960)
    {
        float _2012 = _1990 * 6.283185482025146484375;
        float _2014 = cos(_2012);
        _2006 = _2014;
    }
    float _2016 = _2006;
    float _2018 = -_1946;
    float _2020 = -_2004;
    float _2022 = fma(_1926, _2018, _2020);
    if (!_1960)
    {
        _1972 = _1950;
    }
    float _2024 = _1972;
    float _2026 = _2024;
    if (_1960)
    {
        float _2028 = _2022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2028;
    }
    float _2030 = _2008;
    float _2032 = _2000;
    float _2034 = _2030;
    if (_1960)
    {
        float _2036 = fma(_2000, _2030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2032 = _2036;
    }
    float _2038 = _2032;
    float _2040 = _2038;
    if (!_1960)
    {
        _2034 = _2022;
    }
    float _2042 = _2034;
    float _2044 = _2042;
    float _2046 = _2016;
    if (_1960)
    {
        float _2048 = _2016 + (-1.0);
        _2010 = _2048;
    }
    float _2050 = _2010;
    float _2052 = _2050;
    if (_1960)
    {
        float _2054 = _1980 * _2038;
        _2040 = _2054;
    }
    float _2056 = _2040;
    if (!_1960)
    {
        _1982 = _1948;
    }
    float _2058 = _1982;
    float _2060 = _2058;
    if (_1960)
    {
        float _2062 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1994 = _2062;
    }
    float _2064 = _1994;
    if (_1960)
    {
        float _2066 = _1948 * _2056;
        _2060 = _2066;
    }
    float _2068 = _2060;
    if (!_1960)
    {
        _2052 = _1952;
    }
    float _2070 = _2052;
    float _2072 = _2070;
    if (_1960)
    {
        float _2074 = _1950 * _2056;
        _2026 = _2074;
    }
    float _2076 = _2026;
    if (_1960)
    {
        float _2078 = fma(_2022, _2016, _2064);
        _2044 = _2078;
    }
    float _2080 = _2044;
    if (_1960)
    {
        float _2082 = _2068 * _2068;
        _2072 = _2082;
    }
    float _2084 = _2072;
    if (!_1960)
    {
        _2046 = _1954;
    }
    float _2086 = _2046;
    float _2088 = _2086;
    if (_1960)
    {
        float _2090 = _2076 * _2076;
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = fma(_2080, _2080, _2084);
    float _2096 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2098 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2100 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2102 = _2094 + _2092;
    float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2106 = fma(_1944, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2104);
    float _2108 = precise::clamp(_2106, 0.0, 1.0);
    float _2110 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2096);
    float _2112 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2114 = rsqrt(_2102);
    float _2116 = -_2108;
    float _2118 = _2116 + 1.0;
    float _2120 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2110);
    float _2122 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2100);
    float _2124 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2126 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2112);
    float _2130 = abs(_2118);
    float _2132 = log2(_2130);
    float _2134 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2122);
    float _2136 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2138 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2128);
    float _2140 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2124);
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2144 = -_2136;
    float _2146 = fma(_2144, _2098, 1.0);
    float _2148 = _2138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2150 = _2114 * _2068;
    float _2152 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2154 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2140);
    float _2156 = _2114 * _2080;
    float _2158 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2152);
    float _2162 = _2114 * _2076;
    float _2164 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2166 = -_2158;
    float _2168 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2172 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2160);
    float _2174 = log2(_2146);
    float _2176 = -_2162;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2180 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2182 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2184 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2186 = fma(_2178, -0.5, 0.5);
    float _2188 = fma(_2178, 0.5, 0.5);
    float _2190 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2180);
    float _2192 = exp2(_2170);
    float _2194 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2184);
    float _2196 = _2156 + 1.0;
    float _2198 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2190);
    float _2200 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2194);
    float _2202 = 1.0 / _2182;
    float _2204 = fma(_2188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2206 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2208 = _2174 * 0.693147182464599609375;
    float _2210 = fma(_2188, _2204, -0.212114393711090087890625);
    float _2212 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2214 = sqrt(_2186);
    float _2216 = -_2156;
    float _2218 = fma(_2192, _2196, _2216);
    float _2220 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2198);
    float _2222 = fma(_2188, _2210, 1.570728778839111328125);
    float _2224 = fma(_2218, 0.5, 0.5);
    float _2226 = _2220 * _2202;
    float _2228 = _2206 * _2202;
    float _2230 = fma(_2226, 0.5, 0.5);
    float _2232 = fma(_2228, -0.5, 0.5);
    float _2234 = _2214 * 0.636619746685028076171875;
    float3 _5947 = float3(_2230, _2232, _2212);
    float _2236 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).x;
    float _2238 = -_2222;
    float _2240 = fma(_2234, _2238, 1.0);
    float3 _5963 = float3(_2230, _2232, _2212);
    float4 _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5963, float3(0.0), isnan(_5963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5963, float3(0.0), isnan(_5963)), level(0.0)).xyzw;
    float _2245 = _2243.x;
    float _2247 = _2243.y;
    float _2249 = _2243.z;
    float _2251 = _2243.w;
    float2 _5980 = float2(_2240, _2224);
    float3 _2255 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5980, float2(0.0), isnan(_5980)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5980, float2(0.0), isnan(_5980)), level(0.0)).xyz;
    float _2257 = _2255.x;
    float _2259 = _2255.y;
    float _2261 = _2255.z;
    float _2263 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2265 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2267 = isnan(0.5);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2273 = _2269 || _2271;
    float _2275 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2263);
    float _2277 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2279 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2281 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2275);
    float _2283 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2277);
    float _2285 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2279);
    float _2287 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2289 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2283);
    float _2291 = _2212;
    float _2293 = _2279;
    float _2295 = _2132;
    if (!_2273)
    {
        _1668 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2297 = _1668;
    float _2299 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2285);
    float _2301 = 1.0 / _2287;
    float _2303 = _2289 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2305 = _2297;
    if (!_2273)
    {
        _2291 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2307 = _2291;
    float _2309 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2299);
    if (_2273)
    {
        _2293 = 1.0;
    }
    float _2311 = _2293;
    float _2313 = _2303 + _2287;
    float _2315 = _2309 + _2182;
    out.gl_Position.x = _2220;
    out.gl_Position.y = _2206;
    out.gl_Position.z = _2309;
    out.gl_Position.w = _2182;
    float _2317 = _2313 * _2301;
    float _2319 = _2317 * 0.5;
    float _2321 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2323 = _2319;
    float _2325 = _2311;
    if (!_2273)
    {
        float _2327 = -_2297;
        float _2329 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2327);
        _2323 = _2329;
    }
    float _2331 = _2323;
    if (!_2273)
    {
        float _2333 = -_2307;
        float _2335 = _2333 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2305 = _2335;
    }
    float _2337 = _2305;
    float _2339 = exp2(_2321);
    float _2341 = _2331;
    if (!_2273)
    {
        float _2343 = 1.0 / _2331;
        _2341 = _2343;
    }
    float _2345 = _2341;
    float _2347 = _2281;
    if (!_2273)
    {
        float _2349 = 1.0 / _2337;
        _2347 = _2349;
    }
    float _2351 = _2347;
    float _2353 = -_2339;
    float _2355 = _2353 + 1.0;
    float _2357 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_2273)
    {
        float _2359 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2361 = -_2307;
        float _2363 = fma(_2345, _2359, _2361);
        _2295 = _2363;
    }
    float _2365 = _2295;
    if (!_2273)
    {
        float _2367 = _2365 * _2351;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        _2325 = _2369;
    }
    float _2371 = _2325;
    float _2373 = _2315 * 0.5;
    float _2375 = _2371 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2377 = _2371 > 0.0;
    bool _2379 = isnan(_2371);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    out.m_67.z = _2373;
    out.m_67.w = _2182;
    float _2387 = _2375 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2387;
    float _2389 = _2357 * _2236;
    float _2391 = -_2357;
    float _2393 = _2391 + 1.0;
    float _2395 = _2251 * _2389;
    float _2397 = _2261 * _2389;
    float _2399 = fma(_2257, _2395, _2245);
    float _2401 = fma(_2259, _2395, _2247);
    float _2403 = _2251 * _2393;
    float _2405 = fma(_2251, _2397, _2249);
    out.m_69.x = _2399;
    out.m_69.y = _2401;
    out.m_69.z = _2405;
    out.m_69.w = _2403;
    if (_2385)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2407 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2407;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

