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
    float4 m_65 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _566 = false;
    bool _424 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2394 = as_type<float>(_116);
        out.gl_Position.z = _2394;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2463 = as_type<float>(_154);
        out.gl_Position.z = _2463;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_49.w;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -_322;
    float _330 = _328 + 1.0;
    bool _332 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _334 = isnan(_306);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = 1.0 / _326;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _356 = _310 * _344;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = in.m_49.x;
    float _364 = in.m_49.y;
    float _366 = in.m_49.z;
    float _368 = _342 * _330;
    float _370 = fma(_348, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = fma(_360, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_352, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = -_342;
    float _378 = _376 + 1.0;
    float _380 = _370 * _368;
    float _382 = _372 * _368;
    float _384 = _374 * _368;
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _392 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].x, _386);
    float _394 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].y, _388);
    float _396 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].z, _390);
    float _398 = _392 * _362;
    float _400 = _394 * _364;
    float _402 = _396 * _366;
    bool _404 = !_354;
    float _422;
    if (!_404)
    {
        float _406 = in.m_51.x;
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _410 = _406 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_100);
        float _428 = 1.0 / _426;
        float _430 = _134 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _432 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _442 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _460 = isnan(_432);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    bool _474 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = 1.0 / _440;
    float _488 = -_452;
    float _490 = _488 + 1.0;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _494 = 1.0 / _456;
    float _496 = _472 * _486;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _502 = -_484;
    float _504 = _502 + 1.0;
    float _506 = fma(_496, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _508 = _468 * _490;
    float _510 = -_468;
    float _512 = _510 + 1.0;
    float _514 = _452 * _504;
    float _516 = _500 * _494;
    float _518 = _506 * _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _432 + _520;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[115].x, _518);
    float _526 = fma(_516, _522, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = fma(_526, _514, _524);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[117].x, _530);
    float _538 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _538;
    out.m_53.y = _540;
    out.m_53.z = _542;
    out.m_53.w = _544;
    bool _546 = !_492;
    float _564;
    if (!_546)
    {
        float _548 = in.m_51.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        float _568 = float(_100);
        float _570 = 1.0 / _568;
        float _572 = _134 * _570;
        _564 = _572;
    }
    _566 = false;
    float _574 = _564;
    float _576 = in.m_55.x;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _580 = in.m_51.x;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _584 = _582 != 0;
    float _586 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _590 = _588 != 0;
    float _592 = in.m_55.y;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _596 = _594 != 0;
    float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _602 = _600 != 0;
    float _604 = in.m_51.z;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _608 = _606 != 0;
    float _610 = in.m_51.y;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _614 = _612 != 0;
    float _616 = _578 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _618 = in.m_51.w;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _626 = in.m_57.x;
    float _628 = in.m_57.y;
    float _630 = in.m_57.z;
    float _632 = in.m_57.w;
    int _634 = 0;
    float _636 = _574;
    if (_584)
    {
        float _638 = -_576;
        float _640 = _638 + 1.0;
        _634 = as_type<int>(_640);
    }
    int _642 = _634;
    float _644 = 0.0;
    if (!_584)
    {
        _644 = _576;
    }
    float _646 = _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _652 = in.m_59.x;
    float _654 = in.m_59.y;
    float _656 = in.m_59.z;
    float _658 = in.m_59.w;
    bool _660 = false;
    float _662 = _646;
    if (_584)
    {
        bool _664 = _580 > 0.5;
        _660 = _664;
    }
    bool _666 = _660;
    int _668 = 0;
    if (_590)
    {
        float _670 = -_576;
        float _672 = _670 + 1.0;
        _668 = as_type<int>(_672);
    }
    int _674 = _668;
    float _676 = in.m_61.x;
    float _678 = in.m_61.y;
    float _680 = in.m_61.z;
    float _682 = in.m_61.w;
    if (_584)
    {
        float _684 = _666 ? as_type<float>(_642) : _576;
        _662 = _684;
    }
    float _686 = _662;
    float _688 = -_592;
    float _690 = _688 + 1.0;
    float _692 = 1.0 / _650;
    bool _694 = _604 > 0.5;
    float _696 = _604 * 2.0;
    float _698 = _624 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _700 = _610 > 0.5;
    int _702 = _694 ? as_type<int>(_690) : as_type<int>(_592);
    float _704 = floor(_696);
    int _706 = _700 ? as_type<int>(_690) : as_type<int>(_592);
    float _708 = fma(_698, _686, -0.5);
    float _710 = _602 ? as_type<float>(_702) : _592;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _714 = _712 != 0;
    float _716 = _608 ? as_type<float>(_706) : _592;
    float _718 = _274 * _628;
    float _720 = _274 * _654;
    bool _722 = _618 > 0.5;
    float _724 = 1.0 / _622;
    float _726 = _274 * _678;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _732 = _592;
    float _734 = _678;
    if (_596)
    {
        float _736 = _722 ? _690 : _592;
        _732 = _736;
    }
    float _738 = _732;
    float _740 = fma(_272, _626, _718);
    float _742 = _610 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _744 = 1.0 / _730;
    if (!_590)
    {
        _734 = _576;
    }
    float _746 = _734;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _752 = _746;
    if (_590)
    {
        float _754 = _694 ? as_type<float>(_674) : _576;
        _752 = _754;
    }
    float _756 = _752;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _768 = _766 != 0;
    float _770 = fma(_272, _652, _720);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _774 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _776 = 1.0 / _750;
    float _778 = -_772;
    float _780 = fma(_774, 2.0, _778);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _784 = fma(_272, _676, _726);
    float _786 = fma(_276, _630, _740);
    float _788 = fma(_276, _656, _770);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _798 = fma(_276, _680, _784);
    float _800 = fma(_742, -2.0, _782);
    float _802 = _792 * _692;
    float _804 = _796 * _724;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    int _810 = as_type<int>(_796);
    float _812 = _808;
    float _814 = _800;
    if (_614)
    {
        float _816 = -_576;
        float _818 = _816 + 1.0;
        _810 = as_type<int>(_818);
    }
    int _820 = _810;
    float _822 = _580 * 2.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _824;
    float _828 = _808 * _776;
    if (!_614)
    {
        _812 = _576;
    }
    float _830 = _812;
    float _832 = floor(_822);
    float _834 = _830;
    if (_614)
    {
        float _836 = _700 ? as_type<float>(_820) : _576;
        _834 = _836;
    }
    float _838 = _834;
    float _840 = _610 + _604;
    float _842 = _826 * _744;
    float _844 = _610 * 2.0;
    bool _846 = _704 >= 0.0;
    bool _848 = isnan(_704);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = _786 + _632;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _860 = _840 + (-1.0);
    float _862 = _580 + _610;
    int _864 = _854 ? 0 : 1;
    float _866 = _798 + _682;
    float _868 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _870 = _862 + (-1.0);
    float _872 = floor(_844);
    bool _874 = _832 >= 0.0;
    bool _876 = isnan(_832);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -_134;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _890 = _832 > 0.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _894 = _574 + _892;
    bool _896 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _898 = isnan(_574);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _910 = _574 + _908;
    bool _912 = _704 > 0.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _916 = _574 + _914;
    float _918 = fma(_802, _894, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _920 = fma(_616, _716, -0.5);
    float _922 = fma(_842, _910, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _924 = fma(_804, _916, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _926 = _858 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _930 = _574 + _928;
    float _932 = -_906;
    float _934 = _932 + 1.0;
    bool _936 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _938 = isnan(_574);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = fma(_710, _926, -0.5);
    bool _950 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _952 = isnan(_574);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = fma(_828, _930, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _964 = _882 ? 0 : 1;
    float _966 = -_946;
    float _968 = _966 + 1.0;
    bool _970 = _872 >= 0.0;
    bool _972 = isnan(_872);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.0);
    bool _978 = _974 || _976;
    float _980 = _960 * _934;
    float _982 = -_960;
    float _984 = _982 + 1.0;
    bool _986 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _988 = isnan(_574);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    int _998 = _978 ? 0 : 1;
    float _1000 = _946 * _984;
    bool _1002 = _872 > 0.0;
    float _1004 = _996 * _968;
    bool _1006 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1008 = isnan(_574);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = -_996;
    float _1020 = _1018 + 1.0;
    float _1022 = _788 + _658;
    float _1024 = _918;
    if (_714)
    {
        _636 = _580;
    }
    float _1026 = _636;
    float _1028 = _1016 * _1020;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1032 = _1026;
    if (!_714)
    {
        _1032 = _604;
    }
    float _1034 = _1032;
    float _1036 = _918 * _1028;
    float _1038 = _598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1040 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1030);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1044 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1046 = fma(_1038, _738, -0.5);
    float _1048 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1040);
    float _1050 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _800);
    float _1052 = -_1042;
    float _1054 = fma(_1044, 2.0, _1052);
    if (!_714)
    {
        _1024 = _610;
    }
    float _1056 = _1024;
    float _1058 = -_1050;
    float _1060 = fma(_1048, _920, _1058);
    float _1062 = _1056;
    if (_714)
    {
        _1062 = _580;
    }
    float _1064 = _1062;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1070 = -_1016;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1068);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1036);
    if (!_714)
    {
        _814 = _604;
    }
    float _1084 = _814;
    float _1086 = -_1076;
    float _1088 = fma(_1078, 2.0, _1086);
    int _1090 = ~_998;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    float _1096 = fma(_924, _1004, _1082);
    int _1098 = _1094;
    float _1100 = _1084;
    if (!_1002)
    {
        int _1102 = ~_998;
        int _1104 = _1102 + 1;
        _1098 = _1104;
    }
    int _1106 = _1098;
    float _1108 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1112 = _1110;
    if (_714)
    {
        _1100 = _610;
    }
    float _1114 = _1100;
    float _1116 = fma(_1108, _756, -0.5);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1120 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1074);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1110);
    float _1124 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1126 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1118);
    if (!_714)
    {
        _1112 = _604;
    }
    float _1128 = _1112;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1132 = _1128;
    if (_714)
    {
        _1132 = _610;
    }
    float _1134 = _1132;
    float _1136 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1126);
    float _1138 = fma(_1124, _838, -0.5);
    float _1140 = fma(_922, _1000, _1096);
    float _1142 = fma(_1136, _708, _886);
    float _1144 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1152 = !_764;
    int _1154 = _1152 ? 0 : 1;
    float _1156 = fma(_1144, -2.0, _1130);
    float _1158 = -_134;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1088);
    float _1162 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1150);
    bool _1164 = !_760;
    float _1166 = _1164 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1168 = -_134;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1054);
    float _1172 = fma(_1120, _1116, _1160);
    float _1174 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1162);
    int _1176 = abs(as_type<int>(_1166));
    float _1178 = fma(_962, _980, _1140);
    int _1180 = abs(_1154);
    float _1182 = fma(_1174, _1138, _1170);
    int _1184 = ~_864;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1192 = ~_964;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = _1148 * _134;
    int _1200 = _1188;
    int _1202 = _1196;
    float _1204 = _1166;
    float _1206 = _1142;
    if (!_912)
    {
        int _1208 = ~_864;
        int _1210 = _1208 + 1;
        _1200 = _1210;
    }
    int _1212 = _1200;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _856 + _1214;
    float _1218 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1122);
    if (!_890)
    {
        int _1220 = ~_964;
        int _1222 = _1220 + 1;
        _1202 = _1222;
    }
    int _1224 = _1202;
    float _1226 = exp2(_1198);
    float _1228 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1178);
    if (_714)
    {
        _1204 = _610;
    }
    float _1230 = _1204;
    float _1232 = float(_1212);
    float _1234 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1236 = _1230;
    if (!_714)
    {
        _1236 = _580;
    }
    float _1238 = _1236;
    float _1240 = float(_1180);
    float _1242 = float(_1224);
    float _1244 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1246 = float(_1176);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1250 = _1022 + _1248;
    bool _1252 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1254 = isnan(0.0);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1260 = _1256 || _1258;
    float _1262 = _1240 * _1242;
    float _1264 = _1246 * _1232;
    float _1266 = fma(_1244, -2.0, _1190);
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1270 = in.m_63.x;
    float _1272 = in.m_63.y;
    float _1274 = in.m_63.z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1280 = 1.0 + _1278;
    float _1282 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1268);
    float _1284 = -_1226;
    float _1286 = _1284 + 1.0;
    float _1288 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1276);
    float _1290 = 1.0 / _1280;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _866 + _1292;
    float _1296 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1156);
    float _1298 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1288);
    float _1300 = _1250 * _1250;
    float _1302 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1282);
    float _1304 = -_1296;
    float _1306 = fma(_1218, _1046, _1304);
    float _1308 = _1260 ? _1286 : 0.0;
    float _1310 = _1264 * (-2.0);
    float _1312 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1266);
    float _1314 = _1060 + 0.5;
    float _1316 = _1306 + 0.5;
    bool _1318 = _1302 >= 0.0;
    float _1320 = -_1312;
    float _1322 = fma(_1298, _948, _1320);
    float _1324 = fma(_1216, _1216, _1300);
    float _1326 = fma(_888, _1310, _888);
    bool _1328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(1.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = _1172 + 0.5;
    float _1340 = fma(_1294, _1294, _1324);
    float _1342 = fma(_1310, _1270, _1270);
    float _1344 = _1262 * (-2.0);
    float _1346 = _1142 + 0.5;
    out.m_65.w = _1234;
    float _1348 = rsqrt(_1340);
    float _1350 = fma(_868, _1344, _868);
    float _1352 = fma(_1344, _1272, _1272);
    float _1354 = _580 + (-0.5);
    float _1356 = _1274;
    if (_1318)
    {
        _1206 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1358 = _1206;
    out.m_67.x = _1346;
    out.m_67.y = _1314;
    out.m_67.z = _1338;
    out.m_67.w = _1316;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1342);
    float _1362 = _1182 + 0.5;
    int _1364 = as_type<int>(_1358);
    if (_1318)
    {
        float _1366 = _1358 * 5.0;
        _1364 = as_type<int>(_1366);
    }
    int _1368 = _1364;
    float _1370 = _1322 + 0.5;
    if (_1336)
    {
        float _1372 = _1308 * _1290;
        _138 = _1372;
    }
    float _1374 = _138;
    bool _1376 = !_768;
    int _1378 = _1376 ? 0 : 1;
    if (_1318)
    {
        out.m_45.x = 0.0;
    }
    float _1380 = fma(_1326, _1374, _1360);
    if (_1318)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4411 = as_type<float>(_1368);
        out.gl_Position.z = _4411;
    }
    float _1382 = _586 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1384 = abs(_1378);
    out.m_69.x = _1362;
    out.m_69.y = _1370;
    float _1386 = _1382 * _1348;
    float _1388 = _1216 * _1386;
    float _1390 = _1250 * _1386;
    if (_1318)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1392 = -_1390;
    float _1394 = _1022 + _1392;
    float _1396 = float(_1384);
    float _1398 = -_1388;
    float _1400 = _856 + _1398;
    float _1402 = _1294 * _1386;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1406 = _1394 + _1404;
    float _1408 = _1380 * 0.15915493667125701904296875;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1412 = _1400 + _1410;
    float _1414 = -_1402;
    float _1416 = _866 + _1414;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1420 = _610 + (-0.5);
    float _1422 = float(_1106);
    float _1424 = _580 + _604;
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1418);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1430 = _1416 + _1428;
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1434 = _1396 * _1422;
    float _1436 = -_1390;
    float _1438 = _1250 + _1436;
    float _1440 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1426);
    float _1442 = fma(_1350, _1374, _1432);
    float _1444 = _1424 + (-1.0);
    float _1446 = _1434 * (-2.0);
    bool _1448 = _1440 >= 0.0;
    float _1450 = -_1388;
    float _1452 = _1216 + _1450;
    float _1454 = _1438 * _1438;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1458 = fma(_1446, _1274, _1274);
    float _1460 = _604 + (-0.5);
    float _1462 = fma(_1452, _1452, _1454);
    float _1464 = -_1402;
    float _1466 = _1294 + _1464;
    float _1468 = fma(_1456, _1446, _1456);
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1458);
    float _1472 = _1442 * 0.15915493667125701904296875;
    float _1474 = fma(_1466, _1466, _1462);
    float _1476 = _1408 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    if (_1448)
    {
        _1356 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1356;
    float _1482 = fma(_1468, _1374, _1470);
    int _1484 = as_type<int>(_1480);
    if (_1448)
    {
        out.m_45.x = 0.0;
    }
    if (_1448)
    {
        float _1486 = _1480 * 5.0;
        _1484 = as_type<int>(_1486);
    }
    int _1488 = _1484;
    float _1490 = _1408 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    if (_1448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4604 = as_type<float>(_1488);
        out.gl_Position.z = _4604;
    }
    float _1494 = _1472 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = _1472 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = sqrt(_1474);
    if (_1448)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1504 = in.m_71.x;
    float _1506 = in.m_71.y;
    float _1508 = in.m_71.z;
    float _1510 = _1482 * 0.15915493667125701904296875;
    float _1512 = _1348 * _1502;
    float _1514 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1516 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1510 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _586 * _1512;
    float _1524 = _1512 * _1514;
    float _1526 = _1512 * _1516;
    float _1528 = _1492 * _1500;
    float _1530 = _1492 * _1496;
    float _1532 = _1478 * _1500;
    float _1534 = _1510 * 6.283185482025146484375;
    float _1536 = sin(_1534);
    float _1538 = _1478 * _1496;
    float _1540 = _1492 * _1520;
    float _1542 = _1500 * _1520;
    float _1544 = _1478 * _1520;
    float _1546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1506);
    float _1548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1504);
    float _1550 = _1496 * _1520;
    float _1552 = _1526 * _1546;
    float _1554 = _1522 * _1548;
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1558 = fma(_1536, _1528, _1538);
    float _1560 = _1540 * _1552;
    float _1562 = -_1532;
    float _1564 = fma(_1536, _1530, _1562);
    float _1566 = _1524 * _1556;
    float _1568 = -_1552;
    float _1570 = _1536 * _1568;
    float _1572 = fma(_1558, _1554, _1560);
    float _1574 = -_1530;
    float _1576 = fma(_1536, _1532, _1574);
    float _1578 = _1544 * _1552;
    float _1580 = fma(_1542, _1554, _1570);
    float _1582 = fma(_1564, _1566, _1572);
    float _1584 = fma(_1536, _1538, _1528);
    float _1586 = fma(_1576, _1554, _1578);
    float _1588 = fma(_1550, _1566, _1580);
    float _1590 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1592 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1594 = fma(_1584, _1566, _1586);
    float _1596 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1592);
    float _1600 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1596);
    float _1602 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1598);
    float _1604 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1606 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1608 = _866 + _1604;
    float _1610 = _856 + _1606;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1614 = _1608 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1618 = _1610 + _1616;
    float _1620 = _1614 * _1614;
    float _1622 = fma(_1618, _1618, _1620);
    float _1624 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1626 = sqrt(_1622);
    float _1628 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1624);
    float _1630 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1634 = _1022 + _1632;
    bool _1636 = _1626 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1638 = _1594;
    float _1640 = _1624;
    float _1642 = _1632;
    float _1644 = _1610;
    float _1646 = _1608;
    float _1648 = _1614;
    if (!_1636)
    {
        _1638 = _1610;
    }
    float _1650 = _1638;
    float _1652 = _1650;
    if (!_1636)
    {
        _1640 = _1608;
    }
    float _1654 = _1640;
    float _1656 = _1654;
    if (!_1636)
    {
        _1642 = _1634;
    }
    float _1658 = _1642;
    bool _1660 = !_1636;
    float _1662 = _1658;
    if (!_1660)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1668 = _1626 + _1666;
        float _1670 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = rsqrt(_1622);
        float _1674 = _1668 * _1664;
        float _1676 = _1674 * 0.15915493667125701904296875;
        float _1678 = _1676 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1680 + (-1.0);
        float _1688 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = fma(_1684, _1670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = fma(_1634, _1680, _1688);
        float _1694 = _1672 * _1690;
        float _1696 = fma(_1618, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1698 = fma(_1614, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1662 = _1692;
        _1652 = _1696;
        _1656 = _1698;
        _1644 = _1690;
        _1646 = _1676;
    }
    float _1700 = _1662;
    float _1702 = _1652;
    float _1704 = _1656;
    float _1706 = _1644;
    float _1708 = _1646;
    float _1710 = -_1390;
    float _1712 = _1710 + _1700;
    float _1714 = -_1388;
    float _1716 = _1714 + _1702;
    float _1718 = -_1402;
    float _1720 = _1718 + _1704;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1724 = _1712 + _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1728 = _1716 + _1726;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1732 = _1720 + _1730;
    float _1734 = _1724 * _1724;
    float _1736 = fma(_1728, _1728, _1734);
    float _1738 = fma(_1732, _1732, _1736);
    float _1740 = rsqrt(_1738);
    float _1742 = sqrt(_1738);
    float _1744 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1728 * _1744;
    float _1748 = _1732 * _1744;
    float _1750 = _1746 * _1746;
    float _1752 = _1748 * _1748;
    float _1754 = _1750 + _1752;
    float _1756 = sqrt(_1754);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = _1756 + _1760;
    float _1764 = _1706;
    float _1766 = _1754;
    float _1768 = _1762;
    float _1770 = _1744;
    if (_1758)
    {
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1772;
    }
    float _1774 = _1764;
    if (_1758)
    {
        float _1776 = rsqrt(_1754);
        _1766 = _1776;
    }
    float _1778 = _1766;
    float _1780 = _1778;
    if (_1758)
    {
        float _1782 = _1762 * _1774;
        _1768 = _1782;
    }
    float _1784 = _1768;
    if (_1758)
    {
        float _1786 = _1784 * 0.15915493667125701904296875;
        _1648 = _1786;
    }
    float _1788 = _1648;
    float _1790 = _1708;
    float _1792 = _1788;
    if (_1758)
    {
        float _1794 = _1788 * 6.283185482025146484375;
        float _1796 = sin(_1794);
        _1790 = _1796;
    }
    float _1798 = _1790;
    float _1800 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1802 = precise::max(0.0, _1800);
    float _1804 = _1634;
    float _1806 = _1802;
    float _1808 = _1800;
    if (_1758)
    {
        float _1810 = _1788 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        _1804 = _1812;
    }
    float _1814 = _1804;
    float _1816 = -_1744;
    float _1818 = -_1802;
    float _1820 = fma(_1724, _1816, _1818);
    if (_1758)
    {
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1822;
    }
    float _1824 = _1806;
    float _1826 = _1824;
    float _1828 = _1798;
    if (_1758)
    {
        float _1830 = fma(_1798, _1824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = _1832;
    if (!_1758)
    {
        _1828 = _1746;
    }
    float _1836 = _1828;
    float _1838 = _1836;
    float _1840 = _1814;
    if (_1758)
    {
        float _1842 = _1814 + (-1.0);
        _1808 = _1842;
    }
    float _1844 = _1808;
    float _1846 = _1844;
    if (_1758)
    {
        float _1848 = _1778 * _1832;
        _1770 = _1848;
    }
    float _1850 = _1770;
    if (!_1758)
    {
        _1834 = _1820;
    }
    float _1852 = _1834;
    float _1854 = _1852;
    if (_1758)
    {
        float _1856 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1856;
    }
    float _1858 = _1792;
    if (_1758)
    {
        float _1860 = _1746 * _1850;
        _1838 = _1860;
    }
    float _1862 = _1838;
    if (!_1758)
    {
        _1846 = _1748;
    }
    float _1864 = _1846;
    float _1866 = _1864;
    if (_1758)
    {
        float _1868 = _1748 * _1850;
        _1866 = _1868;
    }
    float _1870 = _1866;
    if (!_1758)
    {
        _1780 = _1750;
    }
    float _1872 = _1780;
    float _1874 = _1872;
    if (_1758)
    {
        float _1876 = fma(_1820, _1814, _1858);
        _1854 = _1876;
    }
    float _1878 = _1854;
    if (_1758)
    {
        float _1880 = _1862 * _1862;
        _1874 = _1880;
    }
    float _1882 = _1874;
    if (!_1758)
    {
        _1840 = _1752;
    }
    float _1884 = _1840;
    float _1886 = _1884;
    if (_1758)
    {
        float _1888 = _1870 * _1870;
        _1886 = _1888;
    }
    float _1890 = _1886;
    float _1892 = fma(_1878, _1878, _1882);
    float _1894 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1896 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1898 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1900 = _1892 + _1890;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1894);
    float _1910 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1912 = rsqrt(_1900);
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1908);
    float _1920 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    float _1922 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1910);
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1928 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1920);
    float _1930 = abs(_1916);
    float _1932 = log2(_1930);
    float _1934 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1924);
    float _1936 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _1938 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1942 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1944 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1936);
    float _1946 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1948 = _1912 * _1862;
    float _1950 = _1912 * _1878;
    float _1952 = _1912 * _1870;
    float _1954 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1946);
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1958 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1960 = -_1940;
    float _1962 = fma(_1960, _1896, 1.0);
    float _1964 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1954);
    float _1966 = -_1956;
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1966);
    float _1970 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1972 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1964);
    float _1976 = -_1952;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1968);
    float _1980 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1982 = log2(_1962);
    float _1984 = fma(_1978, -0.5, 0.5);
    float _1986 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1980);
    float _1988 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1972);
    float _1990 = fma(_1978, 0.5, 0.5);
    float _1992 = _1950 + 1.0;
    float _1994 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1986);
    float _1996 = exp2(_1970);
    float _1998 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1988);
    float _2000 = fma(_1990, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1998);
    float _2004 = fma(_1990, _2000, -0.212114393711090087890625);
    float _2006 = 1.0 / _1974;
    float _2008 = _1982 * 0.693147182464599609375;
    float _2010 = fma(_1990, _2004, 1.570728778839111328125);
    float _2012 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2014 = sqrt(_1984);
    float _2016 = -_1950;
    float _2018 = fma(_1996, _1992, _2016);
    float _2020 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1994);
    float _2022 = _2020 * _2006;
    float _2024 = _2002 * _2006;
    float _2026 = fma(_2022, 0.5, 0.5);
    float _2028 = fma(_2024, -0.5, 0.5);
    float _2030 = _2014 * 0.636619746685028076171875;
    float3 _5479 = float3(_2026, _2028, _2012);
    float _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5479, float3(0.0), isnan(_5479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5479, float3(0.0), isnan(_5479)), level(0.0)).x;
    float _2034 = -_2010;
    float _2036 = fma(_2030, _2034, 1.0);
    float _2038 = fma(_2018, 0.5, 0.5);
    float3 _5497 = float3(_2026, _2028, _2012);
    float4 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5497, float3(0.0), isnan(_5497)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5497, float3(0.0), isnan(_5497)), level(0.0)).xyzw;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = _2041.w;
    float2 _5514 = float2(_2036, _2038);
    float3 _2053 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5514, float2(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5514, float2(0.0), isnan(_5514)), level(0.0)).xyz;
    float _2055 = _2053.x;
    float _2057 = _2053.y;
    float _2059 = _2053.z;
    float _2061 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2063 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2065 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2075 = _2071 || _2073;
    float _2077 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2061);
    float _2079 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2063);
    float _2081 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2083 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2085 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2065);
    float _2087 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2079);
    float _2089 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2081);
    float _2091 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2083);
    float _2093 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2077);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2097 = in.m_73.x;
    float _2099 = in.m_73.y;
    float _2101 = in.m_73.z;
    bool _2103 = _1506 != 0.0;
    bool _2105 = isnan(_1506);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(0.0);
    bool _2111 = _2107 || _2109;
    float _2113 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2115 = 1.0 / _2095;
    float _2117 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2119 = _1504 == 0.0;
    bool _2121 = !_2111;
    bool _2123 = _2119 && _2121;
    float _2125 = -_1536;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2113);
    float _2129 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2131 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2133 = _1508 == 0.0;
    bool _2135 = _2133 && _2123;
    float _2137 = -_1536;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2117);
    float _2141 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2085);
    float _2143 = _2129 + _2095;
    float _2145 = -_1536;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2131);
    float _2149 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2089);
    float _2151 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2153 = 0.0;
    float _2155 = _2091;
    float _2157 = _2151;
    if (!_2075)
    {
        _2153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2159 = _2153;
    float _2161 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2091);
    float _2163 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2165 = _2143 * _2115;
    float _2167 = _2165 * 0.5;
    float _2169 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2171 = _2169;
    if (!_2075)
    {
        _2155 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2173 = _2155;
    float _2175 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2177 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2151);
    float _2179 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2163);
    if (!_2075)
    {
        float _2181 = -_2159;
        float _2183 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2181);
        _2157 = _2183;
    }
    float _2185 = _2157;
    float _2187 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2169);
    if (!_2075)
    {
        float _2189 = -_2173;
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2171 = _2191;
    }
    float _2193 = _2171;
    float _2195 = _2099;
    float _2197 = _2097;
    float _2199 = _2101;
    if (!_2135)
    {
        float _2201 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2099);
        _2195 = _2201;
    }
    float _2203 = _2195;
    float _2205 = exp2(_2175);
    if (!_2135)
    {
        float _2207 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2097);
        _2197 = _2207;
    }
    float _2209 = _2197;
    float _2211 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2127);
    if (!_2135)
    {
        float _2213 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2101);
        _2199 = _2213;
    }
    float _2215 = _2199;
    float _2217 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2139);
    float _2219 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2147);
    float _2221 = _2211 * _2203;
    float _2223 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2179);
    float _2225 = _1506;
    float _2227 = _2221;
    if (!_2075)
    {
        float _2229 = 1.0 / _2185;
        _2225 = _2229;
    }
    float _2231 = _2225;
    float _2233 = _2217 * _2203;
    float _2235 = _2219 * _2203;
    float _2237 = fma(_2149, _2209, _2221);
    float _2239 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2177);
    float _2243 = fma(_2141, _2209, _2233);
    float _2245 = fma(_2161, _2209, _2235);
    float _2247 = _2193;
    if (!_2075)
    {
        float _2249 = 1.0 / _2193;
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2187);
    float _2255 = fma(_2223, _2215, _2237);
    float _2257 = _1974 * 0.5;
    float _2259 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2261 = -_2205;
    float _2263 = _2261 + 1.0;
    float _2265 = fma(_2241, _2215, _2243);
    float _2267 = fma(_2253, _2215, _2245);
    float _2269 = _2231;
    if (!_2075)
    {
        float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2273 = -_2173;
        float _2275 = fma(_2231, _2271, _2273);
        _2269 = _2275;
    }
    float _2277 = _2269;
    if (_2075)
    {
        _2227 = 1.0;
    }
    float _2279 = _2227;
    float _2281 = fma(_2002, -0.5, _2257);
    float _2283 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2259);
    float _2285 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _2255;
    out.m_75.y = _2265;
    out.m_75.z = _2267;
    float _2287 = _2020 + _1974;
    float _2289 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2283);
    float _2291 = _2279;
    if (!_2075)
    {
        float _2293 = _2277 * _2251;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2291 = _2295;
    }
    float _2297 = _2291;
    float _2299 = _2287 * 0.5;
    float _2301 = _2289 + _1974;
    float _2303 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2305 = _2297 > 0.0;
    bool _2307 = isnan(_2297);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.0);
    bool _2313 = _2309 || _2311;
    out.m_77.x = _1728;
    out.m_77.y = _1724;
    out.m_77.z = _1732;
    float _2315 = _2301 * 0.5;
    float _2317 = _2303 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2020;
    out.gl_Position.y = _2002;
    out.gl_Position.z = _2289;
    out.gl_Position.w = _1974;
    out.m_79.x = _2299;
    out.m_79.y = _2281;
    out.m_79.z = _2315;
    out.m_79.w = _1974;
    out.m_45.x = _2317;
    float _2319 = _2285 * _2032;
    float _2321 = -_2285;
    float _2323 = _2321 + 1.0;
    float _2325 = _2049 * _2319;
    float _2327 = _2049 * _2323;
    float _2329 = _2059 * _2319;
    float _2331 = fma(_2055, _2325, _2043);
    float _2333 = fma(_2057, _2325, _2045);
    float _2335 = fma(_2049, _2329, _2047);
    out.m_81.x = _2331;
    out.m_81.y = _2333;
    out.m_81.z = _2335;
    out.m_81.w = _2327;
    if (_2313)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2337 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2337;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _566 = false;
    bool _424 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2394 = as_type<float>(_116);
        out.gl_Position.z = _2394;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2463 = as_type<float>(_154);
        out.gl_Position.z = _2463;
    }
    if (_148)
    {
        return out;
    }
    float _156 = in.m_49.w;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -_322;
    float _330 = _328 + 1.0;
    bool _332 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _334 = isnan(_306);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = 1.0 / _326;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _356 = _310 * _344;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = in.m_49.x;
    float _364 = in.m_49.y;
    float _366 = in.m_49.z;
    float _368 = _342 * _330;
    float _370 = fma(_348, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = fma(_360, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_352, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = -_342;
    float _378 = _376 + 1.0;
    float _380 = _370 * _368;
    float _382 = _372 * _368;
    float _384 = _374 * _368;
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _392 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].x, _386);
    float _394 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].y, _388);
    float _396 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].z, _390);
    float _398 = _392 * _362;
    float _400 = _394 * _364;
    float _402 = _396 * _366;
    bool _404 = !_354;
    float _422;
    if (!_404)
    {
        float _406 = in.m_51.x;
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _410 = _406 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_100);
        float _428 = 1.0 / _426;
        float _430 = _134 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _432 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _442 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _460 = isnan(_432);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    bool _474 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = 1.0 / _440;
    float _488 = -_452;
    float _490 = _488 + 1.0;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _494 = 1.0 / _456;
    float _496 = _472 * _486;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _502 = -_484;
    float _504 = _502 + 1.0;
    float _506 = fma(_496, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _508 = _468 * _490;
    float _510 = -_468;
    float _512 = _510 + 1.0;
    float _514 = _452 * _504;
    float _516 = _500 * _494;
    float _518 = _506 * _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _432 + _520;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[115].x, _518);
    float _526 = fma(_516, _522, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = fma(_526, _514, _524);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[117].x, _530);
    float _538 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _538;
    out.m_53.y = _540;
    out.m_53.z = _542;
    out.m_53.w = _544;
    bool _546 = !_492;
    float _564;
    if (!_546)
    {
        float _548 = in.m_51.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        float _568 = float(_100);
        float _570 = 1.0 / _568;
        float _572 = _134 * _570;
        _564 = _572;
    }
    _566 = false;
    float _574 = _564;
    float _576 = in.m_55.x;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _580 = in.m_51.x;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _584 = _582 != 0;
    float _586 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _590 = _588 != 0;
    float _592 = in.m_55.y;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _596 = _594 != 0;
    float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _602 = _600 != 0;
    float _604 = in.m_51.z;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _608 = _606 != 0;
    float _610 = in.m_51.y;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _614 = _612 != 0;
    float _616 = _578 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _618 = in.m_51.w;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _626 = in.m_57.x;
    float _628 = in.m_57.y;
    float _630 = in.m_57.z;
    float _632 = in.m_57.w;
    int _634 = 0;
    float _636 = _574;
    if (_584)
    {
        float _638 = -_576;
        float _640 = _638 + 1.0;
        _634 = as_type<int>(_640);
    }
    int _642 = _634;
    float _644 = 0.0;
    if (!_584)
    {
        _644 = _576;
    }
    float _646 = _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _652 = in.m_59.x;
    float _654 = in.m_59.y;
    float _656 = in.m_59.z;
    float _658 = in.m_59.w;
    bool _660 = false;
    float _662 = _646;
    if (_584)
    {
        bool _664 = _580 > 0.5;
        _660 = _664;
    }
    bool _666 = _660;
    int _668 = 0;
    if (_590)
    {
        float _670 = -_576;
        float _672 = _670 + 1.0;
        _668 = as_type<int>(_672);
    }
    int _674 = _668;
    float _676 = in.m_61.x;
    float _678 = in.m_61.y;
    float _680 = in.m_61.z;
    float _682 = in.m_61.w;
    if (_584)
    {
        float _684 = _666 ? as_type<float>(_642) : _576;
        _662 = _684;
    }
    float _686 = _662;
    float _688 = -_592;
    float _690 = _688 + 1.0;
    float _692 = 1.0 / _650;
    bool _694 = _604 > 0.5;
    float _696 = _604 * 2.0;
    float _698 = _624 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _700 = _610 > 0.5;
    int _702 = _694 ? as_type<int>(_690) : as_type<int>(_592);
    float _704 = floor(_696);
    int _706 = _700 ? as_type<int>(_690) : as_type<int>(_592);
    float _708 = fma(_698, _686, -0.5);
    float _710 = _602 ? as_type<float>(_702) : _592;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _714 = _712 != 0;
    float _716 = _608 ? as_type<float>(_706) : _592;
    float _718 = _274 * _628;
    float _720 = _274 * _654;
    bool _722 = _618 > 0.5;
    float _724 = 1.0 / _622;
    float _726 = _274 * _678;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _732 = _592;
    float _734 = _678;
    if (_596)
    {
        float _736 = _722 ? _690 : _592;
        _732 = _736;
    }
    float _738 = _732;
    float _740 = fma(_272, _626, _718);
    float _742 = _610 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _744 = 1.0 / _730;
    if (!_590)
    {
        _734 = _576;
    }
    float _746 = _734;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _752 = _746;
    if (_590)
    {
        float _754 = _694 ? as_type<float>(_674) : _576;
        _752 = _754;
    }
    float _756 = _752;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _768 = _766 != 0;
    float _770 = fma(_272, _652, _720);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _774 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _776 = 1.0 / _750;
    float _778 = -_772;
    float _780 = fma(_774, 2.0, _778);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _784 = fma(_272, _676, _726);
    float _786 = fma(_276, _630, _740);
    float _788 = fma(_276, _656, _770);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _798 = fma(_276, _680, _784);
    float _800 = fma(_742, -2.0, _782);
    float _802 = _792 * _692;
    float _804 = _796 * _724;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    int _810 = as_type<int>(_796);
    float _812 = _808;
    float _814 = _800;
    if (_614)
    {
        float _816 = -_576;
        float _818 = _816 + 1.0;
        _810 = as_type<int>(_818);
    }
    int _820 = _810;
    float _822 = _580 * 2.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _824;
    float _828 = _808 * _776;
    if (!_614)
    {
        _812 = _576;
    }
    float _830 = _812;
    float _832 = floor(_822);
    float _834 = _830;
    if (_614)
    {
        float _836 = _700 ? as_type<float>(_820) : _576;
        _834 = _836;
    }
    float _838 = _834;
    float _840 = _610 + _604;
    float _842 = _826 * _744;
    float _844 = _610 * 2.0;
    bool _846 = _704 >= 0.0;
    bool _848 = isnan(_704);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = _786 + _632;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _860 = _840 + (-1.0);
    float _862 = _580 + _610;
    int _864 = _854 ? 0 : 1;
    float _866 = _798 + _682;
    float _868 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _870 = _862 + (-1.0);
    float _872 = floor(_844);
    bool _874 = _832 >= 0.0;
    bool _876 = isnan(_832);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -_134;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _890 = _832 > 0.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _894 = _574 + _892;
    bool _896 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _898 = isnan(_574);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _910 = _574 + _908;
    bool _912 = _704 > 0.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _916 = _574 + _914;
    float _918 = fma(_802, _894, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _920 = fma(_616, _716, -0.5);
    float _922 = fma(_842, _910, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _924 = fma(_804, _916, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _926 = _858 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _930 = _574 + _928;
    float _932 = -_906;
    float _934 = _932 + 1.0;
    bool _936 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _938 = isnan(_574);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = fma(_710, _926, -0.5);
    bool _950 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _952 = isnan(_574);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = fma(_828, _930, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _964 = _882 ? 0 : 1;
    float _966 = -_946;
    float _968 = _966 + 1.0;
    bool _970 = _872 >= 0.0;
    bool _972 = isnan(_872);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.0);
    bool _978 = _974 || _976;
    float _980 = _960 * _934;
    float _982 = -_960;
    float _984 = _982 + 1.0;
    bool _986 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _988 = isnan(_574);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    int _998 = _978 ? 0 : 1;
    float _1000 = _946 * _984;
    bool _1002 = _872 > 0.0;
    float _1004 = _996 * _968;
    bool _1006 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1008 = isnan(_574);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = -_996;
    float _1020 = _1018 + 1.0;
    float _1022 = _788 + _658;
    float _1024 = _918;
    if (_714)
    {
        _636 = _580;
    }
    float _1026 = _636;
    float _1028 = _1016 * _1020;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1032 = _1026;
    if (!_714)
    {
        _1032 = _604;
    }
    float _1034 = _1032;
    float _1036 = _918 * _1028;
    float _1038 = _598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1040 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1030);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1044 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1046 = fma(_1038, _738, -0.5);
    float _1048 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1040);
    float _1050 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _800);
    float _1052 = -_1042;
    float _1054 = fma(_1044, 2.0, _1052);
    if (!_714)
    {
        _1024 = _610;
    }
    float _1056 = _1024;
    float _1058 = -_1050;
    float _1060 = fma(_1048, _920, _1058);
    float _1062 = _1056;
    if (_714)
    {
        _1062 = _580;
    }
    float _1064 = _1062;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1070 = -_1016;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1068);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1036);
    if (!_714)
    {
        _814 = _604;
    }
    float _1084 = _814;
    float _1086 = -_1076;
    float _1088 = fma(_1078, 2.0, _1086);
    int _1090 = ~_998;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    float _1096 = fma(_924, _1004, _1082);
    int _1098 = _1094;
    float _1100 = _1084;
    if (!_1002)
    {
        int _1102 = ~_998;
        int _1104 = _1102 + 1;
        _1098 = _1104;
    }
    int _1106 = _1098;
    float _1108 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1112 = _1110;
    if (_714)
    {
        _1100 = _610;
    }
    float _1114 = _1100;
    float _1116 = fma(_1108, _756, -0.5);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1120 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1074);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1110);
    float _1124 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1126 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1118);
    if (!_714)
    {
        _1112 = _604;
    }
    float _1128 = _1112;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1132 = _1128;
    if (_714)
    {
        _1132 = _610;
    }
    float _1134 = _1132;
    float _1136 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1126);
    float _1138 = fma(_1124, _838, -0.5);
    float _1140 = fma(_922, _1000, _1096);
    float _1142 = fma(_1136, _708, _886);
    float _1144 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1152 = !_764;
    int _1154 = _1152 ? 0 : 1;
    float _1156 = fma(_1144, -2.0, _1130);
    float _1158 = -_134;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1088);
    float _1162 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1150);
    bool _1164 = !_760;
    float _1166 = _1164 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1168 = -_134;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1054);
    float _1172 = fma(_1120, _1116, _1160);
    float _1174 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1162);
    int _1176 = abs(as_type<int>(_1166));
    float _1178 = fma(_962, _980, _1140);
    int _1180 = abs(_1154);
    float _1182 = fma(_1174, _1138, _1170);
    int _1184 = ~_864;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1192 = ~_964;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = _1148 * _134;
    int _1200 = _1188;
    int _1202 = _1196;
    float _1204 = _1166;
    float _1206 = _1142;
    if (!_912)
    {
        int _1208 = ~_864;
        int _1210 = _1208 + 1;
        _1200 = _1210;
    }
    int _1212 = _1200;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _856 + _1214;
    float _1218 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1122);
    if (!_890)
    {
        int _1220 = ~_964;
        int _1222 = _1220 + 1;
        _1202 = _1222;
    }
    int _1224 = _1202;
    float _1226 = exp2(_1198);
    float _1228 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1178);
    if (_714)
    {
        _1204 = _610;
    }
    float _1230 = _1204;
    float _1232 = float(_1212);
    float _1234 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1236 = _1230;
    if (!_714)
    {
        _1236 = _580;
    }
    float _1238 = _1236;
    float _1240 = float(_1180);
    float _1242 = float(_1224);
    float _1244 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1246 = float(_1176);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1250 = _1022 + _1248;
    bool _1252 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1254 = isnan(0.0);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1260 = _1256 || _1258;
    float _1262 = _1240 * _1242;
    float _1264 = _1246 * _1232;
    float _1266 = fma(_1244, -2.0, _1190);
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1270 = in.m_63.x;
    float _1272 = in.m_63.y;
    float _1274 = in.m_63.z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1280 = 1.0 + _1278;
    float _1282 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1268);
    float _1284 = -_1226;
    float _1286 = _1284 + 1.0;
    float _1288 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1276);
    float _1290 = 1.0 / _1280;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _866 + _1292;
    float _1296 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1156);
    float _1298 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1288);
    float _1300 = _1250 * _1250;
    float _1302 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1282);
    float _1304 = -_1296;
    float _1306 = fma(_1218, _1046, _1304);
    float _1308 = _1260 ? _1286 : 0.0;
    float _1310 = _1264 * (-2.0);
    float _1312 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1266);
    float _1314 = _1060 + 0.5;
    float _1316 = _1306 + 0.5;
    bool _1318 = _1302 >= 0.0;
    float _1320 = -_1312;
    float _1322 = fma(_1298, _948, _1320);
    float _1324 = fma(_1216, _1216, _1300);
    float _1326 = fma(_888, _1310, _888);
    bool _1328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(1.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = _1172 + 0.5;
    float _1340 = fma(_1294, _1294, _1324);
    float _1342 = fma(_1310, _1270, _1270);
    float _1344 = _1262 * (-2.0);
    float _1346 = _1142 + 0.5;
    out.m_65.w = _1234;
    float _1348 = rsqrt(_1340);
    float _1350 = fma(_868, _1344, _868);
    float _1352 = fma(_1344, _1272, _1272);
    float _1354 = _580 + (-0.5);
    float _1356 = _1274;
    if (_1318)
    {
        _1206 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1358 = _1206;
    out.m_67.x = _1346;
    out.m_67.y = _1314;
    out.m_67.z = _1338;
    out.m_67.w = _1316;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1342);
    float _1362 = _1182 + 0.5;
    int _1364 = as_type<int>(_1358);
    if (_1318)
    {
        float _1366 = _1358 * 5.0;
        _1364 = as_type<int>(_1366);
    }
    int _1368 = _1364;
    float _1370 = _1322 + 0.5;
    if (_1336)
    {
        float _1372 = _1308 * _1290;
        _138 = _1372;
    }
    float _1374 = _138;
    bool _1376 = !_768;
    int _1378 = _1376 ? 0 : 1;
    if (_1318)
    {
        out.m_45.x = 0.0;
    }
    float _1380 = fma(_1326, _1374, _1360);
    if (_1318)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4411 = as_type<float>(_1368);
        out.gl_Position.z = _4411;
    }
    float _1382 = _586 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1384 = abs(_1378);
    out.m_69.x = _1362;
    out.m_69.y = _1370;
    float _1386 = _1382 * _1348;
    float _1388 = _1216 * _1386;
    float _1390 = _1250 * _1386;
    if (_1318)
    {
        return out;
    }
    float _1392 = -_1390;
    float _1394 = _1022 + _1392;
    float _1396 = float(_1384);
    float _1398 = -_1388;
    float _1400 = _856 + _1398;
    float _1402 = _1294 * _1386;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1406 = _1394 + _1404;
    float _1408 = _1380 * 0.15915493667125701904296875;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1412 = _1400 + _1410;
    float _1414 = -_1402;
    float _1416 = _866 + _1414;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1420 = _610 + (-0.5);
    float _1422 = float(_1106);
    float _1424 = _580 + _604;
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1418);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1430 = _1416 + _1428;
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1434 = _1396 * _1422;
    float _1436 = -_1390;
    float _1438 = _1250 + _1436;
    float _1440 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1426);
    float _1442 = fma(_1350, _1374, _1432);
    float _1444 = _1424 + (-1.0);
    float _1446 = _1434 * (-2.0);
    bool _1448 = _1440 >= 0.0;
    float _1450 = -_1388;
    float _1452 = _1216 + _1450;
    float _1454 = _1438 * _1438;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1458 = fma(_1446, _1274, _1274);
    float _1460 = _604 + (-0.5);
    float _1462 = fma(_1452, _1452, _1454);
    float _1464 = -_1402;
    float _1466 = _1294 + _1464;
    float _1468 = fma(_1456, _1446, _1456);
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1458);
    float _1472 = _1442 * 0.15915493667125701904296875;
    float _1474 = fma(_1466, _1466, _1462);
    float _1476 = _1408 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    if (_1448)
    {
        _1356 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1356;
    float _1482 = fma(_1468, _1374, _1470);
    int _1484 = as_type<int>(_1480);
    if (_1448)
    {
        out.m_45.x = 0.0;
    }
    if (_1448)
    {
        float _1486 = _1480 * 5.0;
        _1484 = as_type<int>(_1486);
    }
    int _1488 = _1484;
    float _1490 = _1408 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    if (_1448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4604 = as_type<float>(_1488);
        out.gl_Position.z = _4604;
    }
    float _1494 = _1472 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = _1472 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = sqrt(_1474);
    if (_1448)
    {
        return out;
    }
    float _1504 = in.m_71.x;
    float _1506 = in.m_71.y;
    float _1508 = in.m_71.z;
    float _1510 = _1482 * 0.15915493667125701904296875;
    float _1512 = _1348 * _1502;
    float _1514 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1516 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1510 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _586 * _1512;
    float _1524 = _1512 * _1514;
    float _1526 = _1512 * _1516;
    float _1528 = _1492 * _1500;
    float _1530 = _1492 * _1496;
    float _1532 = _1478 * _1500;
    float _1534 = _1510 * 6.283185482025146484375;
    float _1536 = sin(_1534);
    float _1538 = _1478 * _1496;
    float _1540 = _1492 * _1520;
    float _1542 = _1500 * _1520;
    float _1544 = _1478 * _1520;
    float _1546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1506);
    float _1548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1504);
    float _1550 = _1496 * _1520;
    float _1552 = _1526 * _1546;
    float _1554 = _1522 * _1548;
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1558 = fma(_1536, _1528, _1538);
    float _1560 = _1540 * _1552;
    float _1562 = -_1532;
    float _1564 = fma(_1536, _1530, _1562);
    float _1566 = _1524 * _1556;
    float _1568 = -_1552;
    float _1570 = _1536 * _1568;
    float _1572 = fma(_1558, _1554, _1560);
    float _1574 = -_1530;
    float _1576 = fma(_1536, _1532, _1574);
    float _1578 = _1544 * _1552;
    float _1580 = fma(_1542, _1554, _1570);
    float _1582 = fma(_1564, _1566, _1572);
    float _1584 = fma(_1536, _1538, _1528);
    float _1586 = fma(_1576, _1554, _1578);
    float _1588 = fma(_1550, _1566, _1580);
    float _1590 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1592 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1594 = fma(_1584, _1566, _1586);
    float _1596 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1592);
    float _1600 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1596);
    float _1602 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1598);
    float _1604 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1606 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1608 = _866 + _1604;
    float _1610 = _856 + _1606;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1614 = _1608 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1618 = _1610 + _1616;
    float _1620 = _1614 * _1614;
    float _1622 = fma(_1618, _1618, _1620);
    float _1624 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1626 = sqrt(_1622);
    float _1628 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1624);
    float _1630 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1634 = _1022 + _1632;
    bool _1636 = _1626 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1638 = _1594;
    float _1640 = _1624;
    float _1642 = _1632;
    float _1644 = _1610;
    float _1646 = _1608;
    float _1648 = _1614;
    if (!_1636)
    {
        _1638 = _1610;
    }
    float _1650 = _1638;
    float _1652 = _1650;
    if (!_1636)
    {
        _1640 = _1608;
    }
    float _1654 = _1640;
    float _1656 = _1654;
    if (!_1636)
    {
        _1642 = _1634;
    }
    float _1658 = _1642;
    bool _1660 = !_1636;
    float _1662 = _1658;
    if (!_1660)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1668 = _1626 + _1666;
        float _1670 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = rsqrt(_1622);
        float _1674 = _1668 * _1664;
        float _1676 = _1674 * 0.15915493667125701904296875;
        float _1678 = _1676 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1680 + (-1.0);
        float _1688 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = fma(_1684, _1670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = fma(_1634, _1680, _1688);
        float _1694 = _1672 * _1690;
        float _1696 = fma(_1618, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1698 = fma(_1614, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1662 = _1692;
        _1652 = _1696;
        _1656 = _1698;
        _1644 = _1690;
        _1646 = _1676;
    }
    float _1700 = _1662;
    float _1702 = _1652;
    float _1704 = _1656;
    float _1706 = _1644;
    float _1708 = _1646;
    float _1710 = -_1390;
    float _1712 = _1710 + _1700;
    float _1714 = -_1388;
    float _1716 = _1714 + _1702;
    float _1718 = -_1402;
    float _1720 = _1718 + _1704;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1724 = _1712 + _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1728 = _1716 + _1726;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1732 = _1720 + _1730;
    float _1734 = _1724 * _1724;
    float _1736 = fma(_1728, _1728, _1734);
    float _1738 = fma(_1732, _1732, _1736);
    float _1740 = rsqrt(_1738);
    float _1742 = sqrt(_1738);
    float _1744 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1728 * _1744;
    float _1748 = _1732 * _1744;
    float _1750 = _1746 * _1746;
    float _1752 = _1748 * _1748;
    float _1754 = _1750 + _1752;
    float _1756 = sqrt(_1754);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = _1756 + _1760;
    float _1764 = _1706;
    float _1766 = _1754;
    float _1768 = _1762;
    float _1770 = _1744;
    if (_1758)
    {
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1772;
    }
    float _1774 = _1764;
    if (_1758)
    {
        float _1776 = rsqrt(_1754);
        _1766 = _1776;
    }
    float _1778 = _1766;
    float _1780 = _1778;
    if (_1758)
    {
        float _1782 = _1762 * _1774;
        _1768 = _1782;
    }
    float _1784 = _1768;
    if (_1758)
    {
        float _1786 = _1784 * 0.15915493667125701904296875;
        _1648 = _1786;
    }
    float _1788 = _1648;
    float _1790 = _1708;
    float _1792 = _1788;
    if (_1758)
    {
        float _1794 = _1788 * 6.283185482025146484375;
        float _1796 = sin(_1794);
        _1790 = _1796;
    }
    float _1798 = _1790;
    float _1800 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1802 = precise::max(0.0, _1800);
    float _1804 = _1634;
    float _1806 = _1802;
    float _1808 = _1800;
    if (_1758)
    {
        float _1810 = _1788 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        _1804 = _1812;
    }
    float _1814 = _1804;
    float _1816 = -_1744;
    float _1818 = -_1802;
    float _1820 = fma(_1724, _1816, _1818);
    if (_1758)
    {
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1822;
    }
    float _1824 = _1806;
    float _1826 = _1824;
    float _1828 = _1798;
    if (_1758)
    {
        float _1830 = fma(_1798, _1824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = _1832;
    if (!_1758)
    {
        _1828 = _1746;
    }
    float _1836 = _1828;
    float _1838 = _1836;
    float _1840 = _1814;
    if (_1758)
    {
        float _1842 = _1814 + (-1.0);
        _1808 = _1842;
    }
    float _1844 = _1808;
    float _1846 = _1844;
    if (_1758)
    {
        float _1848 = _1778 * _1832;
        _1770 = _1848;
    }
    float _1850 = _1770;
    if (!_1758)
    {
        _1834 = _1820;
    }
    float _1852 = _1834;
    float _1854 = _1852;
    if (_1758)
    {
        float _1856 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1856;
    }
    float _1858 = _1792;
    if (_1758)
    {
        float _1860 = _1746 * _1850;
        _1838 = _1860;
    }
    float _1862 = _1838;
    if (!_1758)
    {
        _1846 = _1748;
    }
    float _1864 = _1846;
    float _1866 = _1864;
    if (_1758)
    {
        float _1868 = _1748 * _1850;
        _1866 = _1868;
    }
    float _1870 = _1866;
    if (!_1758)
    {
        _1780 = _1750;
    }
    float _1872 = _1780;
    float _1874 = _1872;
    if (_1758)
    {
        float _1876 = fma(_1820, _1814, _1858);
        _1854 = _1876;
    }
    float _1878 = _1854;
    if (_1758)
    {
        float _1880 = _1862 * _1862;
        _1874 = _1880;
    }
    float _1882 = _1874;
    if (!_1758)
    {
        _1840 = _1752;
    }
    float _1884 = _1840;
    float _1886 = _1884;
    if (_1758)
    {
        float _1888 = _1870 * _1870;
        _1886 = _1888;
    }
    float _1890 = _1886;
    float _1892 = fma(_1878, _1878, _1882);
    float _1894 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1896 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1898 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1900 = _1892 + _1890;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1894);
    float _1910 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1912 = rsqrt(_1900);
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1908);
    float _1920 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    float _1922 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1910);
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1928 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1920);
    float _1930 = abs(_1916);
    float _1932 = log2(_1930);
    float _1934 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1924);
    float _1936 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _1938 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1942 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1944 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1936);
    float _1946 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1948 = _1912 * _1862;
    float _1950 = _1912 * _1878;
    float _1952 = _1912 * _1870;
    float _1954 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1946);
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1958 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1960 = -_1940;
    float _1962 = fma(_1960, _1896, 1.0);
    float _1964 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1954);
    float _1966 = -_1956;
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1966);
    float _1970 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1972 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1964);
    float _1976 = -_1952;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1968);
    float _1980 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1982 = log2(_1962);
    float _1984 = fma(_1978, -0.5, 0.5);
    float _1986 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1980);
    float _1988 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1972);
    float _1990 = fma(_1978, 0.5, 0.5);
    float _1992 = _1950 + 1.0;
    float _1994 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1986);
    float _1996 = exp2(_1970);
    float _1998 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1988);
    float _2000 = fma(_1990, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1998);
    float _2004 = fma(_1990, _2000, -0.212114393711090087890625);
    float _2006 = 1.0 / _1974;
    float _2008 = _1982 * 0.693147182464599609375;
    float _2010 = fma(_1990, _2004, 1.570728778839111328125);
    float _2012 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2014 = sqrt(_1984);
    float _2016 = -_1950;
    float _2018 = fma(_1996, _1992, _2016);
    float _2020 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1994);
    float _2022 = _2020 * _2006;
    float _2024 = _2002 * _2006;
    float _2026 = fma(_2022, 0.5, 0.5);
    float _2028 = fma(_2024, -0.5, 0.5);
    float _2030 = _2014 * 0.636619746685028076171875;
    float3 _5479 = float3(_2026, _2028, _2012);
    float _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5479, float3(0.0), isnan(_5479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5479, float3(0.0), isnan(_5479)), level(0.0)).x;
    float _2034 = -_2010;
    float _2036 = fma(_2030, _2034, 1.0);
    float _2038 = fma(_2018, 0.5, 0.5);
    float3 _5497 = float3(_2026, _2028, _2012);
    float4 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5497, float3(0.0), isnan(_5497)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5497, float3(0.0), isnan(_5497)), level(0.0)).xyzw;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = _2041.w;
    float2 _5514 = float2(_2036, _2038);
    float3 _2053 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5514, float2(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5514, float2(0.0), isnan(_5514)), level(0.0)).xyz;
    float _2055 = _2053.x;
    float _2057 = _2053.y;
    float _2059 = _2053.z;
    float _2061 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2063 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2065 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2075 = _2071 || _2073;
    float _2077 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2061);
    float _2079 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2063);
    float _2081 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2083 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2085 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2065);
    float _2087 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2079);
    float _2089 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2081);
    float _2091 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2083);
    float _2093 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2077);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2097 = in.m_73.x;
    float _2099 = in.m_73.y;
    float _2101 = in.m_73.z;
    bool _2103 = _1506 != 0.0;
    bool _2105 = isnan(_1506);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(0.0);
    bool _2111 = _2107 || _2109;
    float _2113 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2115 = 1.0 / _2095;
    float _2117 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2119 = _1504 == 0.0;
    bool _2121 = !_2111;
    bool _2123 = _2119 && _2121;
    float _2125 = -_1536;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2113);
    float _2129 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2131 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2133 = _1508 == 0.0;
    bool _2135 = _2133 && _2123;
    float _2137 = -_1536;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2117);
    float _2141 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2085);
    float _2143 = _2129 + _2095;
    float _2145 = -_1536;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2131);
    float _2149 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2089);
    float _2151 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2153 = 0.0;
    float _2155 = _2091;
    float _2157 = _2151;
    if (!_2075)
    {
        _2153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2159 = _2153;
    float _2161 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2091);
    float _2163 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2165 = _2143 * _2115;
    float _2167 = _2165 * 0.5;
    float _2169 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2171 = _2169;
    if (!_2075)
    {
        _2155 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2173 = _2155;
    float _2175 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2177 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2151);
    float _2179 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2163);
    if (!_2075)
    {
        float _2181 = -_2159;
        float _2183 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2181);
        _2157 = _2183;
    }
    float _2185 = _2157;
    float _2187 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2169);
    if (!_2075)
    {
        float _2189 = -_2173;
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2171 = _2191;
    }
    float _2193 = _2171;
    float _2195 = _2099;
    float _2197 = _2097;
    float _2199 = _2101;
    if (!_2135)
    {
        float _2201 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2099);
        _2195 = _2201;
    }
    float _2203 = _2195;
    float _2205 = exp2(_2175);
    if (!_2135)
    {
        float _2207 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2097);
        _2197 = _2207;
    }
    float _2209 = _2197;
    float _2211 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2127);
    if (!_2135)
    {
        float _2213 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2101);
        _2199 = _2213;
    }
    float _2215 = _2199;
    float _2217 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2139);
    float _2219 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2147);
    float _2221 = _2211 * _2203;
    float _2223 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2179);
    float _2225 = _1506;
    float _2227 = _2221;
    if (!_2075)
    {
        float _2229 = 1.0 / _2185;
        _2225 = _2229;
    }
    float _2231 = _2225;
    float _2233 = _2217 * _2203;
    float _2235 = _2219 * _2203;
    float _2237 = fma(_2149, _2209, _2221);
    float _2239 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2177);
    float _2243 = fma(_2141, _2209, _2233);
    float _2245 = fma(_2161, _2209, _2235);
    float _2247 = _2193;
    if (!_2075)
    {
        float _2249 = 1.0 / _2193;
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2187);
    float _2255 = fma(_2223, _2215, _2237);
    float _2257 = _1974 * 0.5;
    float _2259 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2261 = -_2205;
    float _2263 = _2261 + 1.0;
    float _2265 = fma(_2241, _2215, _2243);
    float _2267 = fma(_2253, _2215, _2245);
    float _2269 = _2231;
    if (!_2075)
    {
        float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2273 = -_2173;
        float _2275 = fma(_2231, _2271, _2273);
        _2269 = _2275;
    }
    float _2277 = _2269;
    if (_2075)
    {
        _2227 = 1.0;
    }
    float _2279 = _2227;
    float _2281 = fma(_2002, -0.5, _2257);
    float _2283 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2259);
    float _2285 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _2255;
    out.m_75.y = _2265;
    out.m_75.z = _2267;
    float _2287 = _2020 + _1974;
    float _2289 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2283);
    float _2291 = _2279;
    if (!_2075)
    {
        float _2293 = _2277 * _2251;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2291 = _2295;
    }
    float _2297 = _2291;
    float _2299 = _2287 * 0.5;
    float _2301 = _2289 + _1974;
    float _2303 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2305 = _2297 > 0.0;
    bool _2307 = isnan(_2297);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.0);
    bool _2313 = _2309 || _2311;
    out.m_77.x = _1728;
    out.m_77.y = _1724;
    out.m_77.z = _1732;
    float _2315 = _2301 * 0.5;
    float _2317 = _2303 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2020;
    out.gl_Position.y = _2002;
    out.gl_Position.z = _2289;
    out.gl_Position.w = _1974;
    out.m_79.x = _2299;
    out.m_79.y = _2281;
    out.m_79.z = _2315;
    out.m_79.w = _1974;
    out.m_45.x = _2317;
    float _2319 = _2285 * _2032;
    float _2321 = -_2285;
    float _2323 = _2321 + 1.0;
    float _2325 = _2049 * _2319;
    float _2327 = _2049 * _2323;
    float _2329 = _2059 * _2319;
    float _2331 = fma(_2055, _2325, _2043);
    float _2333 = fma(_2057, _2325, _2045);
    float _2335 = fma(_2049, _2329, _2047);
    out.m_81.x = _2331;
    out.m_81.y = _2333;
    out.m_81.z = _2335;
    out.m_81.w = _2327;
    if (_2313)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2337 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2337;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _566 = false;
    bool _424 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2394 = as_type<float>(_116);
        out.gl_Position.z = _2394;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2463 = as_type<float>(_154);
        out.gl_Position.z = _2463;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_49.w;
    float _158 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_100);
        float _302 = 1.0 / _300;
        float _304 = _134 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _306 + _308;
    bool _312 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_306);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -_322;
    float _330 = _328 + 1.0;
    bool _332 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _334 = isnan(_306);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = 1.0 / _326;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _356 = _310 * _344;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = in.m_49.x;
    float _364 = in.m_49.y;
    float _366 = in.m_49.z;
    float _368 = _342 * _330;
    float _370 = fma(_348, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = fma(_360, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _374 = fma(_352, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _376 = -_342;
    float _378 = _376 + 1.0;
    float _380 = _370 * _368;
    float _382 = _372 * _368;
    float _384 = _374 * _368;
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _380);
    float _388 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _382);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _384);
    float _392 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].x, _386);
    float _394 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].y, _388);
    float _396 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[144].z, _390);
    float _398 = _392 * _362;
    float _400 = _394 * _364;
    float _402 = _396 * _366;
    bool _404 = !_354;
    float _422;
    if (!_404)
    {
        float _406 = in.m_51.x;
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _410 = _406 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_100);
        float _428 = 1.0 / _426;
        float _430 = _134 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _432 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _442 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _444 = isnan(_432);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _458 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _460 = isnan(_432);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _470;
    bool _474 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _476 = isnan(_432);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = 1.0 / _440;
    float _488 = -_452;
    float _490 = _488 + 1.0;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _494 = 1.0 / _456;
    float _496 = _472 * _486;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _502 = -_484;
    float _504 = _502 + 1.0;
    float _506 = fma(_496, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _508 = _468 * _490;
    float _510 = -_468;
    float _512 = _510 + 1.0;
    float _514 = _452 * _504;
    float _516 = _500 * _494;
    float _518 = _506 * _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _432 + _520;
    float _524 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[115].x, _518);
    float _526 = fma(_516, _522, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = fma(_526, _514, _524);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _536 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[117].x, _530);
    float _538 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _540 = _532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _542 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _538;
    out.m_53.y = _540;
    out.m_53.z = _542;
    out.m_53.w = _544;
    bool _546 = !_492;
    float _564;
    if (!_546)
    {
        float _548 = in.m_51.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        float _568 = float(_100);
        float _570 = 1.0 / _568;
        float _572 = _134 * _570;
        _564 = _572;
    }
    _566 = false;
    float _574 = _564;
    float _576 = in.m_55.x;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _580 = in.m_51.x;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _584 = _582 != 0;
    float _586 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _590 = _588 != 0;
    float _592 = in.m_55.y;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _596 = _594 != 0;
    float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _602 = _600 != 0;
    float _604 = in.m_51.z;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _608 = _606 != 0;
    float _610 = in.m_51.y;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _614 = _612 != 0;
    float _616 = _578 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _618 = in.m_51.w;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _626 = in.m_57.x;
    float _628 = in.m_57.y;
    float _630 = in.m_57.z;
    float _632 = in.m_57.w;
    int _634 = 0;
    float _636 = _574;
    if (_584)
    {
        float _638 = -_576;
        float _640 = _638 + 1.0;
        _634 = as_type<int>(_640);
    }
    int _642 = _634;
    float _644 = 0.0;
    if (!_584)
    {
        _644 = _576;
    }
    float _646 = _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _652 = in.m_59.x;
    float _654 = in.m_59.y;
    float _656 = in.m_59.z;
    float _658 = in.m_59.w;
    bool _660 = false;
    float _662 = _646;
    if (_584)
    {
        bool _664 = _580 > 0.5;
        _660 = _664;
    }
    bool _666 = _660;
    int _668 = 0;
    if (_590)
    {
        float _670 = -_576;
        float _672 = _670 + 1.0;
        _668 = as_type<int>(_672);
    }
    int _674 = _668;
    float _676 = in.m_61.x;
    float _678 = in.m_61.y;
    float _680 = in.m_61.z;
    float _682 = in.m_61.w;
    if (_584)
    {
        float _684 = _666 ? as_type<float>(_642) : _576;
        _662 = _684;
    }
    float _686 = _662;
    float _688 = -_592;
    float _690 = _688 + 1.0;
    float _692 = 1.0 / _650;
    bool _694 = _604 > 0.5;
    float _696 = _604 * 2.0;
    float _698 = _624 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _700 = _610 > 0.5;
    int _702 = _694 ? as_type<int>(_690) : as_type<int>(_592);
    float _704 = floor(_696);
    int _706 = _700 ? as_type<int>(_690) : as_type<int>(_592);
    float _708 = fma(_698, _686, -0.5);
    float _710 = _602 ? as_type<float>(_702) : _592;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _714 = _712 != 0;
    float _716 = _608 ? as_type<float>(_706) : _592;
    float _718 = _274 * _628;
    float _720 = _274 * _654;
    bool _722 = _618 > 0.5;
    float _724 = 1.0 / _622;
    float _726 = _274 * _678;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _732 = _592;
    float _734 = _678;
    if (_596)
    {
        float _736 = _722 ? _690 : _592;
        _732 = _736;
    }
    float _738 = _732;
    float _740 = fma(_272, _626, _718);
    float _742 = _610 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _744 = 1.0 / _730;
    if (!_590)
    {
        _734 = _576;
    }
    float _746 = _734;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _752 = _746;
    if (_590)
    {
        float _754 = _694 ? as_type<float>(_674) : _576;
        _752 = _754;
    }
    float _756 = _752;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _768 = _766 != 0;
    float _770 = fma(_272, _652, _720);
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _774 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _776 = 1.0 / _750;
    float _778 = -_772;
    float _780 = fma(_774, 2.0, _778);
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _784 = fma(_272, _676, _726);
    float _786 = fma(_276, _630, _740);
    float _788 = fma(_276, _656, _770);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _798 = fma(_276, _680, _784);
    float _800 = fma(_742, -2.0, _782);
    float _802 = _792 * _692;
    float _804 = _796 * _724;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    int _810 = as_type<int>(_796);
    float _812 = _808;
    float _814 = _800;
    if (_614)
    {
        float _816 = -_576;
        float _818 = _816 + 1.0;
        _810 = as_type<int>(_818);
    }
    int _820 = _810;
    float _822 = _580 * 2.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _824;
    float _828 = _808 * _776;
    if (!_614)
    {
        _812 = _576;
    }
    float _830 = _812;
    float _832 = floor(_822);
    float _834 = _830;
    if (_614)
    {
        float _836 = _700 ? as_type<float>(_820) : _576;
        _834 = _836;
    }
    float _838 = _834;
    float _840 = _610 + _604;
    float _842 = _826 * _744;
    float _844 = _610 * 2.0;
    bool _846 = _704 >= 0.0;
    bool _848 = isnan(_704);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = _786 + _632;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _860 = _840 + (-1.0);
    float _862 = _580 + _610;
    int _864 = _854 ? 0 : 1;
    float _866 = _798 + _682;
    float _868 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _870 = _862 + (-1.0);
    float _872 = floor(_844);
    bool _874 = _832 >= 0.0;
    bool _876 = isnan(_832);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = -_134;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _780);
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _890 = _832 > 0.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _894 = _574 + _892;
    bool _896 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _898 = isnan(_574);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _910 = _574 + _908;
    bool _912 = _704 > 0.0;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _916 = _574 + _914;
    float _918 = fma(_802, _894, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _920 = fma(_616, _716, -0.5);
    float _922 = fma(_842, _910, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _924 = fma(_804, _916, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _926 = _858 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _930 = _574 + _928;
    float _932 = -_906;
    float _934 = _932 + 1.0;
    bool _936 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _938 = isnan(_574);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = fma(_710, _926, -0.5);
    bool _950 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _952 = isnan(_574);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = fma(_828, _930, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _964 = _882 ? 0 : 1;
    float _966 = -_946;
    float _968 = _966 + 1.0;
    bool _970 = _872 >= 0.0;
    bool _972 = isnan(_872);
    bool _974 = _970 || _972;
    bool _976 = isnan(0.0);
    bool _978 = _974 || _976;
    float _980 = _960 * _934;
    float _982 = -_960;
    float _984 = _982 + 1.0;
    bool _986 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _988 = isnan(_574);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    int _998 = _978 ? 0 : 1;
    float _1000 = _946 * _984;
    bool _1002 = _872 > 0.0;
    float _1004 = _996 * _968;
    bool _1006 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1008 = isnan(_574);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = -_996;
    float _1020 = _1018 + 1.0;
    float _1022 = _788 + _658;
    float _1024 = _918;
    if (_714)
    {
        _636 = _580;
    }
    float _1026 = _636;
    float _1028 = _1016 * _1020;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1032 = _1026;
    if (!_714)
    {
        _1032 = _604;
    }
    float _1034 = _1032;
    float _1036 = _918 * _1028;
    float _1038 = _598 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1040 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1030);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1044 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1046 = fma(_1038, _738, -0.5);
    float _1048 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1040);
    float _1050 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _800);
    float _1052 = -_1042;
    float _1054 = fma(_1044, 2.0, _1052);
    if (!_714)
    {
        _1024 = _610;
    }
    float _1056 = _1024;
    float _1058 = -_1050;
    float _1060 = fma(_1048, _920, _1058);
    float _1062 = _1056;
    if (_714)
    {
        _1062 = _580;
    }
    float _1064 = _1062;
    float _1066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1070 = -_1016;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1068);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1078 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1036);
    if (!_714)
    {
        _814 = _604;
    }
    float _1084 = _814;
    float _1086 = -_1076;
    float _1088 = fma(_1078, 2.0, _1086);
    int _1090 = ~_998;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    float _1096 = fma(_924, _1004, _1082);
    int _1098 = _1094;
    float _1100 = _1084;
    if (!_1002)
    {
        int _1102 = ~_998;
        int _1104 = _1102 + 1;
        _1098 = _1104;
    }
    int _1106 = _1098;
    float _1108 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1112 = _1110;
    if (_714)
    {
        _1100 = _610;
    }
    float _1114 = _1100;
    float _1116 = fma(_1108, _756, -0.5);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1120 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1074);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1110);
    float _1124 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1126 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1118);
    if (!_714)
    {
        _1112 = _604;
    }
    float _1128 = _1112;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1132 = _1128;
    if (_714)
    {
        _1132 = _610;
    }
    float _1134 = _1132;
    float _1136 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1126);
    float _1138 = fma(_1124, _838, -0.5);
    float _1140 = fma(_922, _1000, _1096);
    float _1142 = fma(_1136, _708, _886);
    float _1144 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1152 = !_764;
    int _1154 = _1152 ? 0 : 1;
    float _1156 = fma(_1144, -2.0, _1130);
    float _1158 = -_134;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1088);
    float _1162 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1150);
    bool _1164 = !_760;
    float _1166 = _1164 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1168 = -_134;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1054);
    float _1172 = fma(_1120, _1116, _1160);
    float _1174 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1162);
    int _1176 = abs(as_type<int>(_1166));
    float _1178 = fma(_962, _980, _1140);
    int _1180 = abs(_1154);
    float _1182 = fma(_1174, _1138, _1170);
    int _1184 = ~_864;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1192 = ~_964;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = _1148 * _134;
    int _1200 = _1188;
    int _1202 = _1196;
    float _1204 = _1166;
    float _1206 = _1142;
    if (!_912)
    {
        int _1208 = ~_864;
        int _1210 = _1208 + 1;
        _1200 = _1210;
    }
    int _1212 = _1200;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1216 = _856 + _1214;
    float _1218 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1122);
    if (!_890)
    {
        int _1220 = ~_964;
        int _1222 = _1220 + 1;
        _1202 = _1222;
    }
    int _1224 = _1202;
    float _1226 = exp2(_1198);
    float _1228 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1178);
    if (_714)
    {
        _1204 = _610;
    }
    float _1230 = _1204;
    float _1232 = float(_1212);
    float _1234 = _1228 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1236 = _1230;
    if (!_714)
    {
        _1236 = _580;
    }
    float _1238 = _1236;
    float _1240 = float(_1180);
    float _1242 = float(_1224);
    float _1244 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1246 = float(_1176);
    float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1250 = _1022 + _1248;
    bool _1252 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1254 = isnan(0.0);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1260 = _1256 || _1258;
    float _1262 = _1240 * _1242;
    float _1264 = _1246 * _1232;
    float _1266 = fma(_1244, -2.0, _1190);
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1270 = in.m_63.x;
    float _1272 = in.m_63.y;
    float _1274 = in.m_63.z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1280 = 1.0 + _1278;
    float _1282 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1268);
    float _1284 = -_1226;
    float _1286 = _1284 + 1.0;
    float _1288 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1276);
    float _1290 = 1.0 / _1280;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1294 = _866 + _1292;
    float _1296 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1156);
    float _1298 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1288);
    float _1300 = _1250 * _1250;
    float _1302 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1282);
    float _1304 = -_1296;
    float _1306 = fma(_1218, _1046, _1304);
    float _1308 = _1260 ? _1286 : 0.0;
    float _1310 = _1264 * (-2.0);
    float _1312 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1266);
    float _1314 = _1060 + 0.5;
    float _1316 = _1306 + 0.5;
    bool _1318 = _1302 >= 0.0;
    float _1320 = -_1312;
    float _1322 = fma(_1298, _948, _1320);
    float _1324 = fma(_1216, _1216, _1300);
    float _1326 = fma(_888, _1310, _888);
    bool _1328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1330 = isnan(1.0);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1336 = _1332 || _1334;
    float _1338 = _1172 + 0.5;
    float _1340 = fma(_1294, _1294, _1324);
    float _1342 = fma(_1310, _1270, _1270);
    float _1344 = _1262 * (-2.0);
    float _1346 = _1142 + 0.5;
    out.m_65.w = _1234;
    float _1348 = rsqrt(_1340);
    float _1350 = fma(_868, _1344, _868);
    float _1352 = fma(_1344, _1272, _1272);
    float _1354 = _580 + (-0.5);
    float _1356 = _1274;
    if (_1318)
    {
        _1206 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1358 = _1206;
    out.m_67.x = _1346;
    out.m_67.y = _1314;
    out.m_67.z = _1338;
    out.m_67.w = _1316;
    float _1360 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1342);
    float _1362 = _1182 + 0.5;
    int _1364 = as_type<int>(_1358);
    if (_1318)
    {
        float _1366 = _1358 * 5.0;
        _1364 = as_type<int>(_1366);
    }
    int _1368 = _1364;
    float _1370 = _1322 + 0.5;
    if (_1336)
    {
        float _1372 = _1308 * _1290;
        _138 = _1372;
    }
    float _1374 = _138;
    bool _1376 = !_768;
    int _1378 = _1376 ? 0 : 1;
    if (_1318)
    {
        out.m_45.x = 0.0;
    }
    float _1380 = fma(_1326, _1374, _1360);
    if (_1318)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4411 = as_type<float>(_1368);
        out.gl_Position.z = _4411;
    }
    float _1382 = _586 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1384 = abs(_1378);
    out.m_69.x = _1362;
    out.m_69.y = _1370;
    float _1386 = _1382 * _1348;
    float _1388 = _1216 * _1386;
    float _1390 = _1250 * _1386;
    if (_1318)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1392 = -_1390;
    float _1394 = _1022 + _1392;
    float _1396 = float(_1384);
    float _1398 = -_1388;
    float _1400 = _856 + _1398;
    float _1402 = _1294 * _1386;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1406 = _1394 + _1404;
    float _1408 = _1380 * 0.15915493667125701904296875;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1412 = _1400 + _1410;
    float _1414 = -_1402;
    float _1416 = _866 + _1414;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1420 = _610 + (-0.5);
    float _1422 = float(_1106);
    float _1424 = _580 + _604;
    float _1426 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1418);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1430 = _1416 + _1428;
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1352);
    float _1434 = _1396 * _1422;
    float _1436 = -_1390;
    float _1438 = _1250 + _1436;
    float _1440 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1426);
    float _1442 = fma(_1350, _1374, _1432);
    float _1444 = _1424 + (-1.0);
    float _1446 = _1434 * (-2.0);
    bool _1448 = _1440 >= 0.0;
    float _1450 = -_1388;
    float _1452 = _1216 + _1450;
    float _1454 = _1438 * _1438;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1458 = fma(_1446, _1274, _1274);
    float _1460 = _604 + (-0.5);
    float _1462 = fma(_1452, _1452, _1454);
    float _1464 = -_1402;
    float _1466 = _1294 + _1464;
    float _1468 = fma(_1456, _1446, _1456);
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1458);
    float _1472 = _1442 * 0.15915493667125701904296875;
    float _1474 = fma(_1466, _1466, _1462);
    float _1476 = _1408 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    if (_1448)
    {
        _1356 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1356;
    float _1482 = fma(_1468, _1374, _1470);
    int _1484 = as_type<int>(_1480);
    if (_1448)
    {
        out.m_45.x = 0.0;
    }
    if (_1448)
    {
        float _1486 = _1480 * 5.0;
        _1484 = as_type<int>(_1486);
    }
    int _1488 = _1484;
    float _1490 = _1408 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    if (_1448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4604 = as_type<float>(_1488);
        out.gl_Position.z = _4604;
    }
    float _1494 = _1472 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    float _1498 = _1472 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = sqrt(_1474);
    if (_1448)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1504 = in.m_71.x;
    float _1506 = in.m_71.y;
    float _1508 = in.m_71.z;
    float _1510 = _1482 * 0.15915493667125701904296875;
    float _1512 = _1348 * _1502;
    float _1514 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1516 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1510 * 6.283185482025146484375;
    float _1520 = cos(_1518);
    float _1522 = _586 * _1512;
    float _1524 = _1512 * _1514;
    float _1526 = _1512 * _1516;
    float _1528 = _1492 * _1500;
    float _1530 = _1492 * _1496;
    float _1532 = _1478 * _1500;
    float _1534 = _1510 * 6.283185482025146484375;
    float _1536 = sin(_1534);
    float _1538 = _1478 * _1496;
    float _1540 = _1492 * _1520;
    float _1542 = _1500 * _1520;
    float _1544 = _1478 * _1520;
    float _1546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1506);
    float _1548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1504);
    float _1550 = _1496 * _1520;
    float _1552 = _1526 * _1546;
    float _1554 = _1522 * _1548;
    float _1556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1558 = fma(_1536, _1528, _1538);
    float _1560 = _1540 * _1552;
    float _1562 = -_1532;
    float _1564 = fma(_1536, _1530, _1562);
    float _1566 = _1524 * _1556;
    float _1568 = -_1552;
    float _1570 = _1536 * _1568;
    float _1572 = fma(_1558, _1554, _1560);
    float _1574 = -_1530;
    float _1576 = fma(_1536, _1532, _1574);
    float _1578 = _1544 * _1552;
    float _1580 = fma(_1542, _1554, _1570);
    float _1582 = fma(_1564, _1566, _1572);
    float _1584 = fma(_1536, _1538, _1528);
    float _1586 = fma(_1576, _1554, _1578);
    float _1588 = fma(_1550, _1566, _1580);
    float _1590 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1592 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1594 = fma(_1584, _1566, _1586);
    float _1596 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1590);
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1592);
    float _1600 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1596);
    float _1602 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1598);
    float _1604 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1606 = _1602 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1608 = _866 + _1604;
    float _1610 = _856 + _1606;
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1614 = _1608 + _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1618 = _1610 + _1616;
    float _1620 = _1614 * _1614;
    float _1622 = fma(_1618, _1618, _1620);
    float _1624 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1626 = sqrt(_1622);
    float _1628 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1624);
    float _1630 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1628);
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1634 = _1022 + _1632;
    bool _1636 = _1626 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1638 = _1594;
    float _1640 = _1624;
    float _1642 = _1632;
    float _1644 = _1610;
    float _1646 = _1608;
    float _1648 = _1614;
    if (!_1636)
    {
        _1638 = _1610;
    }
    float _1650 = _1638;
    float _1652 = _1650;
    if (!_1636)
    {
        _1640 = _1608;
    }
    float _1654 = _1640;
    float _1656 = _1654;
    if (!_1636)
    {
        _1642 = _1634;
    }
    float _1658 = _1642;
    bool _1660 = !_1636;
    float _1662 = _1658;
    if (!_1660)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1668 = _1626 + _1666;
        float _1670 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = rsqrt(_1622);
        float _1674 = _1668 * _1664;
        float _1676 = _1674 * 0.15915493667125701904296875;
        float _1678 = _1676 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1680 + (-1.0);
        float _1688 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = fma(_1684, _1670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = fma(_1634, _1680, _1688);
        float _1694 = _1672 * _1690;
        float _1696 = fma(_1618, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1698 = fma(_1614, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1662 = _1692;
        _1652 = _1696;
        _1656 = _1698;
        _1644 = _1690;
        _1646 = _1676;
    }
    float _1700 = _1662;
    float _1702 = _1652;
    float _1704 = _1656;
    float _1706 = _1644;
    float _1708 = _1646;
    float _1710 = -_1390;
    float _1712 = _1710 + _1700;
    float _1714 = -_1388;
    float _1716 = _1714 + _1702;
    float _1718 = -_1402;
    float _1720 = _1718 + _1704;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1724 = _1712 + _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1728 = _1716 + _1726;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1732 = _1720 + _1730;
    float _1734 = _1724 * _1724;
    float _1736 = fma(_1728, _1728, _1734);
    float _1738 = fma(_1732, _1732, _1736);
    float _1740 = rsqrt(_1738);
    float _1742 = sqrt(_1738);
    float _1744 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1746 = _1728 * _1744;
    float _1748 = _1732 * _1744;
    float _1750 = _1746 * _1746;
    float _1752 = _1748 * _1748;
    float _1754 = _1750 + _1752;
    float _1756 = sqrt(_1754);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1762 = _1756 + _1760;
    float _1764 = _1706;
    float _1766 = _1754;
    float _1768 = _1762;
    float _1770 = _1744;
    if (_1758)
    {
        float _1772 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1772;
    }
    float _1774 = _1764;
    if (_1758)
    {
        float _1776 = rsqrt(_1754);
        _1766 = _1776;
    }
    float _1778 = _1766;
    float _1780 = _1778;
    if (_1758)
    {
        float _1782 = _1762 * _1774;
        _1768 = _1782;
    }
    float _1784 = _1768;
    if (_1758)
    {
        float _1786 = _1784 * 0.15915493667125701904296875;
        _1648 = _1786;
    }
    float _1788 = _1648;
    float _1790 = _1708;
    float _1792 = _1788;
    if (_1758)
    {
        float _1794 = _1788 * 6.283185482025146484375;
        float _1796 = sin(_1794);
        _1790 = _1796;
    }
    float _1798 = _1790;
    float _1800 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1802 = precise::max(0.0, _1800);
    float _1804 = _1634;
    float _1806 = _1802;
    float _1808 = _1800;
    if (_1758)
    {
        float _1810 = _1788 * 6.283185482025146484375;
        float _1812 = cos(_1810);
        _1804 = _1812;
    }
    float _1814 = _1804;
    float _1816 = -_1744;
    float _1818 = -_1802;
    float _1820 = fma(_1724, _1816, _1818);
    if (_1758)
    {
        float _1822 = _1820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1822;
    }
    float _1824 = _1806;
    float _1826 = _1824;
    float _1828 = _1798;
    if (_1758)
    {
        float _1830 = fma(_1798, _1824, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = _1832;
    if (!_1758)
    {
        _1828 = _1746;
    }
    float _1836 = _1828;
    float _1838 = _1836;
    float _1840 = _1814;
    if (_1758)
    {
        float _1842 = _1814 + (-1.0);
        _1808 = _1842;
    }
    float _1844 = _1808;
    float _1846 = _1844;
    if (_1758)
    {
        float _1848 = _1778 * _1832;
        _1770 = _1848;
    }
    float _1850 = _1770;
    if (!_1758)
    {
        _1834 = _1820;
    }
    float _1852 = _1834;
    float _1854 = _1852;
    if (_1758)
    {
        float _1856 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1792 = _1856;
    }
    float _1858 = _1792;
    if (_1758)
    {
        float _1860 = _1746 * _1850;
        _1838 = _1860;
    }
    float _1862 = _1838;
    if (!_1758)
    {
        _1846 = _1748;
    }
    float _1864 = _1846;
    float _1866 = _1864;
    if (_1758)
    {
        float _1868 = _1748 * _1850;
        _1866 = _1868;
    }
    float _1870 = _1866;
    if (!_1758)
    {
        _1780 = _1750;
    }
    float _1872 = _1780;
    float _1874 = _1872;
    if (_1758)
    {
        float _1876 = fma(_1820, _1814, _1858);
        _1854 = _1876;
    }
    float _1878 = _1854;
    if (_1758)
    {
        float _1880 = _1862 * _1862;
        _1874 = _1880;
    }
    float _1882 = _1874;
    if (!_1758)
    {
        _1840 = _1752;
    }
    float _1884 = _1840;
    float _1886 = _1884;
    if (_1758)
    {
        float _1888 = _1870 * _1870;
        _1886 = _1888;
    }
    float _1890 = _1886;
    float _1892 = fma(_1878, _1878, _1882);
    float _1894 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1896 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1898 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1900 = _1892 + _1890;
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1904 = fma(_1742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1902);
    float _1906 = precise::clamp(_1904, 0.0, 1.0);
    float _1908 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1894);
    float _1910 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1912 = rsqrt(_1900);
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1908);
    float _1920 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1898);
    float _1922 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1924 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1910);
    float _1926 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1928 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1920);
    float _1930 = abs(_1916);
    float _1932 = log2(_1930);
    float _1934 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1924);
    float _1936 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1922);
    float _1938 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1942 = _1934 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1944 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1936);
    float _1946 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1948 = _1912 * _1862;
    float _1950 = _1912 * _1878;
    float _1952 = _1912 * _1870;
    float _1954 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1946);
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1958 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1960 = -_1940;
    float _1962 = fma(_1960, _1896, 1.0);
    float _1964 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1954);
    float _1966 = -_1956;
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1966);
    float _1970 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1972 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1974 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1964);
    float _1976 = -_1952;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1968);
    float _1980 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1982 = log2(_1962);
    float _1984 = fma(_1978, -0.5, 0.5);
    float _1986 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1980);
    float _1988 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1972);
    float _1990 = fma(_1978, 0.5, 0.5);
    float _1992 = _1950 + 1.0;
    float _1994 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1986);
    float _1996 = exp2(_1970);
    float _1998 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1988);
    float _2000 = fma(_1990, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1998);
    float _2004 = fma(_1990, _2000, -0.212114393711090087890625);
    float _2006 = 1.0 / _1974;
    float _2008 = _1982 * 0.693147182464599609375;
    float _2010 = fma(_1990, _2004, 1.570728778839111328125);
    float _2012 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2014 = sqrt(_1984);
    float _2016 = -_1950;
    float _2018 = fma(_1996, _1992, _2016);
    float _2020 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1994);
    float _2022 = _2020 * _2006;
    float _2024 = _2002 * _2006;
    float _2026 = fma(_2022, 0.5, 0.5);
    float _2028 = fma(_2024, -0.5, 0.5);
    float _2030 = _2014 * 0.636619746685028076171875;
    float3 _5479 = float3(_2026, _2028, _2012);
    float _2032 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5479, float3(0.0), isnan(_5479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5479, float3(0.0), isnan(_5479)), level(0.0)).x;
    float _2034 = -_2010;
    float _2036 = fma(_2030, _2034, 1.0);
    float _2038 = fma(_2018, 0.5, 0.5);
    float3 _5497 = float3(_2026, _2028, _2012);
    float4 _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5497, float3(0.0), isnan(_5497)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5497, float3(0.0), isnan(_5497)), level(0.0)).xyzw;
    float _2043 = _2041.x;
    float _2045 = _2041.y;
    float _2047 = _2041.z;
    float _2049 = _2041.w;
    float2 _5514 = float2(_2036, _2038);
    float3 _2053 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5514, float2(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5514, float2(0.0), isnan(_5514)), level(0.0)).xyz;
    float _2055 = _2053.x;
    float _2057 = _2053.y;
    float _2059 = _2053.z;
    float _2061 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2063 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2065 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2075 = _2071 || _2073;
    float _2077 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2061);
    float _2079 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2063);
    float _2081 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2083 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2085 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2065);
    float _2087 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2079);
    float _2089 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2081);
    float _2091 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2083);
    float _2093 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2077);
    float _2095 = _2087 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2097 = in.m_73.x;
    float _2099 = in.m_73.y;
    float _2101 = in.m_73.z;
    bool _2103 = _1506 != 0.0;
    bool _2105 = isnan(_1506);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(0.0);
    bool _2111 = _2107 || _2109;
    float _2113 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2115 = 1.0 / _2095;
    float _2117 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2119 = _1504 == 0.0;
    bool _2121 = !_2111;
    bool _2123 = _2119 && _2121;
    float _2125 = -_1536;
    float _2127 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2113);
    float _2129 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2131 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2133 = _1508 == 0.0;
    bool _2135 = _2133 && _2123;
    float _2137 = -_1536;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2117);
    float _2141 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2085);
    float _2143 = _2129 + _2095;
    float _2145 = -_1536;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2131);
    float _2149 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2089);
    float _2151 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2153 = 0.0;
    float _2155 = _2091;
    float _2157 = _2151;
    if (!_2075)
    {
        _2153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2159 = _2153;
    float _2161 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2091);
    float _2163 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2165 = _2143 * _2115;
    float _2167 = _2165 * 0.5;
    float _2169 = _1564 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2171 = _2169;
    if (!_2075)
    {
        _2155 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2173 = _2155;
    float _2175 = _1932 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2177 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2151);
    float _2179 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2163);
    if (!_2075)
    {
        float _2181 = -_2159;
        float _2183 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2181);
        _2157 = _2183;
    }
    float _2185 = _2157;
    float _2187 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2169);
    if (!_2075)
    {
        float _2189 = -_2173;
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2171 = _2191;
    }
    float _2193 = _2171;
    float _2195 = _2099;
    float _2197 = _2097;
    float _2199 = _2101;
    if (!_2135)
    {
        float _2201 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2099);
        _2195 = _2201;
    }
    float _2203 = _2195;
    float _2205 = exp2(_2175);
    if (!_2135)
    {
        float _2207 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2097);
        _2197 = _2207;
    }
    float _2209 = _2197;
    float _2211 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2127);
    if (!_2135)
    {
        float _2213 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2101);
        _2199 = _2213;
    }
    float _2215 = _2199;
    float _2217 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2139);
    float _2219 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2147);
    float _2221 = _2211 * _2203;
    float _2223 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2179);
    float _2225 = _1506;
    float _2227 = _2221;
    if (!_2075)
    {
        float _2229 = 1.0 / _2185;
        _2225 = _2229;
    }
    float _2231 = _2225;
    float _2233 = _2217 * _2203;
    float _2235 = _2219 * _2203;
    float _2237 = fma(_2149, _2209, _2221);
    float _2239 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2241 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2177);
    float _2243 = fma(_2141, _2209, _2233);
    float _2245 = fma(_2161, _2209, _2235);
    float _2247 = _2193;
    if (!_2075)
    {
        float _2249 = 1.0 / _2193;
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2187);
    float _2255 = fma(_2223, _2215, _2237);
    float _2257 = _1974 * 0.5;
    float _2259 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2239);
    float _2261 = -_2205;
    float _2263 = _2261 + 1.0;
    float _2265 = fma(_2241, _2215, _2243);
    float _2267 = fma(_2253, _2215, _2245);
    float _2269 = _2231;
    if (!_2075)
    {
        float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2273 = -_2173;
        float _2275 = fma(_2231, _2271, _2273);
        _2269 = _2275;
    }
    float _2277 = _2269;
    if (_2075)
    {
        _2227 = 1.0;
    }
    float _2279 = _2227;
    float _2281 = fma(_2002, -0.5, _2257);
    float _2283 = fma(_1926, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2259);
    float _2285 = _2263 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.x = _2255;
    out.m_75.y = _2265;
    out.m_75.z = _2267;
    float _2287 = _2020 + _1974;
    float _2289 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2283);
    float _2291 = _2279;
    if (!_2075)
    {
        float _2293 = _2277 * _2251;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2291 = _2295;
    }
    float _2297 = _2291;
    float _2299 = _2287 * 0.5;
    float _2301 = _2289 + _1974;
    float _2303 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2305 = _2297 > 0.0;
    bool _2307 = isnan(_2297);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan(0.0);
    bool _2313 = _2309 || _2311;
    out.m_77.x = _1728;
    out.m_77.y = _1724;
    out.m_77.z = _1732;
    float _2315 = _2301 * 0.5;
    float _2317 = _2303 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2020;
    out.gl_Position.y = _2002;
    out.gl_Position.z = _2289;
    out.gl_Position.w = _1974;
    out.m_79.x = _2299;
    out.m_79.y = _2281;
    out.m_79.z = _2315;
    out.m_79.w = _1974;
    out.m_45.x = _2317;
    float _2319 = _2285 * _2032;
    float _2321 = -_2285;
    float _2323 = _2321 + 1.0;
    float _2325 = _2049 * _2319;
    float _2327 = _2049 * _2323;
    float _2329 = _2059 * _2319;
    float _2331 = fma(_2055, _2325, _2043);
    float _2333 = fma(_2057, _2325, _2045);
    float _2335 = fma(_2049, _2329, _2047);
    out.m_81.x = _2331;
    out.m_81.y = _2333;
    out.m_81.z = _2335;
    out.m_81.w = _2327;
    if (_2313)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2337 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2337;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

